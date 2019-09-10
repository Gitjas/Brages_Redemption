/* Nashkel Monster */

I_C_T C#Q04004 12 C#BE_C#Q04004_12
== c#bragej IF ~InParty("C#Brage") InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @0 
== C#Q04005 IF ~InParty("C#Brage") InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @1
END

I_C_T3 C#Q04008 17 C#BE_C#Q04008_17
== c#bragej IF ~GlobalGT("C#Q04_ArnimAndWyrm","GLOBAL",0)
InParty("C#Brage") InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @2
END


/* After quest is done */

APPEND c#bragej 

IF WEIGHT #-1
~Global("C#BE_Q04NashkelMonster","GLOBAL",2)~ THEN wyvern_nashkel
SAY @3
++ @4 + wyvern_nashkel_02
++ @5 + wyvern_nashkel_01
++ @6 + wyvern_nashkel_03
++ @7 + wyvern_nashkel_04
++ @8 + wyvern_nashkel_05
END

IF ~~ THEN wyvern_nashkel_01
SAY @9
IF ~~ THEN + wyvern_nashkel_05
END

IF ~~ THEN wyvern_nashkel_02
SAY @10
IF ~~ THEN + wyvern_nashkel_05
END

IF ~~ THEN wyvern_nashkel_03
SAY @11
IF ~~ THEN + wyvern_nashkel_05
END

IF ~~ THEN wyvern_nashkel_04
SAY @12
IF ~~ THEN + wyvern_nashkel_05
END

IF ~~ THEN wyvern_nashkel_05
SAY @13
IF ~~ THEN DO ~SetGlobal("C#BE_Q04NashkelMonster","GLOBAL",3)~ EXIT
END

END //APPEND