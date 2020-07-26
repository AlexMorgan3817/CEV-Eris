/datum/trade_station/station_zarya
	name_pool = list("FTS 'Zarya'" = "Free Trade Station 'Zarya', they sending message \"Privet, kosmicheskiy strannik, u nas mnogo engenernih nishtyakov, zaletai!\".")
	start_discovered = TRUE
	assortiment = list(
		"Vozduh" = list(
			/obj/machinery/portable_atmospherics/canister/sleeping_agent,
			/obj/machinery/portable_atmospherics/canister/nitrogen,
			/obj/machinery/portable_atmospherics/canister/oxygen,
			/obj/item/weapon/tank/plasma,
			/obj/machinery/pipedispenser/orderable,
			/obj/machinery/pipedispenser/disposal/orderable,
		),
		"Energiya" = list(
			/obj/item/weapon/circuitboard/shield_diffuser,
			/obj/item/weapon/circuitboard/shield_generator,
			/obj/item/weapon/cell/large,
			/obj/item/weapon/cell/large/high,
			/obj/item/solar_assembly,
			/obj/item/weapon/circuitboard/solar_control,
			/obj/item/weapon/tracker_electronics,
			/obj/machinery/power/emitter,
			/obj/machinery/power/rad_collector,
			/obj/machinery/power/supermatter,
			/obj/machinery/power/generator,
			/obj/machinery/atmospherics/binary/circulator,
			/obj/item/clothing/gloves/insulated,
		),
		"Vsyakoe" = list(
			/obj/structure/reagent_dispensers/watertank,
			/obj/item/weapon/storage/briefcase/inflatable,
			/obj/item/stack/material/steel/full,
			/obj/item/weapon/storage/belt/utility/full,
			/obj/item/clothing/head/welding,
			/obj/item/weapon/tool/omnitool,
			/obj/structure/reagent_dispensers/fueltank,
			/obj/machinery/floodlight
		),
	)

	offer_types = list()
