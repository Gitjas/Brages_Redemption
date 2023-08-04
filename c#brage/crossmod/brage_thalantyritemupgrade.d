APPEND C#BrageJ
IF WEIGHT #-1
~Global("C#Brage_BG1_Hasthsw2h01","GLOBAL",1)~ THEN sword_reforged_tiu
SAY @0 /* ~So, the cursed sword is no more - at least not cursed. Looking at it still sickens me... It will take me a while to understand it is no longer the doomed sword it was. Let us make sure it will be of good use in the future.~ */
IF ~~ THEN DO ~SetGlobal("C#Brage_BG1_Hasthsw2h01","GLOBAL",2)~ EXIT
END
END //APPEND