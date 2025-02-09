/datum/reagent/water
	hydration = 5

/datum/reagent/water/on_mob_life(mob/living/carbon/M)
	M.adjust_thirst(hydration)
	. = ..()

/datum/reagent/dragon_blood
	name = "Dragon blood"
	description = "Dragon blood, who woulda thought!"
	color = "#811b1e" // RGB (129, 27, 30)
	can_synth = FALSE
	taste_description = "ash"

/datum/reagent/dragon_blood/reaction_mob(mob/living/L, method=TOUCH, reac_volume, show_message = 1, touch_protection = 0)
	if(method==PATCH || method==INGEST || method==INJECT || (method == VAPOR && prob(min(reac_volume,100)*(1 - touch_protection))))
		L.ForceContractDisease(new /datum/disease/transformation/dragon(), FALSE, TRUE)

/datum/reagent/consumable/semen
	// Prevents dripping from drinking a glass or other weird cases
	var/amount_to_drip = 0

/datum/reagent/consumable/semen/on_mob_life(mob/living/carbon/M)
	. = ..()
	if(amount_to_drip && M.is_groin_exposed())
		amount_to_drip = max(0, amount_to_drip - metabolization_rate)
		var/obj/effect/decal/cleanable/semendrip/drip = new(get_turf(M))
		drip.add_blood_DNA(data)

/*/datum/reagent/dragon_blood/admin
	name = "Special dragon blood"
	description = "It looks weird"
	color = "#811b1e" // RGB (129, 27, 30)
	can_synth = FALSE
	taste_description = "ashes"

/datum/reagent/dragons_blood/admin/reaction_mob(mob/living/L, method=TOUCH, reac_volume, show_message = 1, touch_protection = 0)
	if(method==PATCH || method==INGEST || method==INJECT || (method == VAPOR && prob(min(reac_volume,100)*(1 - touch_protection))))
		to_chat(user, "<span class='danger'>Power courses through you! You can now shift your form at will.</span>")
		var/obj/effect/proc_holder/spell/targeted/shapeshift/dragon/D = new
		var/user.mind.AddSpell(D)
*/ //FIX THIS SHIT
