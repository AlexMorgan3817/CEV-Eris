/datum/computer_file/cyberdeck_program
	filetype = "CSP"
	size = 16
	var/Clonable = TRUE
	clone(rename = FALSE, soft = 0) // If you don't want to check clonability then set soft to 1 when you call clone, maybe can used by ices that clone enemy program and use it 
		if(Clonable || !soft)
			. = ..()
		