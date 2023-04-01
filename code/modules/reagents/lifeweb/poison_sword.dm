/obj/item
    var/list/poisoned = list()

/obj/item/reagent_containers/attackby(obj/item/W, mob/user)
    if(!ishuman(user))
        return ..()
    if(istype(src, /obj/item/reagent_containers/syringe))
        return ..()
    if(istype(src,/obj/item/reagent_containers/pill))
        return ..()
    if(W.sharp || W.edge)
        if(reagents.total_volume >= reagents?.reagent_list.len)
            for(var/datum/reagent/R in reagents?.reagent_list)
                if(R.volume <= 1)
                    reagents?.remove_reagent("[R.id]", volume)
                    W.poisoned += list(list(R.id, volume))
                    continue
                reagents?.remove_reagent("[R.id]", 1)
                W.poisoned += list(list(R.id, 1))
            to_chat(user, "<span class='combatbold'>You submerge [W.name] in the liquids.</span>")