//Fate spirit:
//Assumes PC helped Brage in BG1

EXTEND_TOP FATESP 6
/* new game */
  IF ~Global("C#BE_SpawnBrage","GLOBAL",0)
!Dead("C#Brage")
!InMyArea("C#Brage")
Global("C#BrageSummoned","GLOBAL",0)~ THEN 
   REPLY @0
    DO ~SetGlobal("C#BrageSummoned","GLOBAL",1)~ GOTO 9

/* Brage is dead */
  IF ~Dead("C#Brage")
Global("C#BrageSummoned","GLOBAL",0)~ THEN REPLY @0 DO ~SetGlobal("C#BrageSummoned","GLOBAL",1)
~ GOTO 10    /* ~I cannot do as you ask, child of Bhaal. The one you seek is dead and thus forever beyond my reach. His thread no longer connects with yours.~ */

/* conti game: Brage spawned in BGII */
  IF ~GlobalGT("C#BE_SpawnBrage","GLOBAL",9)
!Dead("C#Brage")
!InMyArea("C#Brage")
Global("C#BrageSummoned","GLOBAL",0)~ THEN 
   REPLY @0
    DO ~SetGlobal("C#BrageSummoned","GLOBAL",1)~ GOTO 9

/* conti game: Brage did not spawn in BGII */
  IF ~GlobalGT("C#BE_SpawnBrage","GLOBAL",0)
GlobalLT("C#BE_SpawnBrage","GLOBAL",10)
!Dead("C#Brage")
!InMyArea("C#Brage")
Global("C#BrageSummoned","GLOBAL",0)~ THEN 
   REPLY @0
    DO ~SetGlobal("C#BrageSummoned","GLOBAL",1)~ GOTO 7  /* ~I cannot do as you ask, child of Bhaal. The thread of the one you speak is beyond my sight, as it no longer touches yours.~ */  
END