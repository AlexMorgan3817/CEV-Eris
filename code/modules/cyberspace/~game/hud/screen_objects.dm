/obj/screen/movable/cyberspace_eye
	name = "cyberspace hud"
	icon = 'icons/obj/cyberspace/hud/common.dmi'
	icon_state = "base"

/obj/screen/movable/cyberspace_eye/Click(location, control, params)
	return istype(parentmob)

/obj/screen/movable/cyberspace_eye/exit
	name = "Jack Out"
	icon_state = "jack_out"

/obj/screen/movable/cyberspace_eye/exit/Click()
	. = ..()
	if(.)
		var/mob/observer/cyberspace_eye/avatar = parentmob
		if(istype(avatar))
			avatar.ReturnToBody()

/obj/screen/movable/cyberspace_eye/QuantumPointsCounter
	name = "QP Counter"
	icon_state = "counter"

/obj/screen/movable/cyberspace_eye/QuantumPointsCounter/on_update_icon()
	var/mob/observer/cyberspace_eye/avatar = parentmob
	if(istype(avatar))
		var/obj/item/weapon/computer_hardware/deck/myDeck = avatar.owner
		if(istype(myDeck))
			maptext = "QP:[myDeck.QuantumPoints]"

/obj/screen/movable/cyberspace_eye/chips
	name = "Chip"
	icon_state = "base"

	var/obj/item/weapon/deck_hardware/chip/myChip

/obj/screen/movable/cyberspace_eye/chips/Click(location, control, params)
	. = ..()
	if(istype(myChip))
		myChip.Activate()
