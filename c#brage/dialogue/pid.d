/* PID */

APPEND c#brageJ

IF ~IsGabber(Player1)~ THEN pid
SAY @0
+ ~RandomNum(6,1)~ + @1 + how_01
+ ~RandomNum(6,2)~ + @1 + how_02
+ ~RandomNum(6,3)~ + @1 + how_03
+ ~RandomNum(6,4)~ + @1 + how_04
+ ~RandomNum(6,5)~ + @1 + how_05
+ ~RandomNum(6,6)~ + @1 + how_06
+ ~Global("C#BE_SwordPID","LOCALS",0)~ + @2 DO ~SetGlobal("C#BE_SwordPID","LOCALS",1)~ + sword
+ ~Global("C#BE_FamilyPID","LOCALS",0)~ + @3 DO ~SetGlobal("C#BE_FamilyPID","LOCALS",1)~ + family_01
+ ~Global("C#BE_YourselfPID","LOCALS",0)~ + @4 DO ~SetGlobal("C#BE_YourselfPID","LOCALS",1)~ + yourself
++ @5 EXIT 
END

IF ~~ THEN how_01
SAY @6
IF ~~ THEN EXIT
END

IF ~~ THEN how_02
SAY @7
IF ~~ THEN EXIT
END

IF ~~ THEN how_03
SAY @8
IF ~~ THEN EXIT
END

IF ~~ THEN how_04
SAY @9
IF ~~ THEN EXIT
END

IF ~~ THEN how_05
SAY @10
IF ~~ THEN EXIT
END

IF ~~ THEN how_06
SAY @11
IF ~~ THEN EXIT
END

IF ~~ THEN sword
SAY @12
IF ~~ THEN EXIT
END

IF ~~ THEN family_01
SAY @13
IF ~~ THEN EXIT
END

IF ~~ THEN yourself
SAY @14
IF ~~ THEN EXIT
END

END //APPEND