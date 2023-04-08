/*
Global("C#Brage_SoDQuest","GLOBAL",1): after trigger "c#besq0t" gets set to FALSE in brage_bd7300.baf
Global("C#Brage_SoDQuest","GLOBAL",2): after uncle gets spawned via sod_quest-baf, also invisible helper cre, trigger gets set to TRUE; ONLY with Brage in Party
Global("C#Brage_SoDQuest","GLOBAL",3): after talking to uncle the first time. also trigger for first "talking to tree"
Global("C#Brage_SoDQuest","GLOBAL",4): after talking to "tree" and realizing Tilda won't come down.
Global("C#Brage_SoDQuest","GLOBAL",5): after talking to uncle: searching for someone who can sing the song (Brage was not in party when talking to uncle), trigger for "Brage remembers song" when talking to uncle again with Brage in partry
Global("C#Brage_SoDQuest","GLOBAL",8): after talking to uncle: Brage was in party and will sing the song 
Global("C#Brage_SoDQuest","GLOBAL",9): starts action: Tilda comes down from her tree, Also destroy trigger for helper cre and area trigger deactivation.
Global("C#Brage_SoDQuest","GLOBAL",10): Tilda came down from tree and starts dialogue.
Global("C#Brage_SoDQuest","GLOBAL",11): Tilda vanished into the bushes, without Brage in party 
Global("C#Brage_SoDQuest","GLOBAL",12): Tilda vanished into the bushes, with Brage in party
Global("C#Brage_SoDQuest","GLOBAL",13): After Brage commented on her disappearance.
Global("C#Brage_SoDQuest","GLOBAL",15): PC will not help and didn't meet Tilda yet, quest ends. (Brage will help but it all happens without the player noticing).
Global("C#Brage_SoDQuest","GLOBAL",16): PC stopped helping but met Tilda in tree
*/

/* Brage's SoD Quest - find the missing girl! */

/* uncle at first meeting */
BEGIN c#besq02
IF ~Global("C#Brage_SoDQuest","GLOBAL",2)~ THEN first_meeting
SAY @0 /* [Uncle]Help! Please help me. My niece Tilda and I were surprised by wild boars. Ich glaube sie konnte sich retten, aber ich bin verletzt worden und kann nicht nach ihr suchen. Werdet Ihr uns helfen? */
++ @1 /* [PC Reply]How did you came to be out here? */ + first_meeting_01
++ @2 /* [PC Reply]Are you a crusader? Declare yourself! */ + first_meeting_02
++ @3 /* [PC Reply]Of course. Was it near here? */ DO ~SetGlobal("C#Brage_SoDQuest","GLOBAL",3)~ + first_meeting_c_02
++ @4 /* [PC Reply]We'll scouting the area anyway, so if we'll see her we'll make sure she'll be alright. */ DO ~SetGlobal("C#Brage_SoDQuest","GLOBAL",3)~ + first_meeting_c_02
++ @5 /* [PC Reply]I can't promise anything. */ + first_meeting_c_01
++ @6 /* [PC Reply]I don't think we have time for that. She's either in safety or the woods swallowed her. */ + first_meeting_c_01 
END

IF ~~ THEN first_meeting_01
SAY @7 /* [Uncle]We are refugees and are staying in the big coalition camp at the moment. We thought we could pick some berries but it was a really foolish thing to do. She ran away so quickly, I couldn't follow her. Please, bring her back! */
++ @3 /* [PC Reply]Of course. Was it near here? */ DO ~SetGlobal("C#Brage_SoDQuest","GLOBAL",3)~ + first_meeting_c_02
++ @4 /* [PC Reply]We'll scouting the area anyway, so if we'll see her we'll make sure she'll be alright. */ DO ~SetGlobal("C#Brage_SoDQuest","GLOBAL",3)~ + first_meeting_c_02
++ @5 /* [PC Reply]I can't promise anything. */ + first_meeting_c_01
++ @6 /* [PC Reply]I don't think we have time for that. She's either in safety or the woods swallowed her. */ + first_meeting_c_01 
END

IF ~~ THEN first_meeting_02
SAY @8 /* [Uncle]No! My niece is only 8 years old. The crusaders are the reason we are on the run in the first place! */
IF ~~ THEN + first_meeting_01
END

IF ~~ THEN first_meeting_03
SAY @9 /* [Uncle]I will return to the big allied camp, I hope the healers can help me with that foot. You'll find me somewhere around the healing tents. Thank you *so* much for your help! */
IF ~~ THEN EXIT
END

IF ~~ THEN first_meeting_04
SAY @10 /* [Uncle]Oh, habt vielen Dank! Ich bin einfach nur gerannt, ich weiß nicht mal mehr, in welche Richtung... */
IF ~~ THEN UNSOLVED_JOURNAL @100001 + first_meeting_03
END

CHAIN
IF ~~ THEN c#besq02 first_meeting_c_01
@11 /* [Uncle]Ach, was für eine Tragödie. Erst verliert sie ihre Eltern durch einen Überfall auf deren Reisekaravane westlich der Cloud Peaks, dann müssen wir unser Dorf wegen des Kreuzzugs verlassen, und nun wird sie womöglich im Wald von wilden Tieren gefressen! */
== C#BrageJ IF ~InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)
Detect("C#Brage")~ THEN @12 /* [Brage]She lost her parents... Do not worry, good man. We will look for your niece. If she is still alive, we will find her and bring her to you. */ DO ~SetGlobal("C#Brage_c#besq02_1","GLOBAL",2)~
END
++ @13 /* [PC Reply]What he says. Don't worry, we'll see to your niece being returned to you. */ DO ~SetGlobal("C#Brage_SoDQuest","GLOBAL",3)~ DO ~SetGlobal("C#Brage_SoDQuest","GLOBAL",3)~ + first_meeting_04
++ @14 /* [PC Reply]Er, Brage? Don't I get a say in this? */ EXTERN C#BrageJ brage_interjection_01
++ @15 /* [PC Reply]No, Brage. We will not do this. I have no intention to go looking for a runaway girl. */ EXTERN C#BrageJ brage_interjection_01

CHAIN
IF ~~ THEN c#besq02 first_meeting_c_02
@16 /* [Uncle]Oh, habt vielen Dank! Ich bin einfach nur gerannt, ich weiß nicht mal mehr, in welche Richtung... Was für eine Tragödie. Erst verliert sie ihre Eltern durch einen Überfall auf deren Reisekaravane westlich der Cloud Peaks, dann müssen wir unser Dorf wegen des Kreuzzugs verlassen, und nun wird sie womöglich im Wald von wilden Tieren gefressen! */
== C#BrageJ IF ~Global("C#Brage_c#besq02_1","GLOBAL",0)
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)
Detect("C#Brage")~ THEN @17 /* [Brage]She lost her parents due to... Do not worry, good man. If she is still alive, we will find her and bring her to you. */ DO ~SetGlobal("C#Brage_c#besq02_1","GLOBAL",1)~
END
IF ~~ THEN UNSOLVED_JOURNAL @100001 + first_meeting_03

APPEND C#BrageJ
IF ~~ THEN brage_interjection_01
SAY @18 /* [Brage]<CHARNAME>, we will be scouting the area anyway. Forgive me if I overstepped my bounds. But - I gave my word to this man, and I am determined to keep it. Will you not agree to this search and rescue mission? */ 
++ @19 /* [PC Reply]Of course I do, we will not leave a girl alone in the woods. I was just surprised by you speaking up with the decision like this. */ DO ~SetGlobal("C#Brage_SoDQuest","GLOBAL",3)~ EXTERN c#besq02 first_meeting_04
++ @20 /* [PC Reply]Alright, I guess saving one girl while we are around the area will not hurt. */ DO ~SetGlobal("C#Brage_SoDQuest","GLOBAL",3)~ EXTERN c#besq02 first_meeting_04
++ @21 /* [PC Reply]I am sorry, Brage. We have obligations to the city authories we need to attend to. I am sure there will be someone else wo can help. */ + brage_interjection_02
++ @22 /* [PC Reply]No, I don't and if you'll leave to do this on your own, you do not need to return. I need you here. */ + brage_interjection_02
END

IF ~~ THEN brage_interjection_02
SAY @23 /* [Brage]I will hold my promise to this man, <CHARNAME>, but fear not, you won't even notice I was gone, I promise. Until then - try to get help with the Flaming Fist soldiers - I am sure they will help you. */ 
IF ~~ THEN DO ~EraseJournalEntry(@100001)
EraseJournalEntry(@100002)
EraseJournalEntry(@100006)
SetGlobal("C#Brage_SoDQuest","GLOBAL",15)~ SOLVED_JOURNAL @100003 EXIT
IF ~Global("C#Brage_SoDQuest","GLOBAL",2)~ THEN DO ~SetGlobal("C#Brage_SoDQuest","GLOBAL",15)~ SOLVED_JOURNAL @100003 EXTERN c#besq02 first_meeting_03
END
END //APPEND


/* ask the refugee vendors about her (Horst, Stalina) */
EXTEND_BOTTOM bdhorst 0
+ ~GlobalGT("C#Brage_SoDQuest","GLOBAL",0) GlobalLT("C#Brage_SoDQuest","GLOBAL",4)
Global("C#Grey_AskAboutTilda","MYAREA",0)~ + @242 /* ~[PC Reply]Did you see a girl running by by any chance? Her uncle is searching for her after being chased by wild boars.~ */ DO ~SetGlobal("C#Grey_AskAboutTilda","MYAREA",1)~ EXTERN bdstalia ask_about_tilda
END
EXTEND_BOTTOM bdhorst 2
+ ~GlobalGT("C#Brage_SoDQuest","GLOBAL",0) GlobalLT("C#Brage_SoDQuest","GLOBAL",4)
Global("C#Grey_AskAboutTilda","MYAREA",0)~ + @242 /* ~[PC Reply]Did you see a girl running by by any chance? Her uncle is searching for her after being chased by wild boars.~ */ DO ~SetGlobal("C#Grey_AskAboutTilda","MYAREA",1)~ EXTERN bdstalia ask_about_tilda
END

EXTEND_BOTTOM bdstalia 0
+ ~GlobalGT("C#Brage_SoDQuest","GLOBAL",0) GlobalLT("C#Brage_SoDQuest","GLOBAL",4)
Global("C#Grey_AskAboutTilda","MYAREA",0)~ + @242 /* ~[PC Reply]Did you see a girl running by by any chance? Her uncle is searching for her after being chased by wild boars.~ */ DO ~SetGlobal("C#Grey_AskAboutTilda","MYAREA",1)~ + ask_about_tilda
END
EXTEND_BOTTOM bdstalia 2
+ ~GlobalGT("C#Brage_SoDQuest","GLOBAL",0) GlobalLT("C#Brage_SoDQuest","GLOBAL",4)
Global("C#Grey_AskAboutTilda","MYAREA",0)~ + @242 /* ~[PC Reply]Did you see a girl running by by any chance? Her uncle is searching for her after being chased by wild boars.~ */ DO ~SetGlobal("C#Grey_AskAboutTilda","MYAREA",1)~ + ask_about_tilda
END

CHAIN
IF ~~ THEN bdstalia ask_about_tilda
@243 /* ~[bdstalia]Oh, the poor girl! No, we didn't see her, I'm afraid.~ */
== bdhorst @244 /* ~[bdhorst]There was a man running by just a moment ago, but a girl did not pass here.~ */
EXIT



BEGIN c#besq0a
/* "talking tree" - helper cre "Girl's Voice" */
IF ~Global("C#Brage_SoDQuest","GLOBAL",3)
Global("C#Brage_FirTalk","MYAREA",4)~ THEN talking_tree_attacked
SAY @24 /* [Tilda]Ouch! Watch out where you are pointing your magic. You nearly hit me! */
++ @25 /* [PC Reply]I apologize, we didn't know there is someone in there. */ + talking_tree
++ @26 /* [PC Reply]Oh, I hear a voice! It's a talking tree! */ + talking_tree_05
++ @27 /* [PC Reply]And who would you be? */ + talking_tree_04
++ @28 /* [PC Reply]Are you the runaway girl? Your uncle is looking for you. */ + talking_tree_04
++ @29 /* [PC Reply]Are you Tilda? Come down here at once. */ + talking_tree_01
END

IF ~Global("C#Brage_SoDQuest","GLOBAL",10)
Global("C#Brage_FirTalk","MYAREA",4)~ THEN talking_tree_attacked_01
SAY @30 /* [Tilda]Ouch! Your spell hit me! */
IF ~~ THEN + talking_her_down_02
END

IF ~Global("C#Brage_SoDQuest","GLOBAL",3)
Global("C#Brage_FirTalk","MYAREA",3)~ THEN talking_tree
SAY @31 /* [Tilda]I don't want you here! Go away! */
++ @26 /* [PC Reply]Oh, I hear a voice! It's a talking tree! */ + talking_tree_05
++ @27 /* [PC Reply]And who would you be? */ + talking_tree_04
++ @28 /* [PC Reply]Are you the runaway girl? Your uncle is looking for you. */ + talking_tree_04
++ @29 /* [PC Reply]Are you Tilda? Come down here at once. */ + talking_tree_01
END

IF ~~ THEN talking_tree_01
SAY @32 /* [Tilda]Nein, ich darf nicht mit Fremden gehen. Ihr könntet mich entführen! */
IF ~~ THEN + talking_tree_03
END

IF ~~ THEN talking_tree_02
SAY @33 /* [Tilda]That is what the bad people would say! */
IF ~~ THEN + talking_tree_03
END

IF ~~ THEN talking_tree_03
SAY @34 /* [Tilda]Go away! */
++ @35 /* [PC Reply]If you are Tilda, we are here to bring you to your uncle. You can trust us! */ + talking_tree_02
++ @36 /* [PC Reply]Tilda, your uncle is hurt. He can't come for you. */ + talking_tree_02
++ @37 /* [PC Reply]Aren't you tired of sitting in a tree? We will bring you back to the camp. */ + talking_tree_02
+ ~InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")
GlobalGT("C#Brage_c#besq02_1","GLOBAL",0)~ + @38 /* [PC Reply]Brage, do you think you could talk her down? I know saving her is important to you. */ DO ~SetGlobal("C#BE_c#besq0a_1","GLOBAL",1)~ EXTERN C#BrageJ brage_girl_interaction_01
+ ~InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")
Global("C#Brage_c#besq02_1","GLOBAL",2)~ + @39 /* [PC Reply]Brage, you wanted to save her so badly. Try and talk her down! */ DO ~SetGlobal("C#BE_c#besq0a_1","GLOBAL",1)~ EXTERN C#BrageJ brage_girl_interaction_01
+ ~Global("C#BE_c#besq0a_1","GLOBAL",0)~ + @40 /* [PC Reply]Seems we won't get her down like this. */ DO ~SetGlobal("C#BE_c#besq0a_1","GLOBAL",1)~ EXTERN C#BrageJ brage_girl_interaction_02
+ ~Global("C#BE_c#besq0a_1","GLOBAL",1)~ + @40 /* [PC Reply]Seems we won't get her down like this. */ + talking_tree_06
END

IF ~~ THEN talking_tree_04
SAY @41 /* [Tilda]Das sage ich Euch nicht! Ich soll nicht mit Fremden reden. */
IF ~~ THEN + talking_tree_03
END

IF ~~ THEN talking_tree_05
SAY @42 /* [Tilda]I'm *not* a talking tree, I am... */
IF ~~ THEN + talking_tree_04
END

IF ~~ THEN talking_tree_06
SAY @43 /* [Tilda]Go away! I will wait for my Poppa! */
IF ~~ THEN DO ~SetGlobal("C#Brage_SoDQuest","GLOBAL",4)
SetGlobal("C#Brage_FirTalk","MYAREA",5)~ UNSOLVED_JOURNAL @100002 EXIT
END

APPEND C#BrageJ
IF ~~ THEN brage_girl_interaction_01
SAY @44 /* [Brage]Gladly. I would have tried now even if you haden't asked me. */
IF ~~ THEN + brage_girl_interaction_02
END
END //APPEND

CHAIN
IF ~~ THEN C#BrageJ brage_girl_interaction_02
@45 /* [Brage]Tilda, we really talked to your uncle. He is wearing a green coat and has a short grey beard. He said you were here to pick berries, but were surprised by wild boars. */
== c#besq0a @46 /* [Tilda]That... that might be true but you are still a stranger! */
== C#BrageJ @47 /* [Brage]He said you were gone so quickly he couldn't follow you. The boars hurt his foot, that is why he needed to go and seek help from a healer. He asked us to take you to him. It is tiresome to sit on a tree like that. You are probably cold. Let us guide you to your uncle. He is desparately waiting for you! */
== c#besq0a @48 /* [Tilda]But... I am not supposed to go with strangers... (sob). My hands hurt so much... and I scratched my leg... I want my Poppa! My Poppa... (sob) I will *not* go with you! You have a big weapon! The man who killed my mom and dad had a big weapon, too. Go away! */
== C#BrageJ @49 /* [Brage]I... I am sorry, <CHARNAME>. I can't... */
END
IF ~~ THEN EXTERN c#besq0a talking_tree_06


/* uncle in big coalition camp */
CHAIN
IF ~Global("C#Brage_SoDQuest","GLOBAL",5)
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ THEN c#besq02 in_coalition_camp_c00
@50 /* [Uncle]Oh, it's you! Any news about my niece? Did you find someone who can sing her the Amnian lullaby so you can sing my niece down from that tree, haha? */
== C#BrageJ @51 /* [Brage]...Amnian lullaby? Yes, try me, please. */
== c#besq02 @52 /* [Uncle]Wonderful! Also, es geht ungefähr so. (humms a melody). */
END
IF ~~ THEN EXTERN C#BrageJ in_coalition_camp_c02 

CHAIN
IF ~GlobalGT("C#Brage_SoDQuest","GLOBAL",2)
GlobalLT("C#Brage_SoDQuest","GLOBAL",11)
OR(2)
	Global("C#BE_c#besq02_c1","MYAREA",0)
	Global("C#BE_c#besq02_c2","MYAREA",0)~ THEN c#besq02 in_coalition_camp
@53 /* [Uncle]Oh, it's you! */
== c#besq02 IF ~Global("C#BE_c#besq02_c1","MYAREA",0)
OR(2) IsGabber(Player1) See(Player1)~ THEN @54 /* [Uncle]And I only learned now who you are, <CHARNAME> - Hero of Baldur's Gate, and apparently, er, evoker of powerful divine magic at Boareskyr Bridge, haha - what an honor that you are seeing to rescuing my niece, personally! */ DO ~SetGlobal("C#BE_c#besq02_c1","MYAREA",1)~
== c#besq02 IF ~Global("C#BE_c#besq02_c2","MYAREA",0)~ THEN @55 /* [Uncle]Wie Ihr seht hat mich die Heilerin komplett immobilisiert, verfluchtes Bein. Ich bin leider bezüglich meiner Nichte komplett auf Eure Hilfe angewiesen. */ DO ~SetGlobal("C#BE_c#besq02_c2","MYAREA",1)~
END
IF ~~ THEN + in_coalition_camp_general

APPEND c#besq02
IF ~GlobalGT("C#Brage_SoDQuest","GLOBAL",2)
GlobalLT("C#Brage_SoDQuest","GLOBAL",11)
Global("C#BE_c#besq02_c1","MYAREA",1)
Global("C#BE_c#besq02_c2","MYAREA",1)~ THEN in_coalition_camp_general
SAY @241 /* [Uncle]Any news about my niece?~ */
+ ~Global("C#Brage_SoDQuest","GLOBAL",4)~ + @56 /* [PC Reply]Sie nennt Euch Poppa, oder? Ich glaube, wir haben sie gefunden. Sie sitzt in einem Baum nicht weit von wo wir Euch das erste mal trafen. */ + in_coalition_camp_01
++ @57 /* [PC Reply]Ich bin noch dran. */ + in_coalition_camp_09
+ ~GlobalGT("C#Brage_SoDQuest","GLOBAL",4)~ + @58 /* [PC Reply]Ich werde nicht noch einmal zu ihr zurückkehren. Wir haben keine Zeit dazu. */ + in_coalition_camp_05
+ ~Global("C#Brage_SoDQuest","GLOBAL",3)~ + @59 /* [PC Reply]Ich habe sie nicht gefunden und werde nicht weiter nach ihr suchen. */ + in_coalition_camp_05
END
END //APPEND

CHAIN
IF ~~ THEN c#besq02 in_coalition_camp_c01
@60 /* [Uncle]Nun gut, dann werde ich die Soldaten beknien. Irgendeiner wird mir schon noch helfen, auch wenn die Offiziere keine Zeit für unsere Alltagssorgen haben. */
== bdcorwiJ IF ~InParty("bdcorwin") !StateCheck("bdcorwin",CD_STATE_NOTVALID)
Detect("bdcorwin")~ THEN @61 /* [Corwin]The Flaming Fist will see to your niece being rescued, good man. Talk to Corporal Bence Duncan and tell him Captain Corwin is sending him. */ 
== c#besq02 IF ~InParty("bdcorwin") !StateCheck("bdcorwin",CD_STATE_NOTVALID)
Detect("bdcorwin")~ THEN @62 /* [Uncle]Oh, that is wonderful. Thank you so much, good woman! */
== C#BrageJ IF ~InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")
GlobalGT("C#Brage_c#besq02_1","GLOBAL",0)
InParty("bdcorwin") !StateCheck("bdcorwin",CD_STATE_NOTVALID)
Detect("bdcorwin")~ THEN @63 /* [Brage]Thank you, Corwin. This means a lot to me. */
== C#BrageJ IF ~InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")
Global("C#Brage_SoDQuest","GLOBAL",4)~ THEN @64 /* [Brage]I... am sorry we can't do more. The soldiers will help you, I am sure. */
== c#besq02 @65 /* [Uncle]She will follow a soldier, I told her to trust them. */
END
IF ~Global("C#Brage_SoDQuest","GLOBAL",3)~ THEN DO ~EraseJournalEntry(@100001)
EraseJournalEntry(@100002)
EraseJournalEntry(@100006)
SetGlobal("C#Brage_SoDQuest","GLOBAL",15)~ SOLVED_JOURNAL @100004 EXIT
IF ~Global("C#Brage_SoDQuest","GLOBAL",4)~ THEN DO ~EraseJournalEntry(@100001)
EraseJournalEntry(@100002)
EraseJournalEntry(@100006)
SetGlobal("C#Brage_SoDQuest","GLOBAL",16)~ SOLVED_JOURNAL @100004 EXIT
IF ~InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")
Global("C#Brage_SoDQuest","GLOBAL",3)
GlobalGT("C#Brage_c#besq02_1","GLOBAL",0)
OR(3) !InParty("bdcorwin") StateCheck("bdcorwin",CD_STATE_NOTVALID)
!Detect("bdcorwin")~ THEN EXTERN C#BrageJ brage_interjection_02

CHAIN
IF ~~ THEN C#BrageJ in_coalition_camp_c02
@66 /* [Brage]I know this song! My wife and I sung it to our daughters... I think I remember enough to sing it to the girl. */
DO ~SetGlobal("C#BE_SoDQBKnowsSong","MYAREA",1)~
== c#besq02 @67 /* [Uncle]Brilliant! But you have to change one line at the end. That one I remember. It's "and let the sheep have fleece". Instead of... */
== C#BrageJ @68 /* [Brage]..."and let us sleep in peace". (grins) Yes, a child of the right age would have fun in rewriting the lyrics. My... my older once sung "and leave us *be* in peace", because she didn't want to go to sleep yet... */
== c#besq02 @69 /* [Uncle]Well, that's - that's great, no? Seems like you could sing it to her, then. */
END
IF ~GlobalLT("C#Brage_SoDQuest","GLOBAL",5)~ THEN EXTERN c#besq02 in_coalition_camp_04
+ ~GlobalGT("C#Brage_SoDQuest","GLOBAL",4)~ + @70 /* [PC Reply]Well, Brage, seems you have your first engagement as a bard. I'll count on you to sing the girl her lullaby. */ EXTERN C#BrageJ brage_uncle_interaction_camp_01
+ ~GlobalGT("C#Brage_SoDQuest","GLOBAL",4)~ + @58 /* [PC Reply]Ich werde nicht noch einmal zu ihr zurückkehren. Wir haben keine Zeit dazu. */ EXTERN c#besq02 in_coalition_camp_05

CHAIN
IF ~~ THEN c#besq02 in_coalition_camp_c03
@71 /* [Uncle]Oh, that would be wonderful! */
== bdimoen IF ~InParty("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID) See("%IMOEN_DV%")
!Dead("C#Brage")~ THEN @72 /* [Imoen]Hey, Amnian lullaby? I would think that Brage could know it. We should ask him! */ 
== bdjaheiJ IF ~InParty("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID) See("Jaheira")
OR(3) !InParty("%IMOEN_DV%") StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID) !See("%IMOEN_DV%")
!Dead("C#Brage")~ THEN @73 /* [Jaheira]<CHARNAME>, Brage was a father of two little daughters. There is a good chance he sang this song to them. Even if it will be a very painful memory to him, I am sure he will be willing to try. */
END
IF ~~ THEN DO ~SetGlobal("C#Brage_SoDQuest","GLOBAL",5)~ UNSOLVED_JOURNAL @100006 + in_coalition_camp_09

APPEND c#besq02

IF ~~ THEN in_coalition_camp_01
SAY @74 /* [Uncle]Oh, das sind ja wunderbare Neuigkeiten! Ich meine... dass sie lebt. Aber... sie kommt nicht runter? Yes, that sounds like her. Ich habe ihr eingebleut, nicht mit Fremden zu gehen... */
++ @75 /* [PC Reply]Und nun? Wie kriegen wir sie da runter ohne ihr Angst zu machen? */ + in_coalition_camp_10
++ @76 /* [PC Reply]Ihr müsst uns helfen. Sie kann da nicht mehr lange so sitzen. */ + in_coalition_camp_10
++ @58 /* [PC Reply]Ich werde nicht noch einmal zu ihr zurückkehren. Wir haben keine Zeit dazu. */ + in_coalition_camp_05
END

IF ~~ THEN in_coalition_camp_02
SAY @77 /* [Uncle]Well, it seems your comrade sings it well enough? */
IF ~~ THEN + in_coalition_camp_03
END

IF ~~ THEN in_coalition_camp_03
SAY @78 /* [Uncle]Singing it would be the smartest thing to do, I think. I don't have an item you could bribe her with... */
IF ~~ THEN + in_coalition_camp_04
IF ~Global("C#BE_SoDQBKnowsSong","MYAREA",0)
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ THEN EXTERN C#BrageJ in_coalition_camp_c02
END

IF ~~ THEN in_coalition_camp_04
SAY @79 /* [Uncle](sigh) If you won't sing the song then I'm at a loss what to do - other than begging the soldiers to go to her rescue. She should trust a soldier in uniform. */
++ @80 /* [PC Reply]She trusts soldiers? I could try and get a soldier's uniform. */ + in_coalition_camp_06
++ @81 /* [PC Reply]Ihr wisst, dass sie Soldaten traut, und belästigt mich mit der ganzen Sache? */ + in_coalition_camp_08
+ ~Global("C#BE_SoDQBKnowsSong","MYAREA",1)
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @70 /* [PC Reply]Well, Brage, seems you have your first engagement as a bard. I'll count on you to sing the girl her lullaby. */ EXTERN C#BrageJ brage_uncle_interaction_camp_01
+ ~OR(3) !InParty("C#Brage") StateCheck("C#Brage",CD_STATE_NOTVALID) !Detect("C#Brage")
!Dead("C#Brage")~ + @82 /* [PC Reply]Well, I don't know the song well enough to sing it so I'll better find someone who can. */ + in_coalition_camp_c03
++ @83 /* [PC Reply]Ja, bitte fragt die Soldaten. Ich bin mir nicht sicher, wann ich das nächste Mal Zeit haben werde, zu ihr zu gehen. */ + in_coalition_camp_c01
++ @58 /* [PC Reply]Ich werde nicht noch einmal zu ihr zurückkehren. Wir haben keine Zeit dazu. */ + in_coalition_camp_05
END
 
IF ~~ THEN in_coalition_camp_05
SAY @84 /* [Uncle]Oh, das ist nicht gut... */
IF ~~ THEN + in_coalition_camp_c01
END

IF ~~ THEN in_coalition_camp_06
SAY @85 /* [Uncle]Oho, you understimate Tilda's cleverness. She already saw you, putting on a uniform *now* would make you so suspicious she wouldn't go with you even if you'd sing her her mother's favorite song. (sighs) */
++ @81 /* [PC Reply]Ihr wisst, dass sie Soldaten traut, und belästigt mich mit der ganzen Sache? */ + in_coalition_camp_08
+ ~Global("C#BE_SoDQBKnowsSong","MYAREA",1)
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @70 /* [PC Reply]Well, Brage, seems you have your first engagement as a bard. I'll count on you to sing the girl her lullaby. */ EXTERN C#BrageJ brage_uncle_interaction_camp_01
+ ~OR(3) !InParty("C#Brage") StateCheck("C#Brage",CD_STATE_NOTVALID) !Detect("C#Brage")
!Dead("C#Brage")~ + @82 /* [PC Reply]Well, I don't know the song well enough to sing it so I'll better find someone who can. */ + in_coalition_camp_c03
++ @83 /* [PC Reply]Ja, bitte fragt die Soldaten. Ich bin mir nicht sicher, wann ich das nächste Mal Zeit haben werde, zu ihr zu gehen. */ + in_coalition_camp_c01
++ @58 /* [PC Reply]Ich werde nicht noch einmal zu ihr zurückkehren. Wir haben keine Zeit dazu. */ + in_coalition_camp_05
END

IF ~~ THEN in_coalition_camp_07
SAY @86 /* [Uncle]Well... I see what you are getting at. But it *is* the most personal thing I can think of right now. */
IF ~~ THEN + in_coalition_camp_03
IF ~Global("C#BE_SoDQBKnowsSong","MYAREA",0)
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ THEN EXTERN C#BrageJ in_coalition_camp_c02
END

IF ~~ THEN in_coalition_camp_08
SAY @87 /* [Uncle]Ah, it's not like they are idling away time and me the only refugee in need, you know. And - you were the first people I met after escaping the boars. */
+ ~Global("C#BE_SoDQBKnowsSong","MYAREA",1)
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @70 /* [PC Reply]Well, Brage, seems you have your first engagement as a bard. I'll count on you to sing the girl her lullaby. */ EXTERN C#BrageJ brage_uncle_interaction_camp_01
+ ~OR(3) !InParty("C#Brage") StateCheck("C#Brage",CD_STATE_NOTVALID) !Detect("C#Brage")~ + @82 /* [PC Reply]Well, I don't know the song well enough to sing it so I'll better find someone who can. */ + in_coalition_camp_c03
++ @83 /* [PC Reply]Ja, bitte fragt die Soldaten. Ich bin mir nicht sicher, wann ich das nächste Mal Zeit haben werde, zu ihr zu gehen. */ + in_coalition_camp_c01
++ @58 /* [PC Reply]Ich werde nicht noch einmal zu ihr zurückkehren. Wir haben keine Zeit dazu. */ + in_coalition_camp_05
END

IF ~~ THEN in_coalition_camp_09
SAY @88 /* [Uncle]Thank you so much! I hope she'll return to safety soon. She can't be in a tree forever! */
IF ~~ THEN EXIT
END

IF ~~ THEN in_coalition_camp_10
SAY @89 /* [Uncle]Ach, dieses verflixte Bein - mich hinzutragen ist ja wohl keine Option. Hmm, Ihr müsstet irgendwie ihr Vertrauen gewinnen. leider hat sie ihr Lieblingsspielzeug bei sich. Ihr müsst ihr was sagen oder zeigen, durch das sie weiß, dass ich Euch schicke. Vielleicht ihre liebste Süßigkeit? Nein, der Gedanke, dass Ihr sie damit zu bestechen versucht weckt falsche Assoziationen. Ach, wenn ich nur was hätte womit ihr ihr beweisen könnt, dass ich Euch schicke... */
= @90 /* Ich hab's! Ihr singt ihr ihr liebstes Schlaflied vor. Das, was ihre Mutter ihr immer gesungen hat, und dazu sagt ihr ihr den Namen ihrer Eltern: Mark und Ava. It's an Amnian lullaby. Also, es geht ungefähr so. (humms a melody). */ 
IF ~~ THEN + in_coalition_camp_11
END

IF ~~ THEN in_coalition_camp_11
SAY @91 /* [Uncle]Äh, ich weiß den Text selbst nicht ganz - Tilda hat es immer *mir* gesungen, nicht andersrum... */
++ @92 /* [PC Reply]You want me to sing a song to her you don't know yourself? */ + in_coalition_camp_07
++ @93 /* [PC Reply]You want me to *sing* to her? */ + in_coalition_camp_03
+ ~InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @94 /* [PC Reply]I *think* I heard that before but I don't know the text, either. */ EXTERN C#BrageJ in_coalition_camp_c02
+ ~InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @95 /* [PC Reply]Noone sung it were I grew up, that's for sure. I can't sing this song. */ EXTERN C#BrageJ in_coalition_camp_c02
+ ~OR(3) !InParty("C#Brage") StateCheck("C#Brage",CD_STATE_NOTVALID) !Detect("C#Brage")~ + @96 /* [PC Reply]That sounds like a great idea but I can't sing this song. */ + in_coalition_camp_04
+ ~OR(3) !InParty("C#Brage") StateCheck("C#Brage",CD_STATE_NOTVALID) !Detect("C#Brage")~ + @94 /* [PC Reply]I *think* I heard that before but I don't know the text, either. */ + in_coalition_camp_04
++ @97 /* [PC Reply]I'll come back later. */ EXIT
END


END //APPEND

APPEND C#BrageJ
IF ~~ THEN brage_uncle_interaction_camp_01
SAY @98 /* [Brage]Gladly. */
IF ~~ THEN DO ~EraseJournalEntry(@100001)
EraseJournalEntry(@100002)
EraseJournalEntry(@100006)
SetGlobal("C#Brage_SoDQuest","GLOBAL",8)~ UNSOLVED_JOURNAL @100005 EXTERN c#besq02 in_coalition_camp_09
END
END //APPEND

/* "Talking tree", after talking to her the first time */
CHAIN 
IF ~Global("C#Brage_FirTalk","MYAREA",5)~ THEN c#besq0a talking_tree_again
@99 /* [Tilda]Why are you still here? Go away! */
== bdimoen IF ~Global("C#BE_SoDQc#besq0aIntIm","MYAREA",0) InParty("%IMOEN_DV%") InMyArea("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @100 /* [Imoen]Yes, we are strangers, but we are the good kind of strangers! You don't want to wait for the wrong ones that might find you when we are gone! */ DO ~SetGlobal("C#BE_SoDQc#besq0aIntIm","MYAREA",1)~
== bdneeraj IF ~Global("C#BE_SoDQc#besq0aIntNe","MYAREA",0)
InMyArea("Neera") InParty("Neera") !StateCheck("Neera",CD_STATE_NOTVALID)~ THEN @101 /* [Neera]Oh, poor girl. Don't you wanna come down and wait in the camp in a dry and warm tent instead of the wet tree? */ DO ~SetGlobal("C#BE_SoDQc#besq0aIntNe","MYAREA",1)~
== bdsafanj IF ~Global("C#BE_SoDQc#besq0aIntSa","MYAREA",0)
InMyArea("Safana") InParty("Safana") !StateCheck("Safana",CD_STATE_NOTVALID)
InMyArea("Neera") InParty("Neera") !StateCheck("Neera",CD_STATE_NOTVALID)~ THEN @102 /* [Safana]Congratulations, Neera. You understood the problem. */ DO ~SetGlobal("C#BE_SoDQc#besq0aIntSa","MYAREA",1)~
== bdminscj IF ~Global("C#BE_SoDQc#besq0aIntMi","MYAREA",0)
InMyArea("Minsc") InParty("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN @103 /* [Minsc]I am sure Boo could get her down. But Boo is with Minsc! So the girl needs to come down to see Boo... Tricky! */ DO ~SetGlobal("C#BE_SoDQc#besq0aIntMi","MYAREA",1)~
== bdvoghij IF ~Global("C#BE_SoDQc#besq0aIntVo","MYAREA",0)
InMyArea("Voghiln") InParty("Voghiln") !StateCheck("Voghiln",CD_STATE_NOTVALID)~ THEN @104 /* [Voghiln]Ah, reminds a bit of young cats in trees, ja? Also difficult to get down. */ DO ~SetGlobal("C#BE_SoDQc#besq0aIntVo","MYAREA",1)~
END
+ ~Global("C#Brage_SoDQuest","GLOBAL",8)
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @105 /* [PC Reply]Brage, you said you know this children's song? */ EXTERN C#BrageJ sing_to_tilda
+ ~GlobalGT("C#Brage_SoDQuest","GLOBAL",4)
Global("C#BE_c#besq0a_4","GLOBAL",0)~ + @106 /* [PC Reply]We talked to your "Poppa". Your mom used to sing you a song, and you sang "and let the sheep have fleece" instead of "and let us sleep in peace". */ FLAGS 512 DO ~SetGlobal("C#BE_c#besq0a_4","GLOBAL",1)~ + talking_tree_again_06
+ ~GlobalGT("C#Brage_SoDQuest","GLOBAL",4)
Global("C#BE_c#besq0a_5","GLOBAL",0)~ + @107 /* [PC Reply]Your parents' names were Mark und Ava. Your Poppa told us. */ FLAGS 512  DO ~SetGlobal("C#BE_c#besq0a_5","GLOBAL",1)~ + talking_tree_again_06
+ ~Global("C#BE_c#besq0a_2","GLOBAL",0)~ + @108 /* [PC Reply]We will stand here until you'll come down, Tilda. It's cold and wet, and you are probably hungry. You can't be up there forever. */ DO ~SetGlobal("C#BE_c#besq0a_2","GLOBAL",1)~ + talking_tree_again_05
+ ~Global("C#BE_c#besq0a_2","GLOBAL",1)
Global("C#BE_c#besq0a_Brage_1","GLOBAL",0)
Global("C#Brage_SoDQuest","GLOBAL",8)
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @109 /* [PC Reply]I have nothing to eat here, but there will be at the camp - where your uncle is. I'll just wait here until you give up. */ DO ~SetGlobal("C#BE_c#besq0a_Brage_1","GLOBAL",1)~ EXTERN C#BrageJ brage_talking_her_down_03
+ ~Global("C#BE_c#besq0a_2","GLOBAL",1)
Global("C#BE_c#besq0a_Brage_1","GLOBAL",0)
!Global("C#Brage_SoDQuest","GLOBAL",8)
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @109 /* [PC Reply]I have nothing to eat here, but there will be at the camp - where your uncle is. I'll just wait here until you give up. */ DO ~SetGlobal("C#BE_c#besq0a_Brage_1","GLOBAL",1)~ EXTERN C#BrageJ brage_talking_her_down_04
+ ~Global("C#BE_c#besq0a_2","GLOBAL",1)
Global("C#BE_c#besq0a_Brage_1","GLOBAL",1)
Global("C#Brage_SoDQuest","GLOBAL",8)
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @109 /* [PC Reply]I have nothing to eat here, but there will be at the camp - where your uncle is. I'll just wait here until you give up. */ DO ~SetGlobal("C#BE_c#besq0a_Brage_1","GLOBAL",1)~ EXTERN C#BrageJ brage_talking_her_down_02
+ ~Global("C#BE_c#besq0a_2","GLOBAL",1)
Global("C#BE_c#besq0a_Brage_1","GLOBAL",1)
!Global("C#Brage_SoDQuest","GLOBAL",8)
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @109 /* [PC Reply]I have nothing to eat here, but there will be at the camp - where your uncle is. I'll just wait here until you give up. */ + talking_tree_again_02
+ ~Global("C#BE_c#besq0a_2","GLOBAL",1)
OR(3)
!InParty("C#Brage") StateCheck("C#Brage",CD_STATE_NOTVALID) !Detect("C#Brage")~ + @109 /* [PC Reply]I have nothing to eat here, but there will be at the camp - where your uncle is. I'll just wait here until you give up. */ + talking_tree_again_02
+ ~Global("C#BE_c#besq0a_3","GLOBAL",0)
OR(4)
Class(Player1,FIGHTER_ALL)
Class(Player1,CLERIC_ALL)
Class(Player1,PALADIN_ALL)
Class(Player1,RANGER_ALL)~ + @110 /* [PC Reply]Tilda, you see this weapon, yes? I can use it like an axe. I will cut down the tree with it now, if you don't come down. */ DO ~SetGlobal("C#BE_c#besq0a_3","GLOBAL",1)~ + talking_tree_again_c_01
+ ~Global("C#BE_c#besq0a_3","GLOBAL",0)
OR(6)
Class(Player1,MAGE_ALL)
Class(Player1,CLERIC_ALL)
Class(Player1,SORCERER)
Class(Player1,SHAMAN)
Class(Player1,BARD_ALL)
Class(Player1,DRUID_ALL)~ + @111 /* [PC Reply]Tilda, you know what I can do? I can wield magic. And I will use it to blast you down the tree now, if you don't come down. */ DO ~SetGlobal("C#BE_c#besq0a_3","GLOBAL",1)~ + talking_tree_again_c_01
+ ~Global("C#BE_c#besq0a_3","GLOBAL",0)
OR(2)
Class(Player1,MONK)
Class(Player1,THIEF_ALL)~ + @112 /* [PC Reply]Tilda, you know what I can do? I can climb up and get you. I will and carry you down the tree now, if you don't come down. */ DO ~SetGlobal("C#BE_c#besq0a_3","GLOBAL",1)~ + talking_tree_again_c_01
++ @113 /* [PC Reply]You sure you don't want to come down? */ + talking_tree_again_06

APPEND_EARLY c#besq0a

IF ~~ THEN talking_tree_again_01
SAY @114 /* [Tilda]That is true... (sob) */
IF ~~ THEN + talking_tree_again_06
END

IF ~~ THEN talking_tree_again_02
SAY @115 /* [Tilda]Ha! We'll see to that. I'm *not* scared of you! */
IF ~~ THEN DO ~SetGlobal("C#BE_SoDQuestWaitTimer","MYAREA",1)
RealSetGlobalTimer("C#BE_SoDQuestTimer","GLOBAL",15)~ EXIT
END

IF ~~ THEN talking_tree_again_03
SAY @34 /* [Tilda]Go away! */
IF ~~ THEN EXIT
END

IF ~~ THEN talking_tree_again_04
SAY @116 /* [Tilda](Wails) You are soooo mean! */
IF ~~ THEN DO ~SetGlobal("C#BE_SoDQuestMean","GLOBAL",1) 
SetGlobal("C#Brage_FirTalk","MYAREA",11) ReputationInc(-1)~ + talking_her_down_02
END

IF ~~ THEN talking_tree_again_05
SAY @117 /* [Tilda]I won't come down! I'm almost not wet. My leg really, really doesn't hurt! At all! And I'm... I'm not hungry... (sob) */
+ ~Global("C#Brage_SoDQuest","GLOBAL",8)
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @109 /* [PC Reply]I have nothing to eat here, but there will be at the camp - where your uncle is. I'll just wait here until you give up. */ DO ~SetGlobal("C#BE_c#besq0a_Brage_1","GLOBAL",1)~ EXTERN C#BrageJ brage_talking_her_down_03
+ ~!Global("C#Brage_SoDQuest","GLOBAL",8)
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @109 /* [PC Reply]I have nothing to eat here, but there will be at the camp - where your uncle is. I'll just wait here until you give up. */ DO ~SetGlobal("C#BE_c#besq0a_Brage_1","GLOBAL",1)~ EXTERN C#BrageJ brage_talking_her_down_04
+ ~OR(3)
!InParty("C#Brage") StateCheck("C#Brage",CD_STATE_NOTVALID) !Detect("C#Brage")~ + @109 /* [PC Reply]I have nothing to eat here, but there will be at the camp - where your uncle is. I'll just wait here until you give up. */ + talking_tree_again_02
++ @118 /* [PC Reply]I'll think of something else. */ + talking_tree_again_03 
++ @119 /* [PC Reply]We don't have time for that now. */ + talking_tree_again_03 
END

IF ~~ THEN talking_tree_again_06
SAY @120 /* [Tilda]You are strangers! Go away! */
+ ~Global("C#Brage_SoDQuest","GLOBAL",8)
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @105 /* [PC Reply]Brage, you said you know this children's song? */ EXTERN C#BrageJ sing_to_tilda
+ ~GlobalGT("C#Brage_SoDQuest","GLOBAL",4)
Global("C#BE_c#besq0a_4","GLOBAL",0)~ + @106 /* [PC Reply]We talked to your "Poppa". Your mom used to sing you a song, and you sang "and let the sheep have fleece" instead of "and let us sleep in peace". */ FLAGS 512 DO ~SetGlobal("C#BE_c#besq0a_4","GLOBAL",1)~ + talking_tree_again_06
+ ~GlobalGT("C#Brage_SoDQuest","GLOBAL",4)
Global("C#BE_c#besq0a_5","GLOBAL",0)~ + @107 /* [PC Reply]Your parents' names were Mark und Ava. Your Poppa told us. */ FLAGS 512 DO ~SetGlobal("C#BE_c#besq0a_5","GLOBAL",1)~ + talking_tree_again_06
+ ~Global("C#BE_c#besq0a_2","GLOBAL",0)~ + @108 /* [PC Reply]We will stand here until you'll come down, Tilda. It's cold and wet, and you are probably hungry. You can't be up there forever. */ DO ~SetGlobal("C#BE_c#besq0a_2","GLOBAL",1)~ + talking_tree_again_05
+ ~Global("C#BE_c#besq0a_2","GLOBAL",1)
Global("C#BE_c#besq0a_Brage_1","GLOBAL",0)
Global("C#Brage_SoDQuest","GLOBAL",8)
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @109 /* [PC Reply]I have nothing to eat here, but there will be at the camp - where your uncle is. I'll just wait here until you give up. */ DO ~SetGlobal("C#BE_c#besq0a_Brage_1","GLOBAL",1)~ EXTERN C#BrageJ brage_talking_her_down_03
+ ~Global("C#BE_c#besq0a_2","GLOBAL",1)
Global("C#BE_c#besq0a_Brage_1","GLOBAL",0)
!Global("C#Brage_SoDQuest","GLOBAL",8)
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @109 /* [PC Reply]I have nothing to eat here, but there will be at the camp - where your uncle is. I'll just wait here until you give up. */ DO ~SetGlobal("C#BE_c#besq0a_Brage_1","GLOBAL",1)~ EXTERN C#BrageJ brage_talking_her_down_04
+ ~Global("C#BE_c#besq0a_2","GLOBAL",1)
Global("C#BE_c#besq0a_Brage_1","GLOBAL",1)
Global("C#Brage_SoDQuest","GLOBAL",8)
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @109 /* [PC Reply]I have nothing to eat here, but there will be at the camp - where your uncle is. I'll just wait here until you give up. */ DO ~SetGlobal("C#BE_c#besq0a_Brage_1","GLOBAL",1)~ EXTERN C#BrageJ brage_talking_her_down_02
+ ~Global("C#BE_c#besq0a_2","GLOBAL",1)
Global("C#BE_c#besq0a_Brage_1","GLOBAL",1)
!Global("C#Brage_SoDQuest","GLOBAL",8)
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @109 /* [PC Reply]I have nothing to eat here, but there will be at the camp - where your uncle is. I'll just wait here until you give up. */ + talking_tree_again_02
+ ~Global("C#BE_c#besq0a_2","GLOBAL",1)
OR(3)
!InParty("C#Brage") StateCheck("C#Brage",CD_STATE_NOTVALID) !Detect("C#Brage")~ + @109 /* [PC Reply]I have nothing to eat here, but there will be at the camp - where your uncle is. I'll just wait here until you give up. */ + talking_tree_again_02
+ ~Global("C#BE_c#besq0a_3","GLOBAL",0)
OR(4)
Class(Player1,FIGHTER_ALL)
Class(Player1,CLERIC_ALL)
Class(Player1,PALADIN_ALL)
Class(Player1,RANGER_ALL)~ + @110 /* [PC Reply]Tilda, you see this weapon, yes? I can use it like an axe. I will cut down the tree with it now, if you don't come down. */ DO ~SetGlobal("C#BE_c#besq0a_3","GLOBAL",1)~ + talking_tree_again_c_01
+ ~Global("C#BE_c#besq0a_3","GLOBAL",0)
OR(6)
Class(Player1,MAGE_ALL)
Class(Player1,CLERIC_ALL)
Class(Player1,SORCERER)
Class(Player1,SHAMAN)
Class(Player1,BARD_ALL)
Class(Player1,DRUID_ALL)~ + @111 /* [PC Reply]Tilda, you know what I can do? I can wield magic. And I will use it to blast you down the tree now, if you don't come down. */ DO ~SetGlobal("C#BE_c#besq0a_3","GLOBAL",1)~ + talking_tree_again_c_01
+ ~Global("C#BE_c#besq0a_3","GLOBAL",0)
OR(2)
Class(Player1,MONK)
Class(Player1,THIEF_ALL)~ + @112 /* [PC Reply]Tilda, you know what I can do? I can climb up and get you. I will and carry you down the tree now, if you don't come down. */ DO ~SetGlobal("C#BE_c#besq0a_3","GLOBAL",1)~ + talking_tree_again_c_01
++ @113 /* [PC Reply]You sure you don't want to come down? */ + talking_tree_again_06
++ @121 /* [PC Reply]You surely are testing my patience, girl! */ + talking_tree_again_06
++ @118 /* [PC Reply]I'll think of something else. */ + talking_tree_again_03 
END


IF WEIGHT #-1
~Global("C#Brage_FirTalk","MYAREA",10)~ THEN talking_tree_again_magic_hit
SAY @122 /* [Tilda]You hit me with magic! You did that on purpose! */
IF ~~ THEN + talking_tree_again_04
END

/* timer run out first time */
IF WEIGHT #-1
~Global("C#BE_SoDQuestWaitTimer","MYAREA",1)
RealGlobalTimerExpired("C#BE_SoDQuestTimer","GLOBAL")~ THEN talking_her_down_03
SAY @123 /* [Tilda]You are still there. I am not scared of you! */
IF ~~ THEN DO ~IncrementGlobal("C#BE_SoDQuestWaitTimer","MYAREA",1)
RealSetGlobalTimer("C#BE_SoDQuestTimer","GLOBAL",15)~ EXIT
END

/* timer run out second time */
IF WEIGHT #-1
~Global("C#BE_SoDQuestWaitTimer","MYAREA",2)
RealGlobalTimerExpired("C#BE_SoDQuestTimer","GLOBAL")~ THEN talking_her_down_04
SAY @124 /* [Tilda]You are still there! (sniff) */
IF ~~ THEN DO ~IncrementGlobal("C#BE_SoDQuestWaitTimer","MYAREA",1)
RealSetGlobalTimer("C#BE_SoDQuestTimer","GLOBAL",15)~ EXIT
END

/* timer run out third time */
IF WEIGHT #-1
~Global("C#BE_SoDQuestWaitTimer","MYAREA",3)
RealGlobalTimerExpired("C#BE_SoDQuestTimer","GLOBAL")~ THEN talking_her_down_04
SAY @125 /* [Tilda]I... (sniff) */
IF ~~ THEN DO ~IncrementGlobal("C#BE_SoDQuestWaitTimer","MYAREA",1)~ + talking_her_down_02
END

END //APPEND

CHAIN
IF ~~ THEN c#besq0a talking_tree_again_c_01
@126 /* [Tilda]What?! You are... you are so mean! You can't do that... (sob) */
== C#BrageJ IF ~Global("C#Brage_SoDQuest","GLOBAL",8)
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ THEN @127 /* [Brage]<CHARNAME>! Let us not frighten her any more as she already is. Let me sing to her like her uncle suggested! */ DO ~SetGlobal("C#BE_c#besq0a_Brage_2","GLOBAL",1)~ 
== C#BrageJ IF ~!Global("C#Brage_SoDQuest","GLOBAL",8)
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ THEN @128 /* [Brage]<CHARNAME>! Let us not frighten her any more as she already is. There must be another way! */ DO ~SetGlobal("C#BE_c#besq0a_Brage_2","GLOBAL",1)~
== bdimoen IF ~InParty("%IMOEN_DV%") InMyArea("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @129 /* [Imoen]Aw, <CHARNAME>, don't be so mean! She's really scared now. */
== bdedwinj IF ~InMyArea("Edwin") InParty("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @130 /* [Edwin]Can I use a fireball - please? (Maybe the wailing and shrieking of that brat will be silenced then for good. Unbearable!) */
== bdminscj IF ~InMyArea("Minsc") InParty("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN @131 /* [Minsc]Minsc gets a headache from the child's crying! Boo says the threat scared her. */
== bddynahj IF ~InMyArea("Dynaheir") InParty("Dynaheir") !StateCheck("Dynaheir",CD_STATE_NOTVALID)~ THEN @132 /* [Dynaheir]There is no need to frighten the child like this. Let us return to camp and ask the uncle for something she remembers. */
== bdjaheij IF ~InMyArea("Jaheira") InParty("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @133 /* [Jaheira]Is it your intention to frighten her down the tree? */
== bdkhalij IF ~InMyArea("Khalid") InParty("Khalid") !StateCheck("Khalid",CD_STATE_NOTVALID)~ THEN @134 /* [Khalid]There must b-be a less violent solution, <CHARNAME>. */
== bdglintj IF ~InMyArea("Glint") InParty("Glint") !StateCheck("Glint",CD_STATE_NOTVALID)~ THEN @135 /* [Glint]Ah, seeing her like this is unsettling. Maybe that's not the best idea, <CHARNAME>. */
== bdbaeloj IF ~InMyArea("Baeloth") InParty("Baeloth") !StateCheck("Baeloth",CD_STATE_NOTVALID)~ THEN @136 /* [Baeloth]Yes - make her wail and shuffle a bit more! She'll find the way down then. The fastest way! */
== bdmkhiij IF ~InMyArea("MKhiin") InParty("MKhiin") !StateCheck("MKhiin",CD_STATE_NOTVALID)~ THEN @137 /* [M'Khiin]Human child - makes much noise in hostile place. Better not pressure her like you do. */
== bdcorwij IF ~InMyArea("Corwin") InParty("Corwin") !StateCheck("Corwin",CD_STATE_NOTVALID)~ THEN @138 /* [Corwin]Can't you hear how *frightened* she is? Stop this nonsense at once! */
== bdviconj IF ~InMyArea("Viconia") InParty("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @139 /* [Viconia]Be quick about it, <CHARNAME>, before the whole pass hears us. */
== bdvoghij IF ~InMyArea("Voghiln") InParty("Voghiln") !StateCheck("Voghiln",CD_STATE_NOTVALID)~ THEN @140 /* [Voghiln]I would offer to climb up instead, but I don't think it would scare her less... And branches are really narrow for grown-ups, ja? */ 
== bdrasaaj IF ~InMyArea("Rasaad") InParty("Rasaad") !StateCheck("Rasaad",CD_STATE_NOTVALID)~ THEN @141 /* [Rasaad]Do not scare her, <CHARNAME>. We need to get her down in one piece body *and* soul, or our efforts are in vain! */
== bdsafanj IF ~InMyArea("Safana") InParty("Safana") !StateCheck("Safana",CD_STATE_NOTVALID)~ THEN @142 /* [Safana]Oh, please, this whailing is unbearable. Just do it an be over with! */
== bddornj IF ~InMyArea("Dorn") InParty("Dorn") !StateCheck("Dorn",CD_STATE_NOTVALID)~ THEN @143 /* [Dorn]Finally, a good idea. Do it and be quick, <CHARNAME>. */
== bdneeraj IF ~InMyArea("Neera") InParty("Neera") !StateCheck("Neera",CD_STATE_NOTVALID)~ THEN @144 /* [Neera]Uuh, I don't think she likes this. */
END
+ ~Global("C#Brage_SoDQuest","GLOBAL",8)
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @145 /* [PC Reply]Alright, Brage, sing to her. */ EXTERN C#BrageJ sing_to_tilda
++ @146 /* [PC Reply]On second thought, I will not do that. */ + talking_tree_again_03
++ @147 /* [PC Reply]Oh, yes, Tilda. I'm coming for you now! */ + talking_tree_again_04

CHAIN
IF ~~ THEN C#BrageJ sing_to_tilda
@148 /* [Brage]Tilda, your uncle told us your favorite bedtime song. (Sings the first lines of a lullaby.) */
== c#besq0a @149 /* [Tilda]That... that is mom's song! But... but I'm not supposed to... (sob) */
== C#BrageJ @150 /* [Brage]"...and let us sleep in peace." But you sang the last line differently, did you not? You always sang "...and let the sheep have fleece!" */
== c#besq0a @151 /* [Tilda]...(sniff) */
== C#BrageJ @152 /* [Brage]I sang this song to my own daughters, Tilda. They are... they are dead now. */
== c#besq0a @153 /* [Tilda](sniff) How did they die? My parents died by a man with a big weapon. */
== C#BrageJ @154 /* [Brage]My daughters... also had that fate, Tilda. */
== c#besq0a @155 /* [Tilda]...And Poppa really sent you? */
END
++ @156 /* [PC Reply]He did. */ EXTERN c#besq0a talking_her_down
++ @157 /* [PC Reply]I can't be bothered with this. You coming down or what? */ EXTERN C#BrageJ brage_talking_her_down

APPEND c#besq0a

IF ~~ THEN talking_her_down
SAY @158 /* [Tilda]...And Poppa is really waiting in the big camp? */
++ @159 /* [PC Reply]He is. */ + talking_her_down_01
++ @160 /* [PC Reply]I have no patience for this. */ EXTERN C#BrageJ brage_talking_her_down_01
END

IF ~~ THEN talking_her_down_01
SAY @161 /* [Tilda]...But... but... (sniff) */
IF ~~ THEN DO ~ReputationInc(1)~ + talking_her_down_02
END

IF ~~ THEN talking_her_down_02
SAY @162 /* [Tilda]I... I am climbing down now. */
IF ~~ THEN DO ~SetGlobal("C#Brage_FirTalk","MYAREA",6) SetGlobal("C#Brage_SoDQuest","GLOBAL",9)~ EXIT
END

END //APPEND

/* Tilda came down the tree */
BEGIN c#besq01
CHAIN
IF WEIGHT #-1
~Global("C#Brage_SoDQuest","GLOBAL",10)~ THEN c#besq01 down_from_tree
@163 /* [Tilda]See, I am down now! But I am not going with you! I will go to my uncle alone! */
== C#BrageJ IF ~InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ THEN @164 /* [Brage]Tilda, wait - stop! Don't... */
END
IF ~~ THEN DO ~EraseJournalEntry(@100005) 
SetGlobal("C#Brage_SoDQuest","GLOBAL",11) 
StartCutSceneMode()
StartCutScene("c#bescu1")~ UNSOLVED_JOURNAL @100008 EXIT
IF ~InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ THEN DO ~EraseJournalEntry(@100005) 
SetGlobal("C#Brage_SoDQuest","GLOBAL",12) StartCutSceneMode()
StartCutScene("c#bescu1")~ UNSOLVED_JOURNAL @100008 EXIT
IF ~Global("C#BE_SoDQuestMean","GLOBAL",1)~ THEN DO ~EraseJournalEntry(@100005) 
SetGlobal("C#Brage_SoDQuest","GLOBAL",11) 
StartCutSceneMode()
StartCutScene("c#bescu1")~ UNSOLVED_JOURNAL @100010 EXIT
IF ~Global("C#BE_SoDQuestMean","GLOBAL",1)
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ THEN DO ~EraseJournalEntry(@100005) 
SetGlobal("C#Brage_SoDQuest","GLOBAL",12) StartCutSceneMode()
StartCutScene("c#bescu1")~ UNSOLVED_JOURNAL @100010 EXIT


APPEND C#BrageJ
IF ~~ THEN brage_talking_her_down
SAY @165 /* [Brage]He did sent us, Tilda. <CHARNAME>, a little more patience - please? */
IF ~~ THEN EXTERN c#besq0a talking_her_down
END

IF ~~ THEN brage_talking_her_down_01
SAY @166 /* [Brage]He is waiting for you. Please, Tilda, come down now. */
IF ~~ THEN EXTERN c#besq0a talking_her_down_01
END

IF ~~ THEN brage_talking_her_down_02
SAY @167 /* [Brage]Please, <CHARNAME>. Let me?... */
++ @168 /* [PC Reply]Alright, sing to her. */ + sing_to_tilda
++ @169 /* [PC Reply]No, we will sit this one out, Brage. She'll come. */ EXTERN c#besq0a talking_tree_again_02 
++ @119 /* [PC Reply]We don't have time for that now. */ EXTERN c#besq0a talking_tree_again_03 
++ @113 /* [PC Reply]You sure you don't want to come down? */ EXTERN c#besq0a talking_tree_again_06
END

IF ~~ THEN brage_talking_her_down_03
SAY @170 /* [Brage]<CHARNAME>, as much as I appreciate the thought not to let her alone, it can't be our goal to frighten her down the tree. Let me sing to her like her uncle suggested! */
++ @168 /* [PC Reply]Alright, sing to her. */ + sing_to_tilda
++ @171 /* [PC Reply]It was worth a try. */ EXTERN c#besq0a talking_tree_again_03
++ @169 /* [PC Reply]No, we will sit this one out, Brage. She'll come. */ EXTERN c#besq0a talking_tree_again_02
END

IF ~~ THEN brage_talking_her_down_04
SAY @172 /* [Brage]<CHARNAME>, as much as I appreciate the thought not to let her alone, it can't be our goal to frighten her down the tree. She is safe up there for now. Let us talk to her uncle, maybe he has an idea. */
++ @171 /* [PC Reply]It was worth a try. */ EXTERN c#besq0a talking_tree_again_03
++ @169 /* [PC Reply]No, we will sit this one out, Brage. She'll come. */ EXTERN c#besq0a talking_tree_again_02
END

/* Tilda came down the tree */

IF ~Global("C#Brage_SoDQuest","GLOBAL",12)~ THEN brage_down_from_tree
SAY @173 /* [Brage]She... she is gone! Into the bushes, I can't see her anymore. */
++ @174 /* [PC Reply]She is really quick. */ + brage_down_from_tree_01 
++ @175 /* [PC Reply]Well, I guess now we know how her uncle lost her. */ + brage_down_from_tree_01
++ @176 /* [PC Reply]Well, let's hope it will help her to get to her uncle alright. */ + brage_down_from_tree_01
END

IF ~~ THEN brage_down_from_tree_01
SAY @177 /* [Brage]How could she! It is dangerous. Such an imprudent girl! And - so brave... */
IF ~~ THEN DO ~SetGlobal("C#Brage_SoDQuest","GLOBAL",13)~ EXIT
END 

END //APPEND


/* back in camp - Tilda is with her uncle */

APPEND c#besq02

/* quest is done but Brage still needs his closure */

IF ~Global("C#Brage_SoDQuestWfB","GLOBAL",1)
See("c#besq01") !Dead("c#besq01")
OR(3)
!InParty("C#Brage") StateCheck("C#Brage",CD_STATE_NOTVALID) !Detect("C#Brage")~ THEN waiting
SAY @178 /* [Uncle]Well, my foot is healing well. I guess we can be on our way pretty soon. */
IF ~~ THEN EXIT
END

/* PC didn't help, but Brage did. */
/* Brage not in group */
IF ~Global("C#Brage_SoDQuest","GLOBAL",15)
See("c#besq01") !Dead("c#besq01")
OR(3)
!InParty("C#Brage") StateCheck("C#Brage",CD_STATE_NOTVALID) !Detect("C#Brage")~ THEN tilda_back_no_brage
SAY @179 /* [Uncle]My Tilda is back with me! I am so happy. Please bring Mr. Brage so I can thank him personally for his help in this, too. */
IF ~~ THEN DO ~EraseJournalEntry(@100010)
EraseJournalEntry(@100008)
EraseJournalEntry(@100006)
EraseJournalEntry(@100005)
EraseJournalEntry(@100003)
EraseJournalEntry(@100002)
EraseJournalEntry(@100001)
AddExperienceParty(1500)~ SOLVED_JOURNAL @100009 EXIT
END

IF ~~ THEN tilda_back_01
SAY @180 /* [Uncle]As am I, as you can imagine. */
IF ~~ THEN + tilda_back_04
END

IF ~~ THEN tilda_back_02
SAY @181 /* [Uncle]Oh yes, I can imagine. */
IF ~~ THEN + tilda_back_04
END

IF ~~ THEN tilda_back_03
SAY @182 /* [Uncle]Yes, of course! You are taking the words out of my mouth. I know I don't have much - but it's all I can spare. */
IF ~~ THEN + tilda_back_04
END

IF ~~ THEN tilda_back_04
SAY @183 /* [Uncle]Here, take these gold coins... I thought I'd need them for the healing, but they treated me without payment, may the gods bless them. */
IF ~~ THEN DO ~SetGlobal("C#Brage_SoDQuestWfB","GLOBAL",1) GiveGoldForce(300)~ + waiting
IF ~InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ THEN DO ~GiveGoldForce(300)~ + farewell
END

IF ~~ THEN tilda_back_05
SAY @184 /* [Uncle]Oh, now that's a thought. But I think we have endured enough "nature" for a while now. */
IF ~~ THEN + tilda_back_04
END

END //APPEND

/* Brage is in group */
CHAIN
IF ~Global("C#Brage_SoDQuest","GLOBAL",15)
See("c#besq01") !Dead("c#besq01")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ THEN c#besq02 tilda_back_brage
@185 /* [Uncle]Mr. Brage! Thank you again so much for your help with rescuing my niece. */
== C#BrageJ @186 /* [Brage]It was my pleasure. */
END
IF ~~ THEN DO ~EraseJournalEntry(@100010)
EraseJournalEntry(@100008)
EraseJournalEntry(@100006)
EraseJournalEntry(@100005)
EraseJournalEntry(@100003)
EraseJournalEntry(@100002)
EraseJournalEntry(@100001)
AddJournalEntry(@100009,QUEST_DONE) AddExperienceParty(1500)~ + tilda_back_04

/* PC rescued Tilda */
CHAIN
IF ~Global("C#Brage_SoDQuestWfB","GLOBAL",0)
GlobalGT("C#Brage_SoDQuest","GLOBAL",10) See("c#besq01") !Dead("c#besq01")~ THEN c#besq02 tilda_back
@187 /* [Uncle]There you are! My Tilda is back, and in one piece! I thank you for getting her off the tree, haha. I already scolded her for running here alone - I am so glad she made it unharmed. */
DO ~EraseJournalEntry(@100010)
EraseJournalEntry(@100008)
EraseJournalEntry(@100006)
EraseJournalEntry(@100005)
EraseJournalEntry(@100003)
EraseJournalEntry(@100002)
EraseJournalEntry(@100001)
AddJournalEntry(@100009,QUEST_DONE) AddExperienceParty(1500)~ 
== c#besq02 IF ~Global("C#BE_SoDQuestMean","GLOBAL",1)~ THEN @188 /* [Uncle]Seems you really needed to force her down, hmm? She won't stop talking about how mean you were. Haha, well, she is alright now. */
== c#besq01 IF ~See(Player1) Global("C#BE_SoDQuestMean","GLOBAL",0)~ THEN @189 /* [Tilda]You are a hero! A scary one, they say. I'm not afraid of you! */ 
== c#besq01 IF ~See(Player1) Global("C#BE_SoDQuestMean","GLOBAL",1)~ THEN @190 /* [Tilda]They call you hero, but they are all scared of you, but I'm not afraid of you. You are mean! */
== c#besq02 IF ~See(Player1)~ THEN @191 /* [Uncle]Tilda! Don't talk to <CHARNAME> this way. */
END
+ ~See(Player1) Global("C#BE_SoDQuestMean","GLOBAL",0)~ + @192 /* [PC Reply]Yes, I know they are talking about me and what I might be. */ EXTERN c#besq01 back_in_camp
+ ~See(Player1) Global("C#BE_SoDQuestMean","GLOBAL",1)~ + @193 /* [PC Reply]Yes, I know they are talking about me and what I might be. You know what? I don't care. */ + tilda_back_04
+ ~Global("C#BE_SoDQuestMean","GLOBAL",0)~ + @194 /* [PC Reply]I am glad to see you back with your uncle all well, Tilda. */ + tilda_back_01
+ ~Global("C#BE_SoDQuestMean","GLOBAL",0)~ + @195 /* [PC Reply]You gave us quite a scare back there, you know. */ + tilda_back_02
+ ~Global("C#BE_SoDQuestMean","GLOBAL",1)~ + @196 /* [PC Reply]Well, considering how quick you went home alone, I'm not sure why I had to get you off the tree. */ + tilda_back_04
+ ~Class(Player1,RANGER_ALL)~ + @197 /* [PC Reply]You are quick and agile, and not afraid of nature. Well, if I'm not looking at a future ranger, hmm? */ + tilda_back_05
++ @198 /* [PC Reply]I came to collect my reward. You didn't think I'd do this for free, did you? */ + tilda_back_03
++ @199 /* [PC Reply]Well, farewell. */ + tilda_back_04

CHAIN
IF ~Global("C#Brage_SoDQuestWfB","GLOBAL",1)
See("c#besq01") !Dead("c#besq01")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ THEN c#besq02 farewell
@200 /* [Uncle]Well, my leg is much better now. We decided we'll go on the road again - they are much safer now if we keep south. We will return to Amn, where Tilda's grandparents live. I hope it will be far enough from all the troubles in these regions as of late. Thank you so much for your help again. */
== C#BrageJ @201 /* [Brage]Wartet, bevor Ihr geht - ich sollte es wirklich nicht fragen, aber... Ihr sagtet, das Mädchen hätte bei Banditenattacken nördlich von Nashkell seine Eltern verloren. Wisst Ihr... wisst Ihr genaueres, wie es geschah? War es... war es ein... Mann in Uniform mit einem großen Schwert, als die Eltern auf einem Pferdewagen unterwegs waren?... */
== c#besq02 @202 /* [Uncle]What? No, it was a lunatic out of the travelling group themselves... (glances at Tilda and whispers) Murdered them in their sleep in the wilderness, with a huuuge axe. (clears his throat) Luckily, Tilda was not with them at the time. Ah, so many tragedies... */
== c#besq02 @203 /* [Uncle]Well, we'll be on our way then. Come, Tilda, let's go to Gran and Pop, alright? */
END
IF ~~ THEN DO ~SetGlobal("C#Brage_SoDQuest","GLOBAL",20)~ EXIT

APPEND c#besq01 
IF ~~ THEN back_in_camp
SAY @204 /* [Tilda]I know how that feels! After mom and dad died, there were so many people talking *about* me and what will become of me. It was *so* annoying! */
++ @194 /* [PC Reply]I am glad to see you back with your uncle all well, Tilda. */ EXTERN c#besq02 tilda_back_01
++ @195 /* [PC Reply]You gave us quite a scare back there, you know. */ EXTERN c#besq02 tilda_back_02
++ @197 /* [PC Reply]You are quick and agile, and not afraid of nature. Well, if I'm not looking at a future ranger, hmm? */ EXTERN c#besq02 tilda_back_05
++ @198 /* [PC Reply]I came to collect my reward. You didn't think I'd do this for free, did you? */ EXTERN c#besq02 tilda_back_03
++ @199 /* [PC Reply]Well, farewell. */ EXTERN c#besq02 tilda_back_04
END

IF ~GlobalGT("C#Brage_SoDQuest","GLOBAL",10)~ THEN back_in_camp_01
SAY @205 /* [Tilda]I made it back, see? */
IF ~~ THEN EXIT
END

END //APPEND


/* Brage ponders about missing girl - before knowing it wasn't him */
APPEND C#BrageJ
IF ~Global("C#Brage_SoDQuestDialog","GLOBAL",1)
GlobalLT("C#Brage_SoDQuest","GLOBAL",20)~ THEN agonizing_thoughts
SAY @206 /* [Brage]In all this destruction and misery caused by the crusade, to find a child that might be orphaned by *me*... */
+ ~Global("C#Brage_c#besq02_1","GLOBAL",2)~ + @207 /* [PC Reply]Yes, I figured that's what you are pondering. It's one reason I didn't mind you accepting the quest the way you did. */ + agonizing_thoughts_02
++ @208 /* [PC Reply]I realized from your reactions that you agonize about the idea it might have been you who killed Tilda's parents. */ + agonizing_thoughts_02
+ ~Global("C#BE_c#besq0a_1","GLOBAL",1)~ + @209 /* [PC Reply]So you do think it was you who killed her parents. I saw you turn ash grey when she mentioned the "man with the big weapon". */ DO ~SetGlobal("C#BE_SoDQuestAshGrey","LOCALS",1)~ + agonizing_thoughts_02
++ @210 /* [PC Reply]Don't you know all relatives of the people on the caravan you destroyed? Could she really be one? */ + agonizing_thoughts_03
++ @211 /* [PC Reply]You can't go around seeing one of your victims in every miserable child, Brage. It's not healthy. */ + agonizing_thoughts_01
++ @212 /* [PC Reply]Focus, Brage. We have things to do. */ + agonizing_thoughts_05
END

IF ~~ THEN agonizing_thoughts_01
SAY @213 /* [Brage]I do not - but here it is too obvious a match. */
++ @214 /* [PC Reply]I understand your sentiment and the pain it gives you. I am sorry you have to experience it. */ + agonizing_thoughts_06
++ @210 /* [PC Reply]Don't you know all relatives of the people on the caravan you destroyed? Could she really be one? */ + agonizing_thoughts_03
++ @215 /* [PC Reply]Shake it off. It doesn't help her one bit if you torture yourself with these thoughts. */ + agonizing_thoughts_05
++ @212 /* [PC Reply]Focus, Brage. We have things to do. */ + agonizing_thoughts_05
END

IF ~~ THEN agonizing_thoughts_02
SAY @216 /* [Brage](sighs deeply) It is too obvious a match. */
++ @214 /* [PC Reply]I understand your sentiment and the pain it gives you. I am sorry you have to experience it. */ + agonizing_thoughts_06
++ @210 /* [PC Reply]Don't you know all relatives of the people on the caravan you destroyed? Could she really be one? */ + agonizing_thoughts_03
++ @211 /* [PC Reply]You can't go around seeing one of your victims in every miserable child, Brage. It's not healthy. */ + agonizing_thoughts_04
++ @215 /* [PC Reply]Shake it off. It doesn't help her one bit if you torture yourself with these thoughts. */ + agonizing_thoughts_05
++ @212 /* [PC Reply]Focus, Brage. We have things to do. */ + agonizing_thoughts_05
END

IF ~~ THEN agonizing_thoughts_03
SAY @217 /* [Brage]I have a lot of the families contacts - I have commissioned inquiries, but not all of them lead to results yet. */ 
IF ~~ THEN + agonizing_thoughts_04
END

IF ~~ THEN agonizing_thoughts_04
SAY @218 /* [Brage]The people of the caravan were a random group of people from lots of different places - one of them as far as Tethyr. It is *well* possible I killed her parents on that caravan I... butchered. */
IF ~~ THEN + agonizing_thoughts_05
END

IF ~~ THEN agonizing_thoughts_05
SAY @219 /* [Brage]All I can do for now is clench my teeth and go on - and ask the uncle for details of her parents' death, if only to get closure to this thought. Maybe I'll gather the courage after I know Tilda is safe. */
IF ~~ THEN DO ~SetGlobal("C#Brage_SoDQuestDialog","GLOBAL",2)
SetGlobal("C#Brage_SoDFQD","LOCALS",1)~ EXIT
END

IF ~~ THEN agonizing_thoughts_06
SAY @220 /* [Brage]I thank you deeply. It will be my fate as long as I live, that I will be confronted with my deeds. */
++ @210 /* [PC Reply]Don't you know all relatives of the people on the caravan you destroyed? Could she really be one? */ + agonizing_thoughts_03
++ @211 /* [PC Reply]You can't go around seeing one of your victims in every miserable child, Brage. It's not healthy. */ + agonizing_thoughts_04
++ @215 /* [PC Reply]Shake it off. It doesn't help her one bit if you torture yourself with these thoughts. */ + agonizing_thoughts_05
++ @212 /* [PC Reply]Focus, Brage. We have things to do. */ + agonizing_thoughts_05
END

IF ~Global("C#Brage_SoDQuestDialog","GLOBAL",3)
Global("C#Brage_SoDQuest","GLOBAL",20)~ THEN agonizing_thoughts_followup
SAY @221 /* [Brage]I cannot put into words how glad I am that it wasn't me who killed Tilda's parents. I was worried the girl was orphaned by my hands... */
IF ~Global("C#Brage_SoDFQD","LOCALS",1)~ THEN + agonizing_thoughts_followup_03
+ ~Global("C#Brage_SoDFQD","LOCALS",0)
Global("C#Brage_c#besq02_1","GLOBAL",2)~ + @222 /* [PC Reply]Yes, I figured as much. It's one reason I didn't mind you accepting the quest the way you did. */ + agonizing_thoughts_followup_01
+ ~Global("C#Brage_SoDFQD","LOCALS",0)~ + @223 /* [PC Reply]I realized from your reactions that you agonized about the idea it might have been you who killed Tilda's parents. */ + agonizing_thoughts_followup_01
+ ~Global("C#Brage_SoDFQD","LOCALS",0) 
Global("C#BE_c#besq0a_1","GLOBAL",1)~ + @224 /* [PC Reply]Yes, I saw you turn ash grey when she mentioned the "man with the big weapon". */ DO ~SetGlobal("C#BE_SoDQuestAshGrey","LOCALS",1)~ + agonizing_thoughts_followup_01
+ ~Global("C#Brage_SoDFQD","LOCALS",0)~ + @211 /* [PC Reply]You can't go around seeing one of your victims in every miserable child, Brage. It's not healthy. */ + agonizing_thoughts_followup_01
+ ~Global("C#Brage_SoDFQD","LOCALS",0)~ + @225 /* [PC Reply]Wouldn't you know about all your vicitims yet? I thought you are sending them gold every other tenday. */ + agonizing_thoughts_followup_02
+ ~Global("C#Brage_SoDFQD","LOCALS",0)~ + @226 /* [PC Reply]Let's just continue with our tasks. */ + agonizing_thoughts_followup_07
END

IF ~~ THEN agonizing_thoughts_followup_01
SAY @227 /* [Brage]It was too obvious a match - but not a real match in the end. */
IF ~~ THEN + agonizing_thoughts_followup_03
END

IF ~~ THEN agonizing_thoughts_followup_02
SAY @217 /* [Brage]I have a lot of the families contacts - I have commissioned inquiries, but not all of them lead to results yet. */
IF ~~ THEN + agonizing_thoughts_followup_03
END

IF ~~ THEN agonizing_thoughts_followup_03
SAY @228 /* [Brage]I feel ashamed about the relief the knowledge gives me, considering it doesn't improve the poor girl's life one single bit. And yet... */
++ @229 /* [PC Reply]I do understand why this unsettled you so much, though. */ + agonizing_thoughts_followup_04
++ @230 /* [PC Reply]I understand very well your relief. It is not selfish at all, Brage. */ + agonizing_thoughts_followup_04
+ ~Global("C#BE_c#besq0a_1","GLOBAL",1)
Global("C#BE_SoDQuestAshGrey","LOCALS",0)~ + @231 /* [PC Reply]I am glad it turned out like this. I saw you turn ash grey when she mentioned the "man with the big weapon". */ + agonizing_thoughts_followup_04
++ @232 /* [PC Reply]So, you realized there is misery in this world that's not by your doing. Congratulations! */ + agonizing_thoughts_followup_04
++ @233 /* [PC Reply]Yes, giving in to such selfish thoughts is easy, and a sign of a weak mind. */ + agonizing_thoughts_followup_04
++ @226 /* [PC Reply]Let's just continue with our tasks. */ + agonizing_thoughts_followup_07
END

IF ~~ THEN agonizing_thoughts_followup_04
SAY @234 /* [Brage]I am confronted by the misery my deeds caused every day, every time I send gold off to the families I destroyed - I should not be shaken like that just because I meet a possible victim in person. But here - it took me by complete surprise. I am sorry I showed so much weakness. */
++ @235 /* [PC Reply]"Weakness"? Brage, you are a father who lost his children due to a tragedy. You can't help but go around and try to help any child in need. *Especially* if you have to fear they were orphaned by your doings. That's not weakness, that's caring for the innocents in need. */ + agonizing_thoughts_followup_05
++ @236 /* [PC Reply]You have to steal yourself against such events, Brage. If you falter emotionally, you will also falter as a fighter, which in turn makes you a bad protector of the ones you want to help. */ + agonizing_thoughts_followup_06
++ @237 /* [PC Reply]Your feelings of guilt make you weak indeed, Brage. You are in my group as a fighter, and that is what I need you for. */ + agonizing_thoughts_followup_07
++ @226 /* [PC Reply]Let's just continue with our tasks. */ + agonizing_thoughts_followup_07
END

IF ~~ THEN agonizing_thoughts_followup_05
SAY @238 /* [Brage]I thank you for your comforting words, <CHARNAME>. */
IF ~~ THEN + agonizing_thoughts_followup_07
END

IF ~~ THEN agonizing_thoughts_followup_06
SAY @239 /* [Brage]I thank you for your advice, <CHARNAME>. */
IF ~~ THEN + agonizing_thoughts_followup_07
END

IF ~~ THEN agonizing_thoughts_followup_07
SAY @240 /* [Brage]I will... prepare myself, so situations like these will not shake me as much in the future. */
IF ~~ THEN DO ~SetGlobal("C#Brage_SoDQuestDialog","GLOBAL",4)~ EXIT
END
END //APPEND

