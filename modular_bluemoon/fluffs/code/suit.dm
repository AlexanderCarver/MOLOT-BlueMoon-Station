/obj/item/clothing/suit/donator/bm
	icon = 'modular_bluemoon/fluffs/icons/obj/clothing/suit.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/suit.dmi'

/obj/item/clothing/suit/donator/bm/lightning_holocloak
	name = "lightning holo-cloak"
	desc = "When equipped, a strange hologram is activated, and the fabric of the cloak itself disappears, and lightning starts projecting all over the body."
	icon_state = "lightning_holo"
	item_state = "welding-g"
	mutantrace_variation = STYLE_DIGITIGRADE | STYLE_NO_ANTHRO_ICON
	unique_reskin = list(
		"Blue" = list(
			"icon_state" = "lightning_holo_blue",
			"item_state" = "lightning_holo_blue",
			"name" = "blue lightning holo-cloak"
		),
		"Pink" = list(
			"icon_state" = "lightning_holo_pink",
			"item_state" = "lightning_holo_pink",
			"name" = "pink lightning holo-cloak"
		),
		"Red" = list(
			"icon_state" = "lightning_holo_red",
			"item_state" = "lightning_holo_red",
			"name" = "red lightning holo-cloak"
		),
		"Yellow" = list(
			"icon_state" = "lightning_holo_yellow",
			"item_state" = "lightning_holo_yellow",
			"name" = "yellow lightning holo-cloak"
		)
	)

/obj/item/clothing/suit/donator/bm/cerberus_suit
	name = "Cerberus Coat"
	desc = "Бронированое пальто болотного цвета с кучей пуговиц. Ходят слухи, что новых уже давно не делают, а те что имеются - снимают с трупов для дальнейшего ношения. От него пованивает тухлым мясом."
	mutantrace_variation = STYLE_DIGITIGRADE | STYLE_NO_ANTHRO_ICON
	icon_state = "cerberussuit_mob"
	item_state = "greatcoat"

/obj/item/clothing/suit/donator/bm/bishop_mantle
	name = "Bishop Mantle"
	desc = "Несмотря на бирку с ценником в девяноста девять, выглядит достаточно убедительно, чтобы считать носителя проповедником."
	mutantrace_variation = STYLE_DIGITIGRADE | STYLE_NO_ANTHRO_ICON
	icon_state = "bishop_mantle"
	item_state = "greatcoat"

/obj/item/clothing/suit/donator/bm/censor_fem_suit
	name = "censor coat"
	desc = "Бронированная шинель... Или то что от неё осталось? Наручи и поножи отсутствуют, хотя должны иметься в комплекте. На всю грудь раскинуто красное полотно с рисунком чёрной птицы на нём."
	icon = 'modular_bluemoon/krashly/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_bluemoon/krashly/icons/mob/clothing/suits.dmi'
	icon_state = "censor_fem"
	item_state = "censor_fem"

/obj/item/Dina_Kit
	name = "Kikimora Suit Kit"
	desc = "A modkit for making a Elite Syndicate Hardsuit into a Kikimora MK1."
	icon = 'icons/obj/vending_restock.dmi'
	icon_state = "refill_donksoft"
	var/product = /obj/item/clothing/suit/space/hardsuit/security/kikimora //what it makes
	var/list/fromitem = list(/obj/item/clothing/suit/space/hardsuit/security) //what it needs

/obj/item/Dina_Kit/afterattack(obj/O, mob/user as mob)
	if(istype(O, product))
		to_chat(user,"<span class='warning'>[O] is already modified!")
		return
	if(O.type in fromitem) //makes sure O is the right thing
		new product(usr.loc) //spawns the product
		user.visible_message("<span class='warning'>[user] modifies [O]!","<span class='warning'>You modify the [O]!")
		qdel(O) //Gets rid of the baton
		qdel(src) //gets rid of the kit
	else
		to_chat(user, "<span class='warning'> You can't modify [O] with this kit!</span>")
/obj/item/clothing/head/helmet/space/hardsuit/security/kikimora
	name = "ACS.Kikimora-MK2 Helmet"
	desc = "Модифицированный штатный Бронескафандр Лорданианских пилотов для ВКД даже в боевых условиях. Выполняет все необходимые от него функции."
	icon_state = "hardsuit0-kikimora"
	hardsuit_type = "kikimora"
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/obj/item/clothing/suit/space/hardsuit/security/kikimora
	name = "ACS.Kikimora-MK2 Hardsuit"
	desc = "Модифицированный штатный Бронескафандр Лорданианских пилотов для ВКД даже в боевых условиях. Выполняет все необходимые от него функции."
	icon_state = "hardsuit0-kikimora"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/security/kikimora
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON
