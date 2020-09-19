APPEND C#BrageJ


/* Transitions. SoD AND direct BGII transition. Brage will leave. */

IF WEIGHT #-1
~Global("C#Brage_TransitionsLeaveSoD","GLOBAL",1)~ THEN sod_leave
SAY @0 /* ~<CHARNAME>, it is time to say farewell. We've done a great deed. We stopped an impending war and saved a lot of lives. But I will take this as my cue to leave. I need to walk own steps now, search for the smithy of that sword, earn gold for the families I hurt - return to my home on my own terms. Farewell, and may the gods bless you... If the gods will allow it, we will meet again.~ */
IF ~~ THEN DO ~SetGlobal("C#Brage_TransitionsLeaveSoD","GLOBAL",2)~ + timered_leave 
END

/* BGII transition - no Caelar yet */
IF WEIGHT #-1
~!GlobalGT("bd_plot","GLOBAL",40) Global("C#Brage_TransitionsLeaveBGII","GLOBAL",1)~ THEN bg2_leave
SAY @0 /* ~<CHARNAME>, it is time to say farewell. We've done a great deed. We stopped an impending war and saved a lot of lives. But I will take this as my cue to leave. I need to walk own steps now, search for the smithy of that sword, earn gold for the families I hurt - return to my home on my own terms. Farewell, and may the gods bless you... If the gods will allow it, we will meet again.~ */
IF ~~ THEN DO ~SetGlobal("C#Brage_TransitionsLeaveBGII","GLOBAL",2)~ + timered_leave 
END

/* BGII transition after Caelar's Crusade manifested */
IF WEIGHT #-1
~GlobalGT("bd_plot","GLOBAL",40) Global("C#Brage_TransitionsLeaveBGII","GLOBAL",1)~ THEN bg2_leave_02
SAY @1 /* ~<CHARNAME>, if you are intended to turn your back on the sorrow of the people in Dragonspear Castle and the threat Caelar is posing to peacthe e on the Sword Coast it is your decision, but I will not follow you. I will stay and continue the fight... as a mercenary, if they have need of me.~ */
= @2 /* ~We've done great deeds together. We stopped an impending war and saved a lot of lives. But I will take this as my cue to leave. I need to walk own steps now, search for the smithy of that sword, earn gold for the families I hurt - return to my home on my own terms. Farewell, and may the gods bless you... If the gods will allow it, we will meet again.~ */
IF ~~ THEN DO ~SetGlobal("C#Brage_TransitionsLeaveBGII","GLOBAL",2)~ + timered_leave 
END

IF ~~ THEN timered_leave
SAY @3 /* ~Is there something in my backpack that belongs to you? Please have a look now, before I will leave.~ */
IF ~~ THEN DO ~SetGlobal("C#Brage_TransitionsLeave","GLOBAL",1)
RealSetGlobalTimer("C#Brage_TransitionsLeaveTmr","GLOBAL",5)~ EXIT
END

/* Brage leaves */
IF WEIGHT #-1
~Global("C#Brage_TransitionsLeave","GLOBAL",2)~ THEN leaving_for_real
SAY @4 /* ~Farewell, <CHARNAME>.~ */
IF ~~ THEN DO ~SetGlobal("#L_BG2ExitModded","LOCALS",2)
SetGlobal("#L_SoDExitModded","LOCALS",2)
SetGlobal("C#Brage_TransitionsLeave","GLOBAL",3)
LeaveParty()
ChangeAIScript("",DEFAULT)
SetLeavePartyDialogFile()
EscapeArea()~ EXIT
END


END //APPEND
