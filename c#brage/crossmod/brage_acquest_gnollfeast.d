/* AC_QUEST - Feast for the Gnolls */


CHAIN
IF 
~InParty(Myself)
CombatCounter(0) !See([ENEMY]) 
See(Player1)
!StateCheck(Player1,CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
Global("C#BE_ACQ12001_22","GLOBAL",1)~ THEN c#brageB gnollfeast_done
@11 /* ~Poor Aaron Brunnstein, to lose his love at the day he wanted to propose to her... (sigh) Why is the youth so reckless. Going on a picknick unprotected - ah, I shouldn't throw stones now, their sorrow is true enough.~ */
END
++ @12 /* ~No, you shouldn't throw stones, indeed.~ */ + gnollfeast_done_01
++ @13 /* ~I understand the sentiment, though. It arises from the fruitless wish to be able change their fates.~ */ + gnollfeast_done_01
++ @14 /* ~Poor Marina - to die on the day her love wanted to propose to her.~ */ + gnollfeast_done_03
++ @15 /* ~Well, you have a point, though. Going on a *picknick* in these times was, well, a bad idea.~ */ + gnollfeast_done_01
++ @16 /* ~Aaron surely proved that he's not able to protect Marina. They would have learned that eventually anyway, so maybe this way it was quicker and less painful in the end.~ */ + gnollfeast_done_02

APPEND c#brageB
IF ~~ THEN gnollfeast_done_01
SAY @17 /* ~I couldn't help but think about how I proposed to my wife. It was a sunny day, and we were outside just like this couple, but it was clearly much safer... Or maybe we were just as reckless and just didn't realize how lucky we were.~ */
IF ~~ THEN DO ~SetGlobal("C#BE_ACQ12001_22","GLOBAL",4)~ EXIT
END

IF ~~ THEN gnollfeast_done_02
SAY @18 /* ~I am tempted to scold you for a rather callous comment, but I can see there is some wisdom in it. (sigh) I wouldn't want to miss the time I had with Betty...~ */
IF ~~ THEN + gnollfeast_done_01
END

IF ~~ THEN gnollfeast_done_03
SAY @19 /* ~...And for her parents to lose her like this, your are right.~ */
IF ~~ THEN + gnollfeast_done_01
END
END //APPEND

I_C_T ACQ12001 22 C#BE_ACQ12001_22
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @20 /* ~Although I was not acquinted with the Brunnsteins, for the sake of Nashkel I am glad we could help return this boy safely. At least him...~ */
END

INTERJECT ACQ12001 27 C#BE_ACQ12001_27
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @21 /* ~Surely this was a jest, albeit a bad one. We will do no such thing, not as long as I am here and we are on the city's grounds. Accept the reward and let us go.~ */
END
IF ~~ THEN EXTERN ACQ12001 26

EXTEND_BOTTOM ACQ12001 29
IF ~Global("C#BE_ACQ12001_29","GLOBAL",0)
InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN DO ~SetGlobal("C#BE_ACQ12001_29","GLOBAL",1)~ EXTERN c#brageJ ACQ12001_29
END

APPEND c#brageJ
IF ~~ THEN ACQ12001_29
SAY @22 /* ~<CHARNAME>! Was that really necessary?~ */
COPY_TRANS ACQ12001 29
END

END //APPEND

I_C_T ACQ12002 3 C#BE_ACQ12002_3
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @23 /* ~I-I am sure we will come back as soon as we cleared the premises. Just hold on a little longer.~ */
END

I_C_T ACQ12002 28 C#BE_ACQ12002_28
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @24 /* ~I... I am so sorry for your loss. There is no words for this...~ */
END




