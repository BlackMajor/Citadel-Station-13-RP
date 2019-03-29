<<<<<<< HEAD
// APC HULL

/obj/item/frame/apc
	name = "\improper APC frame"
	desc = "Used for repairing or building APCs"
	icon = 'icons/obj/apc_repair.dmi'
	icon_state = "apc_frame"
	flags = CONDUCT

/obj/item/frame/apc/attackby(obj/item/weapon/W as obj, mob/user as mob)
	..()
	if (W.is_wrench())
		new /obj/item/stack/material/steel( get_turf(src.loc), 2 )
		qdel(src)

/obj/item/frame/apc/try_build(turf/on_wall, mob/user as mob)
	if (get_dist(on_wall, user)>1)
		return
	var/ndir = get_dir(user, on_wall)
	if (!(ndir in cardinal))
		return
	var/turf/loc = get_turf(user)
	var/area/A = loc.loc
	if (!istype(loc, /turf/simulated/floor))
		to_chat(user, "<span class='warning'>APC cannot be placed on this spot.</span>")
		return
	if (A.requires_power == 0 || istype(A, /area/space))
		to_chat(user, "<span class='warning'>APC cannot be placed in this area.</span>")
		return
	if (A.get_apc())
		to_chat(user, "<span class='warning'>This area already has an APC.</span>")
		return //only one APC per area
	for(var/obj/machinery/power/terminal/T in loc)
		if (T.master)
			to_chat(user, "<span class='warning'>There is another network terminal here.</span>")
			return
		else
			var/obj/item/stack/cable_coil/C = new /obj/item/stack/cable_coil(loc)
			C.amount = 10
			to_chat(user, "You cut the cables and disassemble the unused power terminal.")
			qdel(T)
	new /obj/machinery/power/apc(loc, ndir, 1)
	qdel(src)
=======
// APC HULL

/obj/item/frame/apc
	name = "\improper APC frame"
	desc = "Used for repairing or building APCs"
	icon = 'icons/obj/apc_repair.dmi'
	icon_state = "apc_frame"

/obj/item/frame/apc/attackby(obj/item/weapon/W as obj, mob/user as mob)
	..()
	if (W.is_wrench())
		new /obj/item/stack/material/steel( get_turf(src.loc), 2 )
		qdel(src)

/obj/item/frame/apc/try_build(turf/on_wall, mob/user as mob)
	if (get_dist(on_wall, user)>1)
		return
	var/ndir = get_dir(user, on_wall)
	if (!(ndir in cardinal))
		return
	var/turf/loc = get_turf(user)
	var/area/A = loc.loc
	if (!istype(loc, /turf/simulated/floor))
		to_chat(user, "<span class='warning'>APC cannot be placed on this spot.</span>")
		return
	if (A.requires_power == 0 || istype(A, /area/space))
		to_chat(user, "<span class='warning'>APC cannot be placed in this area.</span>")
		return
	if (A.get_apc())
		to_chat(user, "<span class='warning'>This area already has an APC.</span>")
		return //only one APC per area
	for(var/obj/machinery/power/terminal/T in loc)
		if (T.master)
			to_chat(user, "<span class='warning'>There is another network terminal here.</span>")
			return
		else
			var/obj/item/stack/cable_coil/C = new /obj/item/stack/cable_coil(loc)
			C.amount = 10
			to_chat(user, "You cut the cables and disassemble the unused power terminal.")
			qdel(T)
	new /obj/machinery/power/apc(loc, ndir, 1)
	qdel(src)
>>>>>>> 12f9d4a... Merge pull request #4831 from VOREStation/upstream-merge-5987
