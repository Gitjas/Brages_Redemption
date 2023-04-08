/* at occupied mines - Emerson should recognize Brage */
INTERJECT ACQEMERS 15 C#BE_ACQEMERS_15
== ACQEMERS IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @0 /* ~[Emerson]Brage, our former commander! I almost took you for an intruder.~ */
END
IF ~~ THEN EXTERN c#brageJ brage_in_gruppe

CHAIN
IF ~~ THEN c#brageJ brage_in_gruppe
@8 /* ~Greetings, Emerson.~ */
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)
Global("C#BE_ACQMinesOverrun","GLOBAL",3)~ THEN @9 /* ~[Brage]We heard about troubles in the mines?~ */
== ACQEMERS IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)
Global("C#BE_ACQMinesOverrun","GLOBAL",3)~ THEN @10 /* ~[Emerson]You heard right.~ */
== ACQEMERS IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @2 /* ~[Emerson]And I also recognize who is with you.~ */
END
IF ~~ THEN EXTERN ACQEMERS 16


I_C_T ACQEMERS 13 C#BE_ACQEMERS_13
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @3 /* ~Please, <CHARNAME>. The guard is still thinned out by what happened with the bandits. Let us not turn our backs to the troubles in the mines - Nashkel needs help.~ */
END

I_C_T ACQEMERS 18 C#BE_ACQMinesOverrun
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @1 
END

I_C_T ACQEMERS 18 C#BE_ACQMinesOverrun
== ACQEMERS IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @4 /* Brage, we also thank you deeply for your committment to this city. Although we turned our backs on you in your sorrow, it is clear that you still feel obliged to protect Nashkel, and we can only thank you for that.~ */
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @5 /* Thank you, Emerson. I appreciate it. Nashkel and their safety are indeed still very important to me.~ */
END

/* ACQLET05.itm - references to Nashkel */

CHAIN
IF WEIGHT #-1
~Global("C#BE_ACQMinesOverrun","GLOBAL",2)~ THEN C#BrageJ mines_occupied_again
@1
DO ~SetGlobal("C#BE_ACQMinesOverrun","GLOBAL",3)~
== c#brageJ IF ~Global("C#BE_TAEROM_18","GLOBAL",1)~ THEN @25 /* ~[Brage]Especially now that the ore is not poisoned any more, it is needed more than ever.~ */
EXIT

/* Inside the mines */
APPEND c#brageJ
IF WEIGHT #-1
~Global("C#BE_ACQInsideMines","MYAREA",1)~ THEN inside_mines
SAY @6 /* ~Here we are, ready to free the mines from an infestation of evil one more time. I thank you that we are doing this, <CHARNAME>.~ */
IF ~~ THEN DO ~SetGlobal("C#BE_ACQInsideMines","MYAREA",2)~ EXIT
END

/* after clearing the mines */
IF WEIGHT #-1
~Global("C#BE_ACQClearingMines","MYAREA",1)~ THEN mines_cleared
SAY @7 /* ~We are victorious. Once again you free the Nashkell mines from evil invaders. I thank you for taking this on, <CHARNAME>. Knowing that the mines, the city are safe is important to me - I am glad that I could be part of it.~ */
IF ~~ THEN DO ~SetGlobal("C#BE_ACQClearingMines","MYAREA",1)~ EXIT
END
END //APPEND



