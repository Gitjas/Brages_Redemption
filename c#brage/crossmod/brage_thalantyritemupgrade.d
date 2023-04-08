/* set variable so Thalantyr remembers he saw the sword */
ADD_TRANS_ACTION THALAN BEGIN %thalan_itemupgrade_thsw2h01% END BEGIN 1 END ~SetGlobal("C#BE_BG1_thsw2h01","GLOBAL",1)~

APPEND C#BrageJ
IF WEIGHT #-1
~Global("C#Brage_BG1_Hasthsw2h01","GLOBAL",1)~ THEN sword_reforged_tiu
SAY @0 /* ~So, the cursed sword is no more - at least not cursed. Looking at it still sickens me... It will take me a while to understand it is no longer the doomed sword it was. Let us make sure it will be of good use in the future.~ */
IF ~~ THEN DO ~SetGlobal("C#Brage_BG1_Hasthsw2h01","GLOBAL",2)~ EXIT
END
END //APPEND