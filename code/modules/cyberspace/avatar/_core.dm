/datum/CyberspaceAvatar
	var/Active = TRUE
	var/image/Icon
	var/atom/Owner
	var/Color = CYBERSPACE_MAIN_COLOR

/datum/CyberspaceAvatar/New(atom/nOwner)
	if(nOwner)
		Owner = nOwner
		SScyberspace.CyberSpaceAtoms |= owner

/datum/CyberspaceAvatar/proc/SyncVisual()
	if(Owner)
		if(!Icon)
			Icon = image_copy_of(Owner)
		MAKE_EQUAL_IF_NOT_EQUAL(Icon, Owner, overlays)
		MAKE_EQUAL_IF_NOT_EQUAL(Icon, Owner, icon_state)
