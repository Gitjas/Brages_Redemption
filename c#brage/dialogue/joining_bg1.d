/* prist of helm: gives hint that Brage needs time */



I_C_T ~BRAGE~ 9 C#BE_NalinHint0
== NALIN IF ~Global("C#BE_SpawnBrage","GLOBAL",1)~ THEN @29
END


/* priest of Helm: Brage needs a bit of nudging */

CHAIN 
IF WEIGHT #-1
~Global("C#BE_SpawnBrage","GLOBAL",3)~ THEN NALIN nudge
@0 DO ~SetGlobal("C#BE_SpawnBrage","GLOBAL",4)~
== BRAGE @1
== NALIN @2
== BRAGE @3
== NALIN @4
EXIT


CHAIN 
IF WEIGHT #-1
~Global("C#BE_SpawnBrage","GLOBAL",4)~ THEN BRAGE join_request
@5
= @6 
== BRAGE @7
== BRAGE IF ~GlobalLT("Chapter","GLOBAL",%tutu_chapter_3%)~ THEN @8
END
++ @9 + join_request_01
++ @10 + join_request_02


CHAIN 
IF ~~ THEN BRAGE join_request_01
@11
= @12
== NALIN @13
END
IF ~~ THEN DO ~SetGlobal("C#BE_SpawnBrage","GLOBAL",5) 
ActionOverride("Brage",EscapeAreaDestroy(3))~ EXIT 


APPEND BRAGE

IF ~~ THEN join_request_02
SAY @14
IF ~~ THEN DO ~SetGlobal("C#BE_SpawnBrage","GLOBAL",8)~ EXIT 
END

END //APPEND


EXTEND_BOTTOM ~BRAGE~ 9
IF ~Global("C#BE_SpawnBrage","GLOBAL",8)~ THEN + joinlater
END

APPEND ~BRAGE~

IF ~~ THEN joinlater
SAY @15
++ @16 + join_request_01
++ @17 EXIT 
END

END //APPEND


/* Abgang "Brage2.cre", Auftritt "C#Brage" (C#Brage1.cre) in front of the temple */

BEGIN C#Brage1
IF ~Global("C#BE_SpawnBrage","GLOBAL",6)~ THEN join
SAY @18 
IF ~~ THEN DO ~SetGlobal("C#BE_SpawnBrage","GLOBAL",7) SetGlobal("C#BE_BrageTalks","GLOBAL",1) RealSetGlobalTimer("C#BE_BrageDialogueTimer","GLOBAL",800) JoinParty()~ EXIT
END

/* Kickout dialogue BG1 */

BEGIN C#BrageP

IF ~Global("Kickout","LOCALS",0)
%BGT_VAR%~ THEN kickout
SAY @19
++ @20 + kickout_01
++ @21 + kickout_02
++ @22 + kickout_03
END

IF ~~ THEN kickout_01
SAY @23
IF ~~ THEN DO ~SetGlobal("Kickout","LOCALS",1)~ EXIT
END

IF ~~ THEN kickout_02
SAY @24
IF ~~ THEN DO ~SetGlobal("Kickout","LOCALS",1) EscapeAreaMove("%Nashkel_TempleofHelm%",517,416,10)~ EXIT
END

IF ~~ THEN kickout_03
SAY @25
IF ~~ THEN DO ~JoinParty()~ EXIT
END

IF ~Global("Kickout","LOCALS",1)~ THEN rejoin
SAY @26
++ @27 DO ~SetGlobal("Kickout","LOCALS",0)~ + kickout_03
++ @28 + kickout_01
END