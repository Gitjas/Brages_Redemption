/* ToB content */

APPEND C#BrageJ

/* After Saradush's fall */
IF ~Global("C#BrgeToB_Saradush","GLOBAL",1)~ THEN saradush_fall
SAY ~[Brage]The city! It is destroyed!~
= ~[Brage]We can't let this get to us. We did all we could!~
IF ~~ THEN DO ~SetGlobal("C#BrgeToB_Saradush","GLOBAL",2)~ EXIT
END

END //APPEND

/* Melissan */
I_C_T SOLAR 66 C#BrgeToB_Melissan
== C#BrageJ IF ~InParty("C#Brage")
See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN ~That... that *snake* Pretending to help people, only to reveal such a black, cursed heart!~
END


