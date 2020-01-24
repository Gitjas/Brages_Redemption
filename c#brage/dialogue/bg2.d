/* BGII */


/* Brage - game reactions */

/* Lilarcor */
APPEND C#BrageJ

IF ~Global("C#BE_Lilarcor","GLOBAL",1)~ THEN lilarcor
SAY ~A... a talking sword? Do you think it wise for me to wield this? Its voice is all bloodlusty...~
++ ~It is a good sword, Brage.~ + lilarcor_02
++ ~The sword can talk as much as it likes, it is your decisison where it will go.~ + lilarcor_02
++ ~Yeah, don't you two just go well together?~ + lilarcor_03
++ ~No complains, Brage. Don't be silly.~ + lilarcor_04
END

IF ~~ THEN lilarcor_02
SAY ~(sigh) That it is. Still...~
IF ~~ THEN + lilarcor_04
END

IF ~~ THEN lilarcor_03
SAY ~What words are those? My friend, do not jest about this... not about this, I beg you.~
IF ~~ THEN + lilarcor_04
END

IF ~~ THEN lilarcor_04
SAY ~I feel like I am being... punished. I know I deserve punishment, but... this is a bit rediculous.~
IF ~~ THEN DO ~SetGlobal("C#BE_Lilarcor","GLOBAL",2)~ EXIT
END

/* after wielding the sword for an ingame hour */

IF ~Global("C#BE_LilarcorEquipped","GLOBAL",3)~ THEN lilarcor_followup
SAY ~(Brage clenches his teeth.) This bloodlusty, talking sword is a challenge to consolidate my endurance, <CHARNAME>.~
++ ~I'm sorry Lilarcor unnerves you so. It is a good sword, though.~ + lilarcor_followup_01
++ ~I guess it is, especially for you and your past...~ + lilarcor_followup_01
++ ~Just ignore it. It's just a babbling voice, without any other means of influence.~ + lilarcor_followup_02
++ ~Aren't you strong enough to wield this powerful sword, Brage?~ + lilarcor_followup_03
END

IF ~~ THEN lilarcor_followup_01
SAY ~(sigh) That it is.~
IF ~~ THEN + lilarcor_followup_03
END

IF ~~ THEN lilarcor_followup_02
SAY ~I know.~
IF ~~ THEN + lilarcor_followup_03
END

IF ~~ THEN lilarcor_followup_03
SAY ~This sword is like... Noober's talkativeness and the cursed sword's bloodlust combined into one... As I said, I will endure it and take it to good use, but it *is* a challenge.~
IF ~~ THEN DO ~SetGlobal("C#BE_LilarcorEquipped","GLOBAL",4)~ EXIT
END

END //APPEND




