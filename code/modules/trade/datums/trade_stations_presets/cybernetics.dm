/datum/trade_station/cybermoebus
	name_pool = list("FTS 'PentaOptium'" = "Free Trade Station 'PentaOptium'. \"Oh, you, i think i can sold you some cybernetics.\"")
	assortiment = list(
		category_data("Synthetic Libms", list(SPAWN_PROSTHETIC)),
		"What? How it get on board?" = list(
			/obj/item/organ/external/robotic/one_star/l_arm = good_data("What? Left Arm", list(-8, 3)),
			/obj/item/organ/external/robotic/one_star/r_arm = good_data("What? Right Arm", list(-8, 3)),
			/obj/item/organ/external/robotic/one_star/l_leg = good_data("What? Left Leg", list(-8, 3)),
			/obj/item/organ/external/robotic/one_star/r_leg = good_data("What? Right Leg", list(-8, 3))
		)
	)
