/* bgqe */

/* Babysitting */



CHAIN
IF WEIGHT #-1
~!Global("C#Q03_AbandonedChildren","GLOBAL",3)
Global("C#Q03_HelpMother","GLOBAL",0)
InParty("C#Brage") InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)
Global("C#BE_Q03GreetBrage","GLOBAL",0)
~ THEN C#Q03008 brage_greeting
@0 DO ~SetGlobal("C#BE_Q03GreetBrage","GLOBAL",1)~
== c#bragej @1
== C#Q03008 @2
== c#bragej @3
== C#Q03008 @4
END
IF ~~ THEN EXTERN C#Q03008 brage_greeting_02
IF ~!Alignment(Player1,LAWFUL_EVIL)
!Alignment(Player1,NEUTRAL_EVIL)
!Alignment(Player1,CHAOTIC_EVIL)
!ReputationLT(Player1,9)~ THEN EXTERN C#Q03008 brage_greeting_01

CHAIN
IF ~~ THEN C#Q03008 brage_greeting_01
@5
== C#Q03008 IF ~Global("C#Q03_TalkedToMother","GLOBAL",3)~ THEN @6
== c#bragej @7
END
++ @8 EXTERN C#Q03008 23
++ @9 DO ~SetGlobal("C#Q03_TalkedToMother","GLOBAL",5)~ EXTERN c#bragej mrsblackwood

APPEND C#Q03008

IF ~~ THEN brage_greeting_02
SAY @10
IF ~~ THEN EXIT
END

END //APPEND

APPEND c#bragej 

IF ~~ THEN mrsblackwood
SAY @11
IF ~~ THEN EXIT
END

END //APPEND

I_C_T C#Q03008 3 C#BE_Q03GreetBrage
== C#Q03008 IF ~InParty("C#Brage") InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @12 
== c#bragej IF ~InParty("C#Brage") InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @1
== C#Q03008 IF ~InParty("C#Brage") InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @2
END

I_C_T C#Q03008 34 C#BE_C#Q03008_34
== c#bragej IF ~InParty("C#Brage") InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @13
END

I_C_T C#Q03008 35 C#BE_C#Q03008_35
== c#bragej IF ~InParty("C#Brage") InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @14
END

I_C_T C#Q03009 5 C#BE_C#Q03009_5
== c#bragej IF ~InParty("C#Brage") InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @15
== C#Q03010 IF ~InParty("C#Brage") InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @16
== c#bragej IF ~InParty("C#Brage") InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @17
== C#Q03010 IF ~InParty("C#Brage") InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @18
== c#bragej IF ~InParty("C#Brage") InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @19
== C#Q03010 IF ~InParty("C#Brage") InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @20
== c#bragej IF ~InParty("C#Brage") InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @21
== C#Q03009 IF ~InParty("C#Brage") InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @22
== C#Q03010 IF ~InParty("C#Brage") InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @23
END

APPEND c#bragej 
/* Global("C#Q03_AbandonedChildren","GLOBAL",0) */

IF WEIGHT #-1
~Global("C#BE_Q03GreetBrage","GLOBAL",1)
Global("C#BE_Q03Babysitting","GLOBAL",2)~ THEN babysitting_over
SAY @24
++ @25 + babysitting_over_02
++ @26 + babysitting_over_03
++ @27 + babysitting_over_03
++ @28 + babysitting_over_04
++ @29 + babysitting_over_05
END

IF WEIGHT #-1
~Global("C#BE_Q03GreetBrage","GLOBAL",0)
Global("C#BE_Q03Babysitting","GLOBAL",2)~ THEN babysitting_over_01
SAY @30
++ @25 + babysitting_over_02
++ @26 + babysitting_over_03
++ @27 + babysitting_over_03
++ @28 + babysitting_over_04
++ @29 + babysitting_over_05
END

IF ~~ THEN babysitting_over_02
SAY @31
++ @27 + babysitting_over_03
++ @28 + babysitting_over_04
++ @29 + babysitting_over_05
END

IF ~~ THEN babysitting_over_03
SAY @32
++ @28 + babysitting_over_04
++ @29 + babysitting_over_05
END

IF ~~ THEN babysitting_over_04
SAY @33
= @34
IF ~~ THEN + babysitting_over_05
END

IF ~~ THEN babysitting_over_05
SAY @35
IF ~~ THEN DO ~SetGlobal("C#BE_Q03Babysitting","GLOBAL",3)~ EXIT
END

END //APPEND


