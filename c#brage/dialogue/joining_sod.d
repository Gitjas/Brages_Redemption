/* Greetings dialogue SoD - after Korlasz' Dungeon is done, in Sorcerous Sundries */

BEGIN C#BrageS

CHAIN
IF ~Global("C#Brage_MeetSoD","LOCALS",0)~ THEN C#BrageS sod_meeting
@33 /* ~<CHARNAME>!~ */ DO ~SetGlobal("C#Brage_MeetSoD","LOCALS",1)~
== C#BrageS IF ~OR(2)
AreaCheck("bd0121")
AreaCheck("bd0101")~ THEN @38 /* ~My investigations concerning the cursed sword let me return to Baldur's Gate. And what turmoil I see the city in!~ */
== C#BrageS IF ~AreaCheck("bd0121")~ THEN @34 /* ~I would have questions for Halbazzar Drin - but there is no chance in posing them now, in this chaos and confusion!~ */

== C#BrageS IF ~!AreaCheck("bd0121")
!AreaCheck("bd0101")~ THEN @39 /* ~My investigations concerning the cursed sword let me all the way up to Waterdeep and back to Baldur's Gate, but the crusade of this Caelar let me come here for now.~ */

== C#BrageS @35 /* ~They call you the hero of Baldur's Gate, there are rumors about you leading the coalition against the crusade. Would you need another sword arm?~ */
= @36 /* ~I'd rather help these poor people by fighting the crusade than waste any more time here. Plus, I fear I can do nothing with regard to my investigation before the city will come to rest.~ */
END
  ++ @27 /* ~Yes, please come along once more.~ */ + sod_meeting_01
  + ~AreaCheck("bd0121")~ + @28 /* ~No, not yet.~ */ + sod_meeting_02
  + ~!AreaCheck("bd0121")~ + @28 /* ~No, not yet.~ */ + sod_meeting_03

APPEND C#BrageS
IF ~~ THEN sod_meeting_01
  SAY @25 /* ~Gladly.~ */
  IF ~~ THEN DO ~RealSetGlobalTimer("C#BE_BrageDialogueTimer","GLOBAL",800) JoinParty()~ EXIT
END

IF ~~ THEN sod_meeting_02
  SAY @32 /* ~As you wish. I will wait in front of the Palace.~ */
  IF ~~ THEN DO ~SetDialog("C#BrageP")
    EscapeAreaMove("bd0010",760,940,N)~ EXIT
END

IF ~~ THEN sod_meeting_03
  SAY @40 /* ~As you wish. I will wait.~ */
  IF ~~ THEN DO ~SetDialog("C#BrageP")~ EXIT
END

END //APPEND
