/* bgqe */

/* Warm Place for Noober */

I_C_T C#LCNOOB 2 C#BE_C#LCNOOB_2
== c#bragej IF ~InParty("C#Brage") InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @0
END

I_C_T C#LCNOOB 3 C#BE_C#LCNOOB_3
== c#bragej IF ~InParty("C#Brage") InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @0
END

APPEND c#bragej 

IF WEIGHT #-1
~Global("C#BE_BGQENoober","GLOBAL",2)~ THEN noober
SAY @1
++ @2 + noober_01
++ @3 + noober_02
++ @4 + noober_03
++ @5 + noober_04
END

IF ~~ THEN noober_01
SAY @6
IF ~~ THEN + noober_05
END

IF ~~ THEN noober_02
SAY @7
IF ~~ THEN + noober_05
END

IF ~~ THEN noober_03
SAY @8
IF ~~ THEN + noober_05
END

IF ~~ THEN noober_04
SAY @9
IF ~~ THEN + noober_05
END

IF ~~ THEN noober_05
SAY @10
IF ~~ THEN DO ~SetGlobal("C#BE_BGQENoober","GLOBAL",3)~ EXIT
END

END //APPEND