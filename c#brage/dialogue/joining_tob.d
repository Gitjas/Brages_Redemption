/* Brage joining if summoned via fate spirit */


BEGIN C#Brag25
IF ~Global("C#BrageSummoned","GLOBAL",2)~ THEN jointob
SAY ~<CHARNAME>! Where are we? You did... summon me here? Do you need my help?~
++ ~Hello Brage. Yes, please join me.~ + joinbg2_01
++ ~Not now, but maybe later.~ + joinbg2_02
END

IF ~~ THEN joinbg2_01
SAY ~Gladly.~ 
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


/* Kickout dialogue ToB */


BEGIN C#Bra25P

IF ~Global("Kickout","LOCALS",0)~ THEN kickout
SAY ~You want me to wait?~
++ ~Yes, please wait here. I'll be back for you.~ + kickout_01
++ ~No, I changed my mind. Please come along.~ + kickout_02
END

IF ~~ THEN kickout_01
SAY ~As you wish. I'll be here.~
IF ~~ THEN DO ~SetGlobal("Kickout","LOCALS",1)~ EXIT
END

IF ~~ THEN kickout_02
SAY ~Gladly.~
IF ~~ THEN DO ~JoinParty()~ EXIT
END

IF ~Global("Kickout","LOCALS",1)~ THEN rejoin
SAY ~Hello, <CHARNAME>. You want us to join forces again?~
++ ~Yes, please come along once more.~ DO ~SetGlobal("Kickout","LOCALS",0)~ + kickout_02
++ ~No, not yet.~ + kickout_01
END