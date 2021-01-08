/proc/image_copy_of(atom/A, atom/connected_to = null)
	var/image/copy = image(A.icon, connected_to, A.icon_state, A.layer, A.dir)
	for(var/overlay in A.overlays)
		var/image/overlay_image = overlay
		if(istype(overlay_image))
			copy.overlays += overlay_image.Copy()
			continue
		copy.overlays += O
	return composite

/image/proc/Copy()
	var/image/copy = new()
	var/list/var_black_list = list("type", "overlays", "underlays")
	for(var/i in vars)
		try
			if(var_black_list.Find(i))
				continue
			copy.vars[i] = vars[i]
	for(var/i in overlays)
		var/image/overlay_image = overlay
		if(istype(overlay_image))
			copy.overlays += overlay_image.Copy()
			continue
		copy.overlays += O
	return copy

/proc/GetAlphaOverlay(iconOfOverlay, stateOfOverlay, loc = null)
	var/image/M = image(iconOfOverlay, loc, stateOfOverlay)
	M.blend_mode = ICON_SUBTRACT
	return M
