SUBSYSTEM_DEF(cyberspace)
	name = "Cyberspace"
	flags = SS_NO_FIRE
	init_order = INIT_ORDER_ATOMS + 0.5
	var/tmp/list/CyberSpaceAtoms = list()
	var/tmp/list/CyberSpaceViewers = list()

/datum/controller/subsystem/cyberspace/proc/CyberSpaceViewUpdate(client/C = null)//if null => will update all viewers in
	if(istype(C) && C.mob)
		update_vision(C.mob)
	else
		for(var/mob/viewer in CyberSpaceViewers)
			update_vision(viewer)

/datum/controller/subsystem/cyberspace/proc/update_vision(mob/viewer)
	if(viewer)
		viewer.UpdateCyberSpaceVision()

/datum/controller/subsystem/cyberspace/proc/ShowAtomsTo(mob/viewer)
	if(!CyberSpaceViewers.Find(viewer))
		CyberSpaceViewers |= viewer
	if(viewer.client)
		for(var/atom/Atom in CyberSpaceAtoms)
			if(get_dist(viewer, Atom) <= viewer.client.view + 1)
				Atom.ShowCyberSpaceAvatar(viewer.client)

/datum/controller/subsystem/cyberspace/proc/HideAtomsFrom(mob/viewer)
	if(CyberSpaceViewers.Find(viewer))
		CyberSpaceViewers -= viewer
		if(viewer.client)
			for(var/atom/Atom in CyberSpaceAtoms)
				if(get_dist(viewer, Atom) <= viewer.client.view + 1)
					Atom.HideCyberSpaceAvatar(viewer.client)
	
