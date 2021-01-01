/atom
	var/image/CyberspaceAvatar = FALSE
	var/CyberSpaceColor = CYBERSPACE_MAIN_COLOR

/atom/proc/UpdateCyberSpaceAvatar()
	if(CyberspaceAvatar)
		CyberspaceAvatar = image(,src)
		CyberspaceAvatar.icon = getHologramIcon(build_composite_icon(src), 0, 0.9, CyberSpaceColor)
		SScyberspace.CyberSpaceAtoms |= src
		SScyberspace.CyberSpaceViewUpdate()
	else if(src in SScyberspace.CyberSpaceAtoms)
		SScyberspace.CyberSpaceAtoms -= src
		SScyberspace.CyberSpaceViewUpdate()


/atom/proc/ShowCyberSpaceAvatar(client/C)
	C.images |= CyberspaceAvatar

/atom/LateInitialize()
	. = ..()
	if(CyberspaceAvatar)
		UpdateCyberSpaceAvatar()

/atom/Destroy()
	if(src in SScyberspace.CyberSpaceAtoms)
		SScyberspace.CyberSpaceAtoms -= src
		SScyberspace.CyberSpaceViewUpdate()
/*
	if(istype(CyberspaceAvatar))
		qdel(CyberspaceAvatar)
*/
	. = ..()

/atom/update_icon()
	. = ..()
	if(CyberspaceAvatar)
		UpdateCyberSpaceAvatar()
