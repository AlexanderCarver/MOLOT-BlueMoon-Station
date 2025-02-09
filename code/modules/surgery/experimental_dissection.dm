#define BASE_HUMAN_REWARD 500

/datum/surgery/advanced/experimental_dissection
	name = "Dissection"
	desc = "A surgical procedure which analyzes the biology of a corpse, and automatically adds new findings to the research database."
	steps = list(/datum/surgery_step/incise,
				/datum/surgery_step/retract_skin,
				/datum/surgery_step/clamp_bleeders,
				/datum/surgery_step/dissection,
				/datum/surgery_step/clamp_bleeders,
				/datum/surgery_step/close)
	possible_locs = list(BODY_ZONE_CHEST)
	target_mobtypes = list(/mob/living) //Feel free to dissect devils but they're magic.
	replaced_by = /datum/surgery/advanced/experimental_dissection/adv
	requires_tech = FALSE
	var/value_multiplier = 1

/datum/surgery/advanced/experimental_dissection/can_start(mob/user, mob/living/target, obj/item/tool)
	. = ..()
	if(HAS_TRAIT_FROM(target, TRAIT_DISSECTED,"[name]"))
		return FALSE
	if(target.stat != DEAD)
		return FALSE

/datum/surgery_step/dissection
	name = "dissection"
	implements = list(/obj/item/scalpel/alien = 100, /obj/item/scalpel/advanced = 99, /obj/item/scalpel = 90, /obj/item/kitchen/knife = 45, /obj/item/shard = 25)// special tools not only cut down time but also improve probability, doesn't use TOOL_SCALPEL because different scalpels have different probs
	time = 100
	silicons_obey_prob = TRUE
	repeatable = TRUE

/datum/surgery_step/dissection/preop(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	display_results(user, target, "<span class='notice'>You start dissecting [target].</span>",
	"[user] starts dissecting [target].",
	"[user] starts dissecting [target].")

/datum/surgery_step/dissection/proc/check_value(mob/living/target, datum/surgery/advanced/experimental_dissection/ED)
	var/cost = BASE_HUMAN_REWARD
	var/multi_surgery_adjust = 0

	//determine bonus applied
	if(isalienroyal(target))
		cost = (BASE_HUMAN_REWARD*10)
	else if(isalienadult(target))
		cost = (BASE_HUMAN_REWARD*5)
	else if(ismonkey(target))
		cost = (BASE_HUMAN_REWARD*0.5)
	else if(ishuman(target))
		var/mob/living/carbon/human/H = target
		if(H?.dna?.species)
			if(isabductor(H))
				cost = (BASE_HUMAN_REWARD*4)
			else if(isgolem(H) || iszombie(H))
				cost = (BASE_HUMAN_REWARD*3)
			/*else if(isjellyperson(H) || ispodperson(H)) CITADEL CHANGE: jelly and pod being available roundstart shouldn't give additional points
				cost = (BASE_HUMAN_REWARD*2)*/
	else
		cost = (BASE_HUMAN_REWARD * 0.6)



	//now we do math for surgeries already done (no double dipping!).
	for(var/i in typesof(/datum/surgery/advanced/experimental_dissection))
		var/datum/surgery/advanced/experimental_dissection/cringe = i
		if(HAS_TRAIT_FROM(target,TRAIT_DISSECTED,"[initial(cringe.name)]"))
			multi_surgery_adjust = max(multi_surgery_adjust,initial(cringe.value_multiplier)) - 1

	multi_surgery_adjust *= cost

	//multiply by multiplier in surgery
	cost *= ED.value_multiplier
	return (cost-multi_surgery_adjust)

/datum/surgery_step/dissection/success(mob/user, mob/living/target, target_zone, obj/item/tool, datum/surgery/surgery)
	var/points_earned = check_value(target, surgery)
	display_results(user, target, "<span class='notice'>You dissect [target], and add your [points_earned] point\s worth of discoveries to the research database!</span>",
	"[user] dissects [target], discovering [points_earned] point\s of data!",
	"[user] dissects [target]!")
	SSresearch.science_tech.add_point_list(list(TECHWEB_POINT_TYPE_GENERIC = points_earned))
	var/obj/item/bodypart/L = target.get_bodypart(BODY_ZONE_CHEST)
	target.apply_damage(80, BRUTE, L, wound_bonus=CANT_WOUND)
	ADD_TRAIT(target, TRAIT_DISSECTED, "[surgery.name]")
	repeatable = FALSE
	return TRUE

/datum/surgery_step/dissection/failure(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	display_results(user, target, "<span class='notice'>You dissect [target], but do not find anything particularly interesting.</span>",
	"[user] dissects [target], however it seems [user.ru_who()] didn't find anything useful.",
	"[user] dissects [target], but looks a little dissapointed.")
	SSresearch.science_tech.add_point_list(list(TECHWEB_POINT_TYPE_GENERIC = (round(check_value(target, surgery) * 0.01))))
	var/obj/item/bodypart/L = target.get_bodypart(BODY_ZONE_CHEST)
	target.apply_damage(80, BRUTE, L, wound_bonus=CANT_WOUND)
	return TRUE

/datum/surgery/advanced/experimental_dissection/adv
	name = "Thorough Dissection"
	value_multiplier = 2
	replaced_by = /datum/surgery/advanced/experimental_dissection/exp
	requires_tech = TRUE

/datum/surgery/advanced/experimental_dissection/exp
	name = "Experimental Dissection"
	value_multiplier = 5
	replaced_by = /datum/surgery/advanced/experimental_dissection/alien
	requires_tech = TRUE

/datum/surgery/advanced/experimental_dissection/alien
	name = "Extraterrestrial Dissection"
	value_multiplier = 10
	requires_tech = TRUE
	replaced_by = null

#undef BASE_HUMAN_REWARD
