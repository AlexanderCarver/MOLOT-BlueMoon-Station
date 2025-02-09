
// **** Security gas mask ****

/obj/item/clothing/mask/gas/sechailer
	name = "security gas mask"
	desc = "A standard issue Security gas mask with integrated 'Compli-o-nator 3000' device. Plays over a dozen pre-recorded compliance phrases designed to get scumbags to stand still whilst you tase them. Do not tamper with the device."
	actions_types = list(/datum/action/item_action/halt, /datum/action/item_action/adjust)
	icon_state = "sechailer"
	item_state = "sechailer"
	clothing_flags = BLOCK_GAS_SMOKE_EFFECT | ALLOWINTERNALS
	flags_inv = HIDEFACIALHAIR|HIDEFACE
	w_class = WEIGHT_CLASS_SMALL
	visor_flags = BLOCK_GAS_SMOKE_EFFECT | ALLOWINTERNALS
	visor_flags_inv = HIDEFACE
	flags_cover = MASKCOVERSMOUTH
	visor_flags_cover = MASKCOVERSMOUTH | MASKCOVERSEYES
	var/aggressiveness = 2
	var/cooldown_special
	var/recent_uses = 0
	var/broken_hailer = 0
	var/safety = TRUE

/obj/item/clothing/mask/gas/sechailer/swat
	name = "\improper SWAT mask"
	desc = "A close-fitting tactical mask with an especially aggressive Compli-o-nator 3000."
	actions_types = list(/datum/action/item_action/halt)
	icon_state = "swat"
	item_state = "swat"
	aggressiveness = 3
	flags_inv = HIDEFACIALHAIR|HIDEFACE|HIDEEYES|HIDEEARS|HIDEHAIR
	flags_cover = MASKCOVERSMOUTH | MASKCOVERSEYES
	visor_flags_inv = 0

/obj/item/clothing/mask/gas/sechailer/cyborg
	name = "security hailer"
	desc = "A set of recognizable pre-recorded messages for cyborgs to use when apprehending criminals."
	icon = 'icons/obj/device.dmi'
	icon_state = "taperecorder_idle"
	aggressiveness = 1 //Borgs are nicecurity!
	actions_types = list(/datum/action/item_action/halt)

/obj/item/clothing/mask/gas/sechailer/screwdriver_act(mob/living/user, obj/item/I)
	if(..())
		return TRUE
	switch(aggressiveness)
		if(-1)
			to_chat(user, "<span class='notice'>You set the restrictor to the bottom position.</span>")
			aggressiveness = 0
		if(0)
			to_chat(user, "<span class='notice'>You set the restrictor to the top position.</span>")
			aggressiveness = -1
		if(1)
			to_chat(user, "<span class='notice'>You set the restrictor to the middle position.</span>")
			aggressiveness = 2
		if(2)
			to_chat(user, "<span class='notice'>You set the restrictor to the last position.</span>")
			aggressiveness = 3
		if(3)
			to_chat(user, "<span class='notice'>You set the restrictor to the first position.</span>")
			aggressiveness = 1
		if(4)
			to_chat(user, "<span class='danger'>You adjust the restrictor but nothing happens, probably because it's broken.</span>")
	return TRUE

/obj/item/clothing/mask/gas/sechailer/wirecutter_act(mob/living/user, obj/item/I)
	if(aggressiveness != 4)
		to_chat(user, "<span class='danger'>You broke the restrictor!</span>")
		aggressiveness = 4
	return TRUE

/obj/item/clothing/mask/gas/sechailer/ui_action_click(mob/user, action)
	if(istype(action, /datum/action/item_action/halt))
		halt()
	else
		adjustmask(user)

/obj/item/clothing/mask/gas/sechailer/attack_self()
	halt()

/obj/item/clothing/mask/gas/sechailer/emag_act(mob/user)
	. = ..()
	if(!safety)
		return
	safety = FALSE
	to_chat(user, "<span class='warning'>You silently fry [src]'s vocal circuit with the cryptographic sequencer.</span>")
	return TRUE

/obj/item/clothing/mask/gas/sechailer/verb/halt()
	set category = "Object"
	set name = "HALT"
	set src in usr
	if(!isliving(usr))
		return
	if(!can_use(usr))
		return
	if(broken_hailer)
		to_chat(usr, "<span class='warning'>\The [src]'s hailing system is broken.</span>")
		return

	var/phrase = 0	//selects which phrase to use
	var/phrase_text = null
	var/phrase_sound = null


	if(cooldown < world.time - 30) // A cooldown, to stop people being jerks
		recent_uses++
		if(cooldown_special < world.time - 180) //A better cooldown that burns jerks
			recent_uses = initial(recent_uses)

		switch(recent_uses)
			if(3)
				to_chat(usr, "<span class='warning'>\The [src] is starting to heat up.</span>")
			if(4)
				to_chat(usr, "<span class='userdanger'>\The [src] is heating up dangerously from overuse!</span>")
			if(5) //overload
				broken_hailer = 1
				to_chat(usr, "<span class='userdanger'>\The [src]'s power modulator overloads and breaks.</span>")
				return

		switch(aggressiveness)		// checks if the user has unlocked the restricted phrases
			if(-1)
				phrase = rand(28,34) //Sub cop
			if(0)
				phrase = rand(19,27)  //Dom cop
			if(1)
				phrase = rand(1,5)	// set the upper limit as the phrase above the first 'bad cop' phrase, the mask will only play 'nice' phrases
			if(2)
				phrase = rand(1,11)	// default setting, set upper limit to last 'bad cop' phrase. Mask will play good cop and bad cop phrases
			if(3)
				phrase = rand(1,18)	// user has unlocked all phrases, set upper limit to last phrase. The mask will play all phrases
			if(4)
				phrase = rand(12,18)	// user has broke the restrictor, it will now only play shitcurity phrases

		if(!safety)
			phrase_text = "FUCK YOUR CUNT YOU SHIT EATING COCKSTORM AND EAT A DONG FUCKING ASS RAMMING SHIT FUCK EAT PENISES IN YOUR FUCK FACE AND SHIT OUT ABORTIONS OF FUCK AND POO AND SHIT IN YOUR ASS YOU COCK FUCK SHIT MONKEY FUCK ASS WANKER FROM THE DEPTHS OF SHIT."
			phrase_sound = "emag"
		else

			switch(phrase)	//sets the properties of the chosen phrase
				if(1)
					phrase_text = "Не двигаться! Не двигаться!"
					phrase_sound = "halt"
				if(2)
					phrase_text = "Ни с места!"
					phrase_sound = "bobby"
				if(3)
					phrase_text = "Стоять! Стоять!"
					phrase_sound = "compliance"
				if(4)
					phrase_text = "Стоять на месте!"
					phrase_sound = "justice"
				if(5)
					phrase_text = "Давай, попробуй побежать. Безмозглый идиот."
					phrase_sound = "running"
				if(6)
					phrase_text = "Неудачник выбрал не тот день для нарушения закона."
					phrase_sound = "dontmove"
				if(7)
					phrase_text = "Сейчас узнаешь что такое настоящее правосудие, мудак."
					phrase_sound = "floor"
				if(8)
					phrase_text = "Стой! Преступное отродье."
					phrase_sound = "robocop"
				if(9)
					phrase_text = "Только двинешься и я оторву тебе бошку."
					phrase_sound = "god"
				if(10)
					phrase_text = "Укрыться от правосудия у тебя удастся только крышкой гроба."
					phrase_sound = "freeze"
				if(11)
					phrase_text = "Упал мордой в пол, тварь."
					phrase_sound = "imperial"
				if(12)
					phrase_text = "У вас есть только право закрыть свой пиздак нахуй."
					phrase_sound = "bash"
				if(13)
					phrase_text = "Виновен или невиновен - это лишь вопрос времени."
					phrase_sound = "harry"
				if(14)
					phrase_text = "Я - закон. Ты - убогое ничтожество."
					phrase_sound = "asshole"
				if(15)
					phrase_text = "Живым или мертвым - ты пиздуешь со мной."
					phrase_sound = "stfu"
				if(16)
					phrase_text = "Shut Up Crime!"
					phrase_sound = "shutup"
				if(17)
					phrase_text = "Face the wrath of the golden bolt."
					phrase_sound = "super"
				if(18)
					phrase_text = "Я. ЕСТЬ. ЗАКОН!"
					phrase_sound = "dredd"
				if(19)				// slut cop - dom
					phrase_text = "Твоя задница - моя!"
					phrase_sound = "ass"
				if(20) //Thank you Yappy for 19 & 20
					phrase_text = "Ваше согласие недействительно."
					phrase_sound = "consent"
				if(21)
					phrase_text = "Отъеби мои мозги, умоляю."
					phrase_sound = "brains"
				if(22)
					phrase_text = "Руки вверх, штаны вниз."
					phrase_sound = "pants"
				if(23)
					phrase_text = "Встань на колени и скажи: 'пожалуйста'."
					phrase_sound = "knees"
				if(24)
					phrase_text = "Пустое у меня тельце или нет, я кончу ради тебя!"
					phrase_sound = "empty"
				if(25) //Thank you Nata for 22-25
					phrase_text = "Лицом на землю, задницей вверх!"
					phrase_sound = "facedown"
				if(26)
					phrase_text = "Пожалуйста, займи на мне свою любимую позицию."
					phrase_sound = "fisto"
				if(27)
					phrase_text = "Ты пойдешь со мной, и тебе это понравится!"
					phrase_sound = "love"
				if(28)				// slut cop - sub
					phrase_text = "Пожалуйста, мне нужно больше!!"
					phrase_sound = "please"
				if(29)
					phrase_text = "Моё тело принадлежит тебе."
					phrase_sound = "body"
				if(30)
					phrase_text = "Я хороший питомец?"
					phrase_sound = "goodpet"
				if(31)
					phrase_text = "Я твоя вещь..."
					phrase_sound = "yours"
				if(32) //Thank you Kraxie for 31 & 32
					phrase_text = "Мастер..."
					phrase_sound = "master"
				if(33)
					phrase_text = "Я сделаю всё ради тебя..."
					phrase_sound = "anything"
				if(34)
					phrase_text = "Я живу, чтобы служить."
					phrase_sound = "serve"

		if(aggressiveness <= 0)
			usr.audible_message("[usr]'s Slut-o-Nator: <font color=#D45592 size='2'><b>[phrase_text]</b></font>")
		else
			usr.audible_message("[usr]'s Compli-o-Nator: <font color='red' size='4'><b>[phrase_text]</b></font>")
		playsound(src.loc, "sound/voice/complionator/[phrase_sound].ogg", 100, 0, 4)
		cooldown = world.time
		cooldown_special = world.time

/obj/item/clothing/mask/gas/sechailer/swat/spacepol
	name = "spacepol mask"
	desc = "A close-fitting tactical mask created in cooperation with a certain megacorporation, comes with an especially aggressive Compli-o-nator 3000."
	icon_state = "spacepol"
	item_state = "spacepol"
	mutantrace_variation = STYLE_NO_ANTHRO_ICON
	flags_cover = MASKCOVERSMOUTH | MASKCOVERSEYES
	visor_flags_cover = MASKCOVERSMOUTH | MASKCOVERSEYES
