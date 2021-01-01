SUBSYSTEM_DEF(cyberspace)
	name = "Cyberspace"
	flags = SS_NO_FIRE
	init_order = INIT_ORDER_ATOMS + 0.5
	var/tmp/list/CyberSpaceAtoms = list()
	var/tmp/list/CyberSpaceViewers = list()

/datum/controller/subsystem/cyberspace/proc/CyberSpaceViewUpdate(client/C = null)//if null => will update all viewers in
	if(istype(C) && C.mob)
		UpdateVision(C.mob)
	else
		for(var/mob/viewer in CyberSpaceViewers)
			UpdateVision(viewer)

/datum/controller/subsystem/cyberspace/proc/UpdateVision(mob/viewer)
	if(viewer.client)
		viewer.client.UpdateCyberSpaceVision()

/datum/controller/subsystem/cyberspace/proc/ShowAtomsTo(mob/viewer)
	if(viewer.client)
		for(var/atom/Atom in CyberSpaceAtoms)
			if(get_dist(viewer, Atom) <= viewer.client.view + 1)
				Atom.ShowCyberSpaceAvatar(viewer.client)
