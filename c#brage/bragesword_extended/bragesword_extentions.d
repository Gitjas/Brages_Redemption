/* if Brage was brought back to Nashkel */

APPEND NALIN
IF WEIGHT #-1
~Global("C#BE_NalinHint","GLOBAL",1) !Global("BrageRiddle","GLOBAL",5)~ THEN nalinhint_garrison
SAY @0
IF ~~ THEN DO ~SetGlobal("C#BE_NalinHint","GLOBAL",2)~ UNSOLVED_JOURNAL @1022 EXIT
END

/* this will probably never show since Oublek initiates dialogue before, but I'll leave this in */
IF WEIGHT #-1
~Global("C#BE_NalinHint","GLOBAL",1) Global("BrageRiddle","GLOBAL",5)~ THEN nalinhint
SAY @1
IF ~~ THEN DO ~SetGlobal("C#BE_NalinHint","GLOBAL",2)~ UNSOLVED_JOURNAL @1022 EXIT
END

END //APPEND