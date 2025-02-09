/datum/outfit/ert
	name = "ERT Common"

	mask = /obj/item/clothing/mask/gas/sechailer
	uniform = /obj/item/clothing/under/syndicate/combat/ert
	shoes = /obj/item/clothing/shoes/combat/swat
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	ears = /obj/item/radio/headset/headset_cent/alt

/datum/outfit/ert/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE, client/preference_source)
	if(visualsOnly)
		return

	var/obj/item/implant/mindshield/L = new
	L.implant(H, null, 1)

	var/obj/item/radio/R = H.ears
	R.set_frequency(FREQ_CENTCOM)
	R.freqlock = TRUE

	var/obj/item/card/id/W = H.wear_id
	if(W)
		W.registered_name = H.real_name
		W.update_label(W.registered_name, W.assignment)

/datum/outfit/ert/commander/green
	name = "ERT Commander - Green Alert"

	id = /obj/item/card/id/ert
	head = /obj/item/clothing/head/helmet/swat/command
	mask = /obj/item/clothing/mask/gas/sechailer
	suit = /obj/item/clothing/suit/armor/hos/command
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	back = /obj/item/storage/backpack/captain
	belt = /obj/item/storage/belt/security/full
	r_hand = /obj/item/gun/energy/e_gun/advtaser
	backpack_contents = list(/obj/item/storage/box/survival/engineer=1,\
		/obj/item/storage/firstaid/tactical/slaver=1,
		/obj/item/crowbar/power=1)
	l_pocket = /obj/item/kitchen/knife/combat

/datum/outfit/ert/commander
	name = "ERT Commander - Blue Alert"

	id = /obj/item/card/id/ert
	suit = /obj/item/clothing/suit/space/hardsuit/ert
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	back = /obj/item/storage/backpack/captain
	belt = /obj/item/storage/belt/security/full
	r_hand = /obj/item/gun/ballistic/automatic/wt550
	backpack_contents = list(/obj/item/storage/box/survival/engineer=1,\
		/obj/item/storage/ifak=1,\
		/obj/item/ammo_box/magazine/wt550m9=3)
	l_pocket = /obj/item/kitchen/knife/combat

/datum/outfit/ert/commander/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE, client/preference_source)
	..()

	if(visualsOnly)
		return
	var/obj/item/radio/R = H.ears
	R.keyslot = new /obj/item/encryptionkey/heads/captain
	R.recalculateChannels()

/datum/outfit/ert/commander/alert
	name = "ERT Commander - Amber Alert"

	mask = /obj/item/clothing/mask/gas/sechailer/swat
	suit = /obj/item/clothing/suit/space/hardsuit/ert/alert
	glasses = /obj/item/clothing/glasses/thermal/eyepatch
	backpack_contents = list(/obj/item/storage/box/survival/engineer=1,\
		/obj/item/melee/baton/loaded=1,\
		/obj/item/storage/ifak=1,\
		/obj/item/ammo_box/magazine/wt550m9=3)
	l_pocket = /obj/item/melee/transforming/energy/sword/saber

/datum/outfit/ert/commander/alert/red
	name = "ERT Commander - Red Alert"
	mask = /obj/item/clothing/mask/gas/sechailer/swat
	r_hand = /obj/item/gun/ballistic/automatic/ar
	backpack_contents = list(/obj/item/storage/box/survival/engineer=1,\
		/obj/item/melee/baton/loaded=1,\
		/obj/item/ammo_box/magazine/m556=3,\
		/obj/item/storage/ifak=1,\
		/obj/item/gun/energy/pulse/pistol/loyalpin=1)

/datum/outfit/ert/security/green
	name = "ERT Security - Green Alert"

	id = /obj/item/card/id/ert/Security
	head = /obj/item/clothing/head/helmet/swat/security
	mask = /obj/item/clothing/mask/gas/sechailer
	suit = /obj/item/clothing/suit/armor/hos/security
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	belt = /obj/item/storage/belt/security/full
	back = /obj/item/storage/backpack/security
	r_hand = /obj/item/gun/energy/e_gun/advtaser
	backpack_contents = list(/obj/item/storage/box/survival/engineer=1,\
		/obj/item/storage/firstaid/tactical/slaver=1,
		/obj/item/storage/box/handcuffs=1,\
		/obj/item/crowbar/power=1)
	l_pocket = /obj/item/kitchen/knife/combat

/datum/outfit/ert/security
	name = "ERT Security - Blue Alert"

	id = /obj/item/card/id/ert/Security
	mask = /obj/item/clothing/mask/gas/sechailer
	suit = /obj/item/clothing/suit/space/hardsuit/ert/sec
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	belt = /obj/item/storage/belt/security/full
	back = /obj/item/storage/backpack/security
	r_hand = /obj/item/gun/ballistic/automatic/wt550
	backpack_contents = list(/obj/item/storage/box/survival/engineer=1,\
		/obj/item/storage/box/handcuffs=1,\
		/obj/item/ammo_box/magazine/wt550m9=3,\
		/obj/item/storage/ifak=1,\
		/obj/item/kitchen/knife/combat=1)

/datum/outfit/ert/security/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE, client/preference_source)
	..()

	if(visualsOnly)
		return

	var/obj/item/radio/R = H.ears
	R.keyslot = new /obj/item/encryptionkey/heads/hos
	R.recalculateChannels()

/datum/outfit/ert/security/alert
	name = "ERT Security - Amber Alert"

	mask = /obj/item/clothing/mask/gas/sechailer/swat
	suit = /obj/item/clothing/suit/space/hardsuit/ert/alert/sec
	backpack_contents = list(/obj/item/storage/box/survival/engineer=1,\
		/obj/item/storage/box/handcuffs=1,\
		/obj/item/melee/baton/loaded=1,\
		/obj/item/storage/ifak=1,\
		/obj/item/ammo_box/magazine/wt550m9=3)

/datum/outfit/ert/security/alert/red
	name = "ERT Security - Red Alert"

	mask = /obj/item/clothing/mask/gas/sechailer/swat
	r_hand = /obj/item/gun/ballistic/automatic/ar
	backpack_contents = list(/obj/item/storage/box/survival/engineer=1,\
		/obj/item/storage/box/handcuffs=1,\
		/obj/item/melee/baton/loaded=1,\
		/obj/item/ammo_box/magazine/m556=3,\
		/obj/item/storage/ifak=1,\
		/obj/item/gun/energy/pulse/carbine/loyalpin=1)

/datum/outfit/ert/medic/green
	name = "ERT Medic - Green Alert"

	id = /obj/item/card/id/ert/Medical
	head = /obj/item/clothing/head/helmet/swat/medical
	mask = /obj/item/clothing/mask/gas/sechailer
	suit = /obj/item/clothing/suit/armor/hos/medical
	glasses = /obj/item/clothing/glasses/hud/health
	back = /obj/item/storage/backpack/satchel/med
	belt = /obj/item/storage/belt/medical/surgery_belt_adv/cmo
	l_hand = /obj/item/storage/firstaid/regular
	r_hand = /obj/item/gun/energy/e_gun/advtaser
	backpack_contents = list(/obj/item/storage/box/survival/engineer=1,\
		/obj/item/storage/firstaid/tactical=1,
		/obj/item/crowbar/power=1,
		/obj/item/gun/medbeam=1)
	l_pocket = /obj/item/kitchen/knife/combat

/datum/outfit/ert/medic
	name = "ERT Medic - Blue Alert"

	id = /obj/item/card/id/ert/Medical
	mask = /obj/item/clothing/mask/gas/sechailer
	suit = /obj/item/clothing/suit/space/hardsuit/ert/med
	glasses = /obj/item/clothing/glasses/hud/health
	back = /obj/item/storage/backpack/satchel/med
	belt = /obj/item/storage/belt/medical/surgery_belt_adv/cmo
	l_hand = /obj/item/storage/firstaid/regular
	r_hand = /obj/item/gun/ballistic/automatic/wt550
	backpack_contents = list(/obj/item/storage/box/survival/engineer=1,\
		/obj/item/melee/baton/loaded=1,\
		/obj/item/ammo_box/magazine/wt550m9=3,\
		/obj/item/reagent_containers/hypospray/combat=1,\
		/obj/item/gun/medbeam=1)
	l_pocket = /obj/item/kitchen/knife/combat

/datum/outfit/ert/medic/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE, client/preference_source)
	ADD_TRAIT(H, TRAIT_SURGEON, TRAIT_GENERIC)
	..()

	if(visualsOnly)
		return

	var/obj/item/radio/R = H.ears
	R.keyslot = new /obj/item/encryptionkey/heads/cmo
	R.recalculateChannels()

/datum/outfit/ert/medic/alert
	name = "ERT Medic - Amber Alert"

	mask = /obj/item/clothing/mask/gas/sechailer/swat
	suit = /obj/item/clothing/suit/space/hardsuit/ert/alert/med
	backpack_contents = list(/obj/item/storage/box/survival/engineer=1,\
		/obj/item/melee/baton/loaded=1,\
		/obj/item/ammo_box/magazine/wt550m9=3,\
		/obj/item/reagent_containers/hypospray/combat/nanites=1,\
		/obj/item/gun/medbeam=1)

/datum/outfit/ert/medic/alert/red
	name = "ERT Medic - Red Alert"

	mask = /obj/item/clothing/mask/gas/sechailer/swat
	r_hand = /obj/item/gun/ballistic/automatic/ar
	backpack_contents = list(/obj/item/storage/box/survival/engineer=1,\
		/obj/item/melee/baton/loaded=1,\
		/obj/item/gun/energy/pulse/pistol/loyalpin=1,\
		/obj/item/ammo_box/magazine/m556=3,\
		/obj/item/reagent_containers/hypospray/combat/nanites=1,\
		/obj/item/gun/medbeam=1)

/datum/outfit/ert/engineer/green
	name = "ERT Engineer - Green Alert"

	id = /obj/item/card/id/ert/Engineer
	head = /obj/item/clothing/head/helmet/swat/engineer
	mask = /obj/item/clothing/mask/gas/sechailer
	suit = /obj/item/clothing/suit/armor/hos/engineer
	glasses =  /obj/item/clothing/glasses/meson/engine
	back = /obj/item/storage/backpack/industrial
	belt = /obj/item/storage/belt/utility/full
	l_pocket = /obj/item/rcd_ammo/large
	r_hand = /obj/item/gun/energy/e_gun/advtaser
	backpack_contents = list(/obj/item/storage/box/survival/engineer=1,\
		/obj/item/storage/firstaid/tactical=1,
		/obj/item/crowbar/power=1,
		/obj/item/construction/rcd/loaded=1)
	r_pocket = /obj/item/kitchen/knife/combat

/datum/outfit/ert/engineer
	name = "ERT Engineer - Blue Alert"

	mask = /obj/item/clothing/mask/gas/sechailer
	id = /obj/item/card/id/ert/Engineer
	suit = /obj/item/clothing/suit/space/hardsuit/ert/engi
	glasses =  /obj/item/clothing/glasses/meson/engine
	back = /obj/item/storage/backpack/industrial
	belt = /obj/item/storage/belt/utility/full
	l_pocket = /obj/item/rcd_ammo/large
	r_hand = /obj/item/gun/ballistic/automatic/wt550
	backpack_contents = list(/obj/item/storage/box/survival/engineer=1,\
		/obj/item/melee/baton/loaded=1,\
		/obj/item/ammo_box/magazine/wt550m9=3,\
		/obj/item/storage/ifak=1,\
		/obj/item/construction/rcd/loaded=1)
	r_pocket = /obj/item/kitchen/knife/combat

/datum/outfit/ert/engineer/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE, client/preference_source)
	..()

	if(visualsOnly)
		return

	var/obj/item/radio/R = H.ears
	R.keyslot = new /obj/item/encryptionkey/heads/ce
	R.recalculateChannels()

/datum/outfit/ert/engineer/alert
	name = "ERT Engineer - Amber Alert"

	mask = /obj/item/clothing/mask/gas/sechailer/swat
	suit = /obj/item/clothing/suit/space/hardsuit/ert/alert/engi
	backpack_contents = list(/obj/item/storage/box/survival/engineer=1,\
		/obj/item/melee/baton/loaded=1,\
		/obj/item/ammo_box/magazine/wt550m9=3,\
		/obj/item/storage/ifak=1,\
		/obj/item/construction/rcd/combat=1)

/datum/outfit/ert/engineer/alert/red
	name = "ERT Engineer - Red Alert"

	r_hand = /obj/item/gun/ballistic/automatic/ar
	mask = /obj/item/clothing/mask/gas/sechailer/swat
	backpack_contents = list(/obj/item/storage/box/survival/engineer=1,\
		/obj/item/melee/baton/loaded=1,\
		/obj/item/gun/energy/pulse/pistol/loyalpin=1,\
		/obj/item/ammo_box/magazine/m556=3,\
		/obj/item/storage/ifak=1,\
		/obj/item/construction/rcd/combat=1)

/datum/outfit/ert/janitor
	name = "ERT Janitor"

	id = /obj/item/card/id/ert
	mask = /obj/item/clothing/mask/gas/sechailer
	head = /obj/item/clothing/head/helmet/swat/janitor
	suit = /obj/item/clothing/suit/armor/hos/janitor
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	back = /obj/item/storage/backpack/captain
	belt = /obj/item/storage/belt/security/full
	r_hand = /obj/item/gun/energy/e_gun/advtaser
	backpack_contents = list(/obj/item/storage/firstaid/tactical/slaver=1,
		/obj/item/crowbar/power=1,
		/obj/item/bodybag/bluespace=1,
		/obj/item/mop/advanced=1)
	l_pocket = /obj/item/kitchen/knife/combat

/datum/outfit/ert/janitor/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE, client/preference_source)
	..()

	if(visualsOnly)
		return
	var/obj/item/radio/R = H.ears
	R.keyslot = new /obj/item/encryptionkey/heads/captain
	R.recalculateChannels()

/datum/outfit/ert/greybois
	name = "Emergency Assistant"

	uniform = /obj/item/clothing/under/color/grey/glorf
	shoes = /obj/item/clothing/shoes/sneakers/black
	gloves = /obj/item/clothing/gloves/color/fyellow
	ears = /obj/item/radio/headset
	head = /obj/item/clothing/head/soft/grey
	belt = /obj/item/storage/belt/utility/full
	back = /obj/item/storage/backpack
	mask = /obj/item/clothing/mask/gas
	l_pocket = /obj/item/tank/internals/emergency_oxygen
	l_hand = /obj/item/storage/toolbox/emergency/old
	id = /obj/item/card/id

/datum/outfit/ert/greybois/greygod
	suit = /obj/item/clothing/suit/hazardvest
	l_hand = /obj/item/storage/toolbox/plastitanium
	gloves = /obj/item/clothing/gloves/color/yellow

/datum/outfit/ert/greybois/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE, client/preference_source)
	if(visualsOnly)
		return
	var/obj/item/card/id/W = H.wear_id
	W.registered_name = H.real_name
	W.assignment = "Assistant"
	W.access = list(ACCESS_MAINT_TUNNELS,ACCESS_CENT_GENERAL)
	W.update_label(W.registered_name, W.assignment)

/datum/outfit/centcom_official
	name = "CentCom Official"

	uniform = /obj/item/clothing/under/rank/centcom/officer
	shoes = /obj/item/clothing/shoes/sneakers/black
	gloves = /obj/item/clothing/gloves/color/black
	ears = /obj/item/radio/headset/headset_cent
	glasses = /obj/item/clothing/glasses/sunglasses
	belt = /obj/item/gun/energy/e_gun
	l_pocket = /obj/item/pen
	back = /obj/item/storage/backpack/satchel
	r_pocket = /obj/item/pda/heads
	l_hand = /obj/item/clipboard
	id = /obj/item/card/id

/datum/outfit/centcom_official/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE, client/preference_source)
	if(visualsOnly)
		return

	var/obj/item/pda/heads/pda = H.r_store
	pda.owner = H.real_name
	pda.ownjob = "CentCom Official"
	pda.update_label()

	var/obj/item/card/id/W = H.wear_id
	W.icon_state = "centcom"
	W.access = get_centcom_access("CentCom Official")
	W.access += ACCESS_WEAPONS
	W.assignment = "CentCom Official"
	W.registered_name = H.real_name
	W.update_label()

/datum/outfit/ert/commander/inquisitor
	name = "Inquisition Commander"
	mask = /obj/item/clothing/mask/gas/sechailer
	l_hand = /obj/item/nullrod/scythe/talking/chainsword
	r_hand = /obj/item/gun/ballistic/automatic/c20r/unrestricted
	suit = /obj/item/clothing/suit/space/hardsuit/ert/paranormal
	backpack_contents = list(/obj/item/storage/box/survival/engineer=1,
		/obj/item/storage/ifak=1,\
		/obj/item/ammo_box/magazine/smgm45=3)

/datum/outfit/ert/security/inquisitor
	name = "Inquisition Security"

	mask = /obj/item/clothing/mask/gas/sechailer
	suit = /obj/item/clothing/suit/space/hardsuit/ert/paranormal/inquisitor
	r_hand = /obj/item/gun/ballistic/automatic/c20r/unrestricted
	backpack_contents = list(/obj/item/storage/box/survival/engineer=1,
		/obj/item/storage/box/handcuffs=1,
		/obj/item/ammo_box/magazine/smgm45=3,\
		/obj/item/melee/baton/loaded=1,
		/obj/item/storage/ifak=1,\
		/obj/item/construction/rcd/loaded=1)

/datum/outfit/ert/medic/inquisitor
	name = "Inquisition Medic"

	mask = /obj/item/clothing/mask/gas/sechailer
	suit = /obj/item/clothing/suit/space/hardsuit/ert/paranormal/inquisitor
	r_hand = /obj/item/gun/ballistic/automatic/c20r/unrestricted
	backpack_contents = list(/obj/item/storage/box/survival/engineer=1,
		/obj/item/melee/baton/loaded=1,
		/obj/item/ammo_box/magazine/smgm45=3,\
		/obj/item/reagent_containers/hypospray/combat=1,
		/obj/item/reagent_containers/hypospray/combat/heresypurge=1,
		/obj/item/gun/medbeam=1)

/datum/outfit/ert/chaplain/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE, client/preference_source)
	..()

	if(visualsOnly)
		return

	var/obj/item/radio/R = H.ears
	R.keyslot = new /obj/item/encryptionkey/heads/hop
	R.recalculateChannels()

/datum/outfit/ert/chaplain
	name = "ERT Chaplain"

	mask = /obj/item/clothing/mask/gas/sechailer
	suit = /obj/item/clothing/suit/space/hardsuit/ert/paranormal/inquisitor // Chap role always gets this suit
	id = /obj/item/card/id/ert/chaplain
	glasses = /obj/item/clothing/glasses/hud/health
	back = /obj/item/storage/backpack/cultpack
	belt = /obj/item/storage/belt/soulstone
	r_hand = /obj/item/gun/ballistic/automatic/c20r/unrestricted
	backpack_contents = list(/obj/item/storage/box/survival/engineer=1,
		/obj/item/nullrod=1,
		/obj/item/storage/ifak=1,\
		/obj/item/ammo_box/magazine/smgm45=3,
		)

/datum/outfit/ert/chaplain/inquisitor
	name = "Inquisition Chaplain"

	mask = /obj/item/clothing/mask/gas/sechailer
	suit = /obj/item/clothing/suit/space/hardsuit/ert/paranormal/inquisitor
	belt = /obj/item/storage/belt/soulstone/full/chappy
	backpack_contents = list(/obj/item/storage/box/survival/engineer=1,
		/obj/item/grenade/chem_grenade/holy=1,
		/obj/item/nullrod=1,
		/obj/item/storage/ifak=1,\
		/obj/item/ammo_box/magazine/m556=3,
		)
