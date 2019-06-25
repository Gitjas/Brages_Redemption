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

END //APPEND




