//Santa spells!
/obj/effect/proc_holder/spell/aoe/conjure/presents
	name = "Conjure Presents!"
	desc = "This spell lets you reach into S-space and retrieve presents! Yay!"
	school = "santa"
	charge_max = 600
	clothes_req = NONE
	invocation = "HO HO HO"
	invocation_type = "shout"
	range = 3
	cooldown_min = 50

	summon_type = list("/obj/item/a_gift")
	summon_lifespan = 0
	summon_amt = 5
	antimagic_allowed = TRUE
