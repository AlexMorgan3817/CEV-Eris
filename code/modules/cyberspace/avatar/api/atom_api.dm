/atom
	var/datum/CyberSpaceAvatar/CyberAvatar
	var/CyberAvatar_inittype

/datum/CyberSpaceAvatar/SetOwner(atom/nOwner)
	. = ..()
	if(Owner)
		if(ismovable(Owner))
			GLOB.moved_event.register(Owner, src, /datum/CyberSpaceAvatar/proc/UpdateIcon)
		GLOB.dir_set_event.register(Owner, src, /datum/CyberSpaceAvatar/proc/UpdateIcon)
		GLOB.destroyed_event.register(Owner, src, /datum/proc/Destroy)

/atom/update_icon()
	. = ..()
	if(istype(CyberAvatar))
		CyberAvatar.UpdateIcon()

/datum/CyberSpaceAvatar/Destroy()
	GLOB.moved_event.unregister(Owner, src, /datum/CyberSpaceAvatar/proc/UpdateIcon)
	GLOB.dir_set_event.unregister(Owner, src, /datum/CyberSpaceAvatar/proc/UpdateIcon)
	SetOwner()
	. = ..()

/atom/Destroy()
	qdel(CyberAvatar)
	. = ..()

/atom/Initialize()
	. = ..()
	if(CyberAvatar && !istype(CyberAvatar))
		CreateCA(CyberAvatar)

/atom/proc/CreateCA(_color)
	if(istype(CyberAvatar))
		qdel(CyberAvatar)
	if(ispath(CyberAvatar_inittype))
		CyberAvatar = new CyberAvatar_inittype(src)
	else
		CyberAvatar = new(src)
	if(_color)
		CyberAvatar.SetColor(_color)

/atom/proc/DestroyCA()
	qdel(CyberAvatar)