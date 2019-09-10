/* Fallen Paladin in BG */

/* Dauron tells his story */
I_C_T C#Q05001 8 C#BE_C#Q05001_8
== c#bragej IF ~InParty("C#Brage") InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @0 
END

/* Dauron knows about the girl in Luskan and leaves in search for the nanny */
I_C_T3 C#Q05001 15 C#BE_C#Q05001_15
== c#bragej IF ~InParty("C#Brage") InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @1
END


/* After quest is done */

APPEND c#bragej 

IF WEIGHT #-1
~Global("C#BE_C#Q05001_15","GLOBAL",3)~ THEN fallen_paladin
SAY @2
++ @3 + fallen_paladin_03
++ @4 + fallen_paladin_02
++ @5 + fallen_paladin_02
++ @6 + fallen_paladin_01
++ @7 + fallen_paladin_02
END

IF ~~ THEN fallen_paladin_01
SAY @8
IF ~~ THEN + fallen_paladin_02
END

IF ~~ THEN fallen_paladin_02
SAY @9
IF ~~ THEN DO ~SetGlobal("C#BE_C#Q05001_15","GLOBAL",4)~ EXIT
END

IF ~~ THEN fallen_paladin_03
SAY @10
IF ~~ THEN + fallen_paladin_02
++ @4 + fallen_paladin_02
++ @5 + fallen_paladin_02
++ @6 + fallen_paladin_01
++ @7 + fallen_paladin_02
END

END //APPEND

/* PC spouted the news about the family to the crowd */
I_C_T3 C#Q05004 3 C#BE_C#Q05004_3
== c#bragej IF ~InParty("C#Brage") InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @11
END


/* met Nanny */
I_C_T3 C#Q05007 4 C#BE_C#Q05007_4
== c#bragej IF ~GlobalGT("C#Q05_TalkedToMother","GLOBAL",0)
InParty("C#Brage") InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @12
END