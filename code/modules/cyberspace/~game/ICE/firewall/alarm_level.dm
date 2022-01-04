/obj/machinery/power/apc
	var/CyberAlarmLevel = 0
	var/DefaultLevelDelta = 0.2
	var/list/AlarmLevelsToProcs = list(
		"1" = .proc/DeployIces,
		"2" = list(.proc/DeployIces, 1),
		"3" = list(.proc/DeployIces, 2),
		"4" = list(\
			.proc/DeployIces, list(1, /mob/observer/cyber_entity/IceHolder/black_ice),\
			.proc/AnnounceAlarm, null\
		)
	)
	var/obj/item/device/radio/Announcer = new

	var/list/ICEAssortiment = list(
		/mob/observer/cyber_entity/IceHolder/cyberassassin,
		/mob/observer/cyber_entity/IceHolder/spooklet,
		/mob/observer/cyber_entity/IceHolder/spearman
	)

	var/list/MyIces = list()

	var/tmp/list/recentEnterers = list()
	var/entererDeleteTime = 3 SECONDS

/area/Entered(atom/movable/Obj,atom/OldLoc)
	. = ..()
	var/obj/machinery/power/apc/A = locate(/obj/machinery/power/apc) in src
	if(A)
		A.SomeOneEnteredArea(Obj)

/obj/machinery/power/apc/proc/SomeOneEnteredArea(atom/movable/someone)
	if(istype(CyberAvatar) && istype(someone, /mob/observer/cyber_entity/cyberspace_eye))
		var/mob/observer/cyber_entity/cyberspace_eye/E = someone
		to_world("[E]")
		if(!CheckCyberAccess(E) && !(E in recentEnterers))
			RaiseAlarmLevel(DefaultLevelDelta)
			recentEnterers.Add(E)
			addtimer(CALLBACK(src, .proc/RemoveFromRecentEnterers, E), entererDeleteTime)
/obj/machinery/power/apc/proc/RemoveFromRecentEnterers(mob/E)
	to_world(json_encode(recentEnterers))
	recentEnterers -= E
	to_world(json_encode(recentEnterers))
/obj/machinery/power/apc/Process(wait)
	. = ..()
	RaiseAlarmLevel(-DefaultLevelDelta * wait) //0.1 per second

/obj/machinery/power/apc/proc/RaiseAlarmLevel(value = DefaultLevelDelta)
	if(value <= 0)
		return
	var/old_value = FLOOR(CyberAlarmLevel, 1)
	CyberAlarmLevel += value
	var/current = FLOOR(CyberAlarmLevel, 1)
	if(old_value != current)
		var/l = length(AlarmLevelsToProcs)
		var/toobig = (old_value > l)
		var/delta = current - old_value
		for(var/i in 1 to delta)
			if(toobig)
				TriggerAlarmLevelEffect(AlarmLevelsToProcs[l])
			else
				TriggerAlarmLevelEffect("[old_value + i]")
		return delta

/obj/machinery/power/apc/proc/TriggerAlarmLevelEffect(textLevel)
	if(textLevel in AlarmLevelsToProcs)
		var/list/procToCall = AlarmLevelsToProcs[textLevel]
		if(istype(procToCall) && length(procToCall) >= 2)
			for(var/i in 2 to length(procToCall) step 2)
				call(src, procToCall[i-1])(procToCall[i])
			return
		call(src, AlarmLevelsToProcs[textLevel])()

/obj/machinery/power/apc/proc/DeployIces(list/arguments = 1) // amount; [amount, forced_type]
	var/area/A = get_area(src)
	var/list/amount = arguments
	. = 0
	if(isnum(amount))
		for(var/i in 1 to . + amount)
			CreateICE(pick(ICEAssortiment), pick_area_turf(A))
		for(var/obj/machinery/cyber_security_server/S in get_area(src))
			CreateICE(pick(ICEAssortiment), get_turf(S))
	else if(islist(amount))
		var/forcedIceType
		if(length(amount) >= 2)
			forcedIceType = amount[2]
		. += amount[1]
		for(var/i in 1 to .)
			var/mob/observer/cyber_entity/IceHolder/t = forcedIceType
			if(!forcedIceType)
				t = pick(ICEAssortiment)
			CreateICE(t, pick_area_turf(A))
		for(var/obj/machinery/cyber_security_server/S in get_area(src))
			var/mob/observer/cyber_entity/IceHolder/t = forcedIceType
			if(!forcedIceType)
				t = pick(ICEAssortiment)
			CreateICE(t, get_turf(S))

/obj/machinery/power/apc/proc/CreateICE(mob/observer/cyber_entity/IceHolder/prefab, turf/where)
	var/mob/observer/cyber_entity/IceHolder/I = new prefab(where)
	I.MyFirewall = src
	MyIces += I

/obj/machinery/power/apc/proc/ScanAreaRevealXYZOfRunners(list/arguments)
	. = 0
	radio_message("Intrusion alert, probbing area.")
	for(var/mob/observer/cyber_entity/cyberspace_eye/r in get_area(src))
		spawn(. SECONDS + rand(1, 3) SECONDS)
			if(!QDELETED(r) && r.owner)
				var/turf/host = get_turf(r.owner)
				radio_message("Trasing complete: ZXY:([host.z]:[host.x]:[host.y]).")
		. += 1

/obj/machinery/power/apc/proc/AnnounceAlarm(list/arguments)
	. = radio_message("Cyberspace alarm level has reached [CyberAlarmLevel]. Area ZXY:([z]:[x]:[y]).")

/obj/machinery/power/apc/proc/radio_message(msg, author = "Intrusion Countermeasures Engrams' System", _name = name)
	return Announcer.autosay(
		SPAN_WARNING("[_name]: ") + "[msg]",
		author
	)


/atom/proc/RaiseAlarmLevelInArea(value)
	var/obj/machinery/power/apc/pc = locate(/obj/machinery/power/apc) in get_area(src)
	if(istype(pc))
		pc.RaiseAlarmLevel(value)
		. = ..()
