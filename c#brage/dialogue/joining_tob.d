/* Brage joining if summoned via fate spirit */


BEGIN C#Brag25
IF ~Global("C#BrageSummoned","GLOBAL",2)~ THEN jointob
SAY ~<CHARNAME>! Where are we? You did... summon me here? Do you need my help?~
++ ~Hello Brage. Yes, please join me.~ + joinbg2_01
++ ~Not now, but maybe later.~ + joinbg2_02
END

IF ~~ THEN joinbg2_01
SAY @25 /* ~Gladly.~ */
IF ~~ THEN DO ~SetGlobal("C#BrageSummoned","GLOBAL",4) SetGlobal("C#BE_BrageTalksToB","GLOBAL",1) RealSetGlobalTimer("C#BE_BrageDialogueTimer","GLOBAL",800) JoinParty()~ EXIT
END

IF ~~ THEN joinbg2_02
SAY ~Then I guess I will be waiting... over there.~
IF ~~ THEN DO ~SetGlobal("C#BrageSummoned","GLOBAL",3) 
ActionOverride("C#Brage",MoveToPoint([1658.1168]))
ActionOverride("C#Brage",Face(0))~ EXIT
END

IF ~Global("C#BrageSummoned","GLOBAL",3)~ THEN joinbg2_07
SAY ~Greetings, <CHARNAME>.~
++ ~Hello Brage. Would you accompany me once more?~ + joinbg2_01
++ ~I was just passing by.~ EXIT
END


