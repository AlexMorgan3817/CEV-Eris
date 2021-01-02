/atom
	var/image/CyberspaceAvatar = FALSE
	var/CyberSpaceColor = CYBERSPACE_MAIN_COLOR

/atom/proc/GetCyberSpaceAvatar(add = TRUE)
	CyberspaceAvatar = add
	UpdateCyberSpaceAvatar()

/atom/proc/UpdateCyberSpaceAvatar()
	if(CyberspaceAvatar)
		CyberspaceAvatar = image(,src)
		CyberspaceAvatar.plane = HUD_PLANE
		CyberspaceAvatar.layer = HUD_LAYER - 0.1
		CyberspaceAvatar.icon = getHologramIcon(build_composite_icon(src), 0, 0.9, CyberSpaceColor)
		SScyberspace.CyberSpaceAtoms |= src
		SScyberspace.CyberSpaceViewUpdate()
	else if(src in SScyberspace.CyberSpaceAtoms)
		SScyberspace.CyberSpaceAtoms -= src
		SScyberspace.CyberSpaceViewUpdate()

/atom/proc/ShowCyberSpaceAvatar(client/C)
	if(CyberspaceAvatar && !istype(CyberspaceAvatar))
		UpdateCyberSpaceAvatar()
	C.images |= CyberspaceAvatar

/atom/proc/HideCyberSpaceAvatar(client/C)
	if(istype(CyberspaceAvatar))
		C.images -= CyberspaceAvatar

/atom/Initialize()
	. = ..()
	if(CyberspaceAvatar)
		SScyberspace.CyberSpaceAtoms |= src
/*//what if we will init cyberavatar only when encounter it
	if(CyberspaceAvatar)
		UpdateCyberSpaceAvatar()
*/
/atom/Destroy()
	if(src in SScyberspace.CyberSpaceAtoms)
		SScyberspace.CyberSpaceAtoms -= src
		SScyberspace.CyberSpaceViewUpdate()
/*Need to adapt GC system for images
	if(istype(CyberspaceAvatar))
		qdel(CyberspaceAvatar)
*/
	. = ..()

/atom/update_icon()
	. = ..()
	UpdateCyberSpaceAvatar()
