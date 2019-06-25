/* graveyard "quest" / incident */

/* first: Brage would like to revisit the graveyard in Nashkel */

APPEND C#BrageJ

IF ~Global("C#BE_GraveIncident","GLOBAL",1)~ THEN graveyard_visit
SAY @0
= @1
IF ~~ THEN DO ~SetGlobal("C#BE_GraveIncident","GLOBAL",2)~ 
UNSOLVED_JOURNAL @2 EXIT
END



/* arrived at Nashkel map */

IF ~Global("C#BE_GraveIncident","GLOBAL",3)~ THEN inside_nashkel
SAY @3
++ @4 + inside_nashkel_02
++ @5 + inside_nashkel_01
++ @6 + inside_nashkel_01
++ @7 + inside_nashkel_02
END

IF ~~ THEN inside_nashkel_01
SAY @8
IF ~~ THEN DO ~SetGlobal("C#BE_GraveIncident","GLOBAL",5)~ EXIT
END

IF ~~ THEN inside_nashkel_02
SAY @9
IF ~~ THEN DO ~SetGlobal("C#BE_GraveIncident","GLOBAL",4)
EraseJournalEntry(@2)
ActionOverride("C#Brage",ChangeAIScript("",DEFAULT))
ActionOverride("C#Brage",SetLeavePartyDialogFile())
ActionOverride("C#Brage",LeaveParty())
ActionOverride("C#Brage",SetGlobal("Kickout","LOCALS",1))
ActionOverride("C#Brage",EscapeAreaDestroy(5)~ UNSOLVED_JOURNAL @10 EXIT
END

END //APPEND

/* in front of the graveyard. */

BEGIN ~c#be1001~
BEGIN ~c#be1002~
BEGIN ~c#be1003~
BEGIN ~c#be1004~
BEGIN ~c#behann~

CHAIN
IF ~Global("C#BE_GraveIncident","GLOBAL",6)~ THEN C#BrageJ at_graveyard
@11
== c#be1001 @12
== c#be1004 @13
== c#be1003 @14
== c#be1002 @15
== C#BrageJ @16
END
++ @17 EXTERN c#be1002 at_graveyard_02
++ @18 EXTERN c#be1002 at_graveyard_01
++ @19 EXTERN c#be1002 at_graveyard_02  

APPEND c#be1002
IF ~~ THEN at_graveyard_01
SAY @20
IF ~~ THEN + at_graveyard_02
END
END //APPEND

CHAIN
IF ~~ THEN c#be1002 at_graveyard_02  
@21
== c#be1001 @22
== c#be1004 @23
== C#BrageJ @24
== c#be1002 @25
== c#be1003 @26
== c#be1002 @27
== c#be1004 @28
END
IF ~~ THEN DO ~SetGlobal("C#BE_GraveIncident","GLOBAL",7)~ EXIT

/* mob dissolves. Brage initiates dialogue again. */

/* Brage went alone to the graveyard: Global("C#BE_GraveIncident","GLOBAL",10) */

APPEND C#BrageJ

IF ~Global("C#BE_GraveIncident","GLOBAL",10)~ THEN graveyard_alone
SAY @29
IF ~~ THEN + after_mob
END

/* PC witnessed mob: Global("C#BE_GraveIncident","GLOBAL",8) */

IF ~Global("C#BE_GraveIncident","GLOBAL",8)~ THEN after_mob
SAY @30
+ ~Global("C#BE_GraveIncident","GLOBAL",8)~ + @31 + after_mob_01
++ @32 + after_mob_01
++ @33 + after_mob_01
++ @34 + after_mob_02
++ @35 + after_mob_02
END

IF ~~ THEN after_mob_01
SAY @36
IF ~~ THEN + after_mob_02
END

IF ~~ THEN after_mob_02
SAY @37
IF ~~ THEN DO ~SetGlobal("C#BE_GraveIncident","GLOBAL",11)
CreateCreature("c#behann",[2214.1351],0)~ EXIT //Hannah
END

END //APPEND

CHAIN
IF ~Global("C#BE_GraveIncident","GLOBAL",11)~ THEN c#behann hannah
@38 
== C#BrageJ @39
= @40
== c#behann @41
== C#BrageJ @42
== c#behann @43
== C#BrageJ @44
== c#behann @45
END
IF ~~ THEN DO ~SetGlobal("C#BE_GraveIncident","GLOBAL",12)~ EXIT


APPEND C#BrageJ

IF ~Global("C#BE_GraveIncident","GLOBAL",13)~ THEN at_graveyard_2
SAY @46
= @47
IF ~~ THEN DO ~SetGlobal("C#BE_GraveIncident","GLOBAL",14)
ClearAllActions()
StartCutSceneMode()
StartCutScene("c#be1cu1")~ EXIT //fade to black]
END

IF ~Global("C#BE_GraveIncident","GLOBAL",14)~ THEN at_graveyard_2_01
SAY @48
= @49
IF ~~ THEN DO ~SetGlobal("C#BE_GraveIncident","GLOBAL",15)

EraseJournalEntry(@2)

EraseJournalEntry(@10)~

SOLVED_JOURNAL @50 EXIT
END

IF ~Global("C#BE_GraveIncident","GLOBAL",16)~ THEN reflections_on_graveyardvisit
SAY @51
= @52
= @53
= @54
IF ~~ THEN DO ~SetGlobal("C#BE_GraveIncident","GLOBAL",17)~ EXIT
END

END //APPEND


