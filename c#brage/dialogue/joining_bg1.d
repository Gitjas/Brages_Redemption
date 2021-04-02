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
IF ~~ THEN DO ~SetGlobal("C#BE_SpawnBrage","GLOBAL",6) 
ActionOverride("Brage",EscapeAreaDestroy(3))~ EXIT 


APPEND BRAGE

IF ~~ THEN join_request_02
SAY @14
IF ~~ THEN DO ~SetGlobal("C#BE_SpawnBrage","GLOBAL",5)~ EXIT 
END

END //APPEND


EXTEND_BOTTOM ~BRAGE~ 9
IF ~Global("C#BE_SpawnBrage","GLOBAL",5)~ THEN + joinlater
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
IF ~Global("C#BE_SpawnBrage","GLOBAL",7)~ THEN join
SAY @18 
IF ~~ THEN DO ~SetGlobal("C#BE_SpawnBrage","GLOBAL",8) 
SetGlobal("Kickout","LOCALS",0)
SetGlobal("C#BE_BrageTalks","GLOBAL",1) RealSetGlobalTimer("C#BE_BrageDialogueTimer","GLOBAL",800) JoinParty()~ EXIT
END

