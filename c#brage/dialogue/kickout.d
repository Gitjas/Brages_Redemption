/* Kickout dialogue. Uses joining.tra */

BEGIN C#BrageP

/* BG1, BGII */
IF ~Global("Kickout","LOCALS",0)
%IT_IS_NOT_SOD%~ THEN kickout
SAY @19 /* ~You want me to wait?~ */
++ @20 /* ~Please wait here. I'll be back for you.~ */ + kickout_01
+ ~%BG1_BEFORE_TRANSITION%~ + @21 /* ~Actually, I need us to part ways, at least for now.~ */ + kickout_02
+ ~%IT_IS_BG2% GlobalLT("Chapter","GLOBAL",%bg2_chapter_7%)~ + @21 /* ~Actually, I need us to part ways, at least for now.~ */ + kickout_bg2_02
++ @22 /* ~No, I changed my mind. Please come along.~ */ + kickout_03
END

IF ~~ THEN kickout_01
SAY @23 /* ~As you wish. I'll be here.~ */
IF ~~ THEN DO ~SetGlobal("Kickout","LOCALS",1)~ EXIT
END

IF ~~ THEN kickout_02
SAY @24 /* ~I see. I'll return to Nashkel. You will find me in the temple of Helm.~ */
IF ~~ THEN DO ~SetGlobal("Kickout","LOCALS",1) EscapeAreaMove("%Nashkel_TempleofHelm%",517,416,10)~ EXIT
END

IF ~~ THEN kickout_bg2_02
SAY @42 /* ~I see. You will find me in the Temple District in Athkatla. I will return to the Temple of Helm.~ */
IF ~~ THEN DO ~SetGlobal("Kickout","LOCALS",1) EscapeAreaMove("AR0901",1174,350,0)~ EXIT
END

IF ~~ THEN kickout_03
SAY @25 /* ~Gladly.~ */
IF ~~ THEN DO ~JoinParty()~ EXIT
END

IF ~Global("Kickout","LOCALS",1)
%IT_IS_NOT_SOD%~ THEN rejoin
SAY @26 /* ~Hello, <CHARNAME>. You want us to join forces again?~ */
++ @27 /* ~Yes, please come along once more.~ */ DO ~SetGlobal("Kickout","LOCALS",0)~ + kickout_03
++ @28 /* ~No, not yet.~ */ + kickout_01
END


/* SoD */
/* SoD, Avernus */
/* If kicked out in Avernus (so Caelar can join) in bd4700.are
This sets Global("C#Brage_kicked_bd4700","global",1) which is used in xxbdcut59b.baf */
IF ~AreaCheck("bd4700")
    GlobalLT("bd_plot","global",570)~ THEN BEGIN sod_avernus
  SAY @41 /* ~I will have your back. <CHARNAME>.~ */
  IF ~~ THEN DO ~SetGlobal("C#Brage_kicked_bd4700","global",1)
                 SetGlobal("bd_joined","locals",0)~ EXIT
END

/* SoD, if kicked out in Korlasz's tomb */
IF ~%IT_IS_SOD%
    OR(2)
      AreaCheck("bd0120")
      AreaCheck("bd0130")
    GlobalGT("bd_joined","locals",0)~ THEN BEGIN kickout_2
  SAY @19 /* ~You want me to wait?~ */
++ @20 /* ~Yes, please wait here. I'll be back for you.~ */ + kickout_1_sod
++ @22 /* ~No, I changed my mind. Please come along.~ */ + kickout_03
END

/* kickout SoD, active "missing girl" quest */
IF ~%IT_IS_SOD%
OR(3)
	Global("C#Brage_SoDQuest","GLOBAL",3)
	Global("C#Brage_SoDQuest","GLOBAL",4)
	Global("C#Brage_SoDQuest","GLOBAL",8)
GlobalGT("bd_joined","locals",0)~ THEN BEGIN kickout_missing_girl_quest_active
  SAY @44 /* ~<CHARNAME>, I will finish the rescue of the missing girl while you don't need me, is that alright?~ */
++ @45 /* ~No, please just wait here. I'll be back in a moment and we can pursue the search together.~ */ + kickout_1_sod
++ @46 /* ~Yes, that sounds great. Do that.~ */ + kickout_missing_girl_quest_active_01
++ @47 /* ~That's fine by me, but I want you to return to the camp so I'll find you there.~ */ DO ~SetGlobal("bd_npc_camp","locals",1)~ + kickout_missing_girl_quest_active_01
  ++ @22 /* ~No, I changed my mind. Please come along.~ */ + kickout_03
END

IF ~~ THEN kickout_missing_girl_quest_active_01
SAY @43 /* ~I thank you. I'll be where you'll expect me.~ */
IF ~~ THEN DO ~EraseJournalEntry(@100001)
EraseJournalEntry(@100002)
EraseJournalEntry(@100005)
EraseJournalEntry(@100006)
SetGlobal("bd_joined","locals",0)
SetGlobal("C#Brage_SoDQuest","GLOBAL",15)~ SOLVED_JOURNAL @100007 EXIT
END


/* SoD */
IF ~GlobalGT("bd_joined","locals",0) %IT_IS_SOD%~ THEN BEGIN kickout_sod
  SAY @19 /* ~You want me to wait?~ */
  + ~GlobalGT("bd_npc_camp_chapter","global",1)
     GlobalLT("bd_npc_camp_chapter","global",5)
     OR(2)
       !Range("ff_camp",999)
       %NextTriggerObject_ff_camp%
     !IsOverMe("C#Brage")~ + @30 /* ~Please go back to the camp.~ */ DO ~SetGlobal("bd_npc_camp","locals",1)~ + kickout_2_sod
  ++ @20 /* ~Please wait here. I'll be back for you.~ */ + kickout_1_sod
  ++ @22 /* ~No, I changed my mind. Please come along.~ */ + kickout_03
END

IF ~~ THEN BEGIN kickout_1_sod
  SAY @23 /* ~As you wish. I'll be here.~ */
  IF ~~ THEN DO ~SetGlobal("bd_joined","locals",0)~ EXIT
END

IF ~~ THEN BEGIN kickout_2_sod
  SAY @31 /* ~As you wish. I will meet you at the camp.~ */
  IF ~~ THEN DO ~SetGlobal("bd_joined","locals",0)~ EXIT
END

IF ~~ THEN BEGIN kickout_3_sod
  SAY @25 /* ~Gladly.~ */
  IF ~~ THEN DO ~SetGlobal("bd_joined","locals",0)~ EXIT
END

/* join-up after leaving the group */
IF ~Global("bd_joined","locals",0) %IT_IS_SOD%~ THEN join_again_sod
  SAY @26 /* ~Hello, <CHARNAME>. You want us to join forces again?~ */
  ++ @27 /* ~Yes, please come along once more.~ */ + kickout_03
  + ~!AreaCheck("bd0010")~ + @20 /* ~Please wait here. I'll be back for you.~ */ + kickout_1_sod
  + ~AreaCheck("bd0010")~ + @37 /* ~Please be ready. I'll be back for you.~ */ + kickout_3_sod
END
