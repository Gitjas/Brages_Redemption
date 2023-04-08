/* bdbrac02 "Jester's Bracers" */
CHAIN
IF ~Global("C#Brage_SoDbdbrac02","GLOBAL",1)~ THEN C#BrageJ bdbrac02
@300 /* [Brage]"Jester's Bracers" - had I be cursed with these - oh, I would have lamented without end about the shame and loss of authority it would have brought me when wearing this between my men. Little would I have known how ridiculously unimportant this curse would be in comparison to what really happened. */
DO ~SetGlobal("C#Brage_SoDbdbrac02","GLOBAL",2)~
== BDVICONJ IF ~InParty("Viconia") See("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @301 /* [Viconia]How about you try these on, it would fit nicely to how *ridiculously unimportant* you are. */
== C#BrageJ IF ~InParty("Viconia") See("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @302 /* Careful, Viconia. */
EXIT

/* bdchan04 "Commander's Chain Mail +3" HasItemEquipped("",Myself) */
APPEND C#BrageJ
IF ~Global("C#Brage_SoDbdchan04","GLOBAL",1)~ THEN bdchan04
SAY @303 /* [Brage]There is armor that gives better protecion than this one, <CHARNAME>. Why would you have me wear this "Commander's Chain Mail"? Is this a crude joke because of its name? */
++ @304 /* This is an armor of very little weight and the effect it has on those around you is well worth it. */ + bdchan04_02
++ @305 /* Now that you say it - I thought your grumpy attitude could use some counter measures. I like you much better with the armor on. */ + bdchan04_01
++ @306 /* Yes, and you'll wear it, because I said so. */ + bdchan04_01
END

IF ~~ THEN bdchan04_01
SAY @307 /* I hope you enjoy the joke, <CHARNAME>. I does not make sense for me to wear this if it deminishes my defense. */
IF ~~ THEN DO ~SetGlobal("C#Brage_SoDbdchan04","GLOBAL",2)~ EXIT
END

IF ~~ THEN bdchan04_02
SAY @308 /* I see. Forgive me for snapping at you, it was uncalled for. */
IF ~~ THEN DO ~SetGlobal("C#Brage_SoDbdchan04","GLOBAL",2)~ EXIT
END

/* bdsw1h05 Gift of the demon +5 (cursed) */
IF ~Global("C#Brage_SoDbdsw1h05","GLOBAL",1)~ THEN bdsw1h05
SAY @309 /* [Brage]Seeing a curse on a weapon makes me uneasy - no matter how good the weapon is. Are you sure you are comfortable with using this sword, <CHARNAME>? */
++ @310 /* It seems to be a very powerful weapon, at least. */ + bdsw1h05_01
++ @311 /* Not really, but I think it is worth it. */ + bdsw1h05_01
++ @312 /* You are right, we should not use this sword. */ + bdsw1h05_01
END

IF ~~ THEN bdsw1h05_01
SAY @313 /* [Brage]The thought of not being able to put a weapon down... What else can be expect from a demon's gift. */
IF ~~ THEN DO ~SetGlobal("C#Brage_SoDbdsw1h05","GLOBAL",2)~ EXIT
END

/* bdsw1hx5 Gift of the Demon +1 (set variable to detect it in case it's already gone after a fight) */
IF ~Global("C#Brage_SoDbdsw1h05","GLOBAL",2)~ THEN bdsw1hx5
SAY @314 /* [Brage]Ah, this is a cursed weapon indeed! Glued to one's hand it turned into an unreliable weapon in fight. What a nightmare! But what else can be expect from a demon's gift! */
IF ~~ THEN DO ~SetGlobal("C#Brage_SoDbdsw1h05","GLOBAL",3)~ EXIT
END
END //APPEND