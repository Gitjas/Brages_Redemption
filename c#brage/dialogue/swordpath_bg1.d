/* Working title "sword path": After going against the people who planned the sword swap (up to Davaeorn), Brage will start to broaden his path of justice and look for the ones who were behind the actual deed and where it was created (smithy / sword dealer). Quest closes in SoA */
/* BG1 part */


APPEND C#BrageJ

IF ~Global("C#BE_BG1SwordPath","GLOBAL",1)~ THEN sword_path_bg1_start
SAY @3 /* [Brage]After you took me on, all I focussed on was finding and bringing justice to the ones that planned the sword coup. Only now that the obvious manipulators of the exchange are defeated I realize that there is much more to it. */
++ @4 /* [PC Reply]You are right - so far we only saw one side of the whole conspiracy. */ + sword_path_bg1_start_03
+ ~Dead("BORDA")~ + @5 /* [PC Reply]Well, we caught the man who executed the actual swap on the road. */ + sword_path_bg1_start_01
++ @6 /* [PC Reply]What do you mean? */ + sword_path_bg1_start_03
++ @7 /* [PC Reply]Great. The next topic that'll keep you occupied? */ + sword_path_bg1_start_02
END

IF ~~ THEN sword_path_bg1_start_01
SAY @8 /* [Brage]We did, but how did he get it? */
IF ~~ THEN + sword_path_bg1_start_03
END

IF ~~ THEN sword_path_bg1_start_02
SAY @9 /* [Brage]I can do nothing but deal with my demons, <CHARNAME>. */
IF ~~ THEN + sword_path_bg1_start_03
END

IF ~~ THEN sword_path_bg1_start_03
SAY @10 /* [Brage]There is so much more to it. What are the origins of the sword, and who worked behind the scenes until that shady merchant of cursed objects could execute the actual exchange? */
++ @11 /* [PC Reply]These are interesting questions indeed. */ + sword_path_bg1_start_07
++ @12 /* [PC Reply]And are they still operating? There could be a whole smithy doing only shady things! */ + sword_path_bg1_start_04
++ @13 /* [PC Reply]And do they take on requests? It could come in handy for our purposes! */ + sword_path_bg1_start_05
++ @14 /* [PC Reply]Let me guess. You want to investigate this? */ + sword_path_bg1_start_06
+ ~PartyHasItem("SW2H03")~ + @15 /* [PC Reply]Whatever. Less details, please. */ + sword_path_bg1_start_14
+ ~!PartyHasItem("SW2H03")~ + @15 /* [PC Reply]Whatever. Less details, please. */ + sword_path_bg1_start_13
END

IF ~~ THEN sword_path_bg1_start_04
SAY @16 /* [Brage]My thoughts exactly! */
IF ~~ THEN + sword_path_bg1_start_07
END

IF ~~ THEN sword_path_bg1_start_05
SAY @17 /* [Brage]Are you serious? */
IF ~~ THEN + sword_path_bg1_start_07
END

IF ~~ THEN sword_path_bg1_start_06
SAY @18 /* [Brage]Yes, I do. */
IF ~~ THEN + sword_path_bg1_start_07
END

IF ~~ THEN sword_path_bg1_start_07
SAY @19 /* [Brage]The idea that this sword might have been forged for this exact purpose - for "me" - makes my blood boil. It would mean there is a smith or maybe a mage out there, forging cursed objects on demand! It is evil enough to get hands on cursed objects and use them to cause harm, but the thought of a smithy *producing* them causes me great unease. */
= @20 /* [Brage]The sword case had the original Waterdhavian smithy's seal - or so I thought. Also, the bandits knew I was about to get a new, long awaited sword from this smithy. They needed to have some internal knowledge about my order. How is that possible, assuming the very well known smith didn't send this sword himself? */
= @21 /* [Brage]I need to get to the bottom of this. I can't go and confront the smith now, so this will have to wait. I will do so once our time together will come to an end. But what I can and want to do now is learn about the cursed sword as much as I can. */
++ @22 /* [PC Reply]You avenged the ones who plotted the conspiracy, but you need to face the fact that you might not be able to find out more. */ + sword_path_bg1_start_08
++ @23 /* [PC Reply]Curse aside it's a very mighty sword and probably took a lot of ressources to forge. I'm not sure it was made for you, specifically. */ + sword_path_bg1_start_20
+ ~!PartyHasItem("SW2H03")~ + @24 /* [PC Reply]We do not have the sword any more, though. */ + sword_path_bg1_start_11
++ @25 /* [PC Reply]Yes, I see why you want to investigate this. I will support you as best as possible. */ + sword_path_bg1_start_12
++ @26 /* [PC Reply]Meeting the people who make such excellently enchanted weapons and are able to see such a conspiracy through would interest me, too. */ + sword_path_bg1_start_09
++ @27 /* [PC Reply]I need you in this group, Brage. Will this take you away? */ + sword_path_bg1_start_10
++ @28 /* [PC Reply]Whatever you anticipate, it will have to wait until I have no more need of you. */ + sword_path_bg1_start_10
END

IF ~~ THEN sword_path_bg1_start_08
SAY @29 /* [Brage]Maybe, but I will try to dry out this source of evil if possible. */
+ ~!PartyHasItem("SW2H03")~ + @24 /* [PC Reply]We do not have the sword any more, though. */ + sword_path_bg1_start_11
++ @25 /* [PC Reply]Yes, I see why you want to investigate this. I will support you as best as possible. */ + sword_path_bg1_start_12
++ @26 /* [PC Reply]Meeting the people who make such excellently enchanted weapons and are able to see such a conspiracy through would interest me, too. */ + sword_path_bg1_start_09
++ @27 /* [PC Reply]I need you in this group, Brage. Will this take you away? */ + sword_path_bg1_start_10
++ @28 /* [PC Reply]Whatever you anticipate, it will have to wait until I have no more need of you. */ + sword_path_bg1_start_10
END

IF ~~ THEN sword_path_bg1_start_09
SAY @30 /* [Brage]I don't have the impression your motives are the same as mine, but it makes no difference for now. */
IF ~~ THEN + sword_path_bg1_start_14
IF ~!PartyHasItem("SW2H03")~ THEN + sword_path_bg1_start_13
END

IF ~~ THEN sword_path_bg1_start_10
SAY @31 /* [Brage]I will do nothing that would require my leave or a hold to our plans, <CHARNAME>. But we could combine my aims and yours. */
++ @32 /* [PC Reply]Fine, tell me your plans. */ + sword_path_bg1_start_12
++ @33 /* [PC Reply]No, Brage. I don't have time for this and I expect you to postbone whatever you had in mind until we part ways. I will not hear any more of this. */ + sword_path_bg1_start_15
END

IF ~~ THEN sword_path_bg1_start_11
SAY @34 /* [Brage]I know. I will work with what I have - it's all I can do. */
++ @25 /* [PC Reply]Yes, I see why you want to investigate this. I will support you as best as possible. */ + sword_path_bg1_start_12
++ @26 /* [PC Reply]Meeting the people who make such excellently enchanted weapons and are able to see such a conspiracy through would interest me, too. */ + sword_path_bg1_start_09
++ @27 /* [PC Reply]I need you in this group, Brage. Will this take you away? */ + sword_path_bg1_start_10
++ @28 /* [PC Reply]Whatever you anticipate, it will have to wait until I have no more need of you. */ + sword_path_bg1_start_10
END

IF ~~ THEN sword_path_bg1_start_12
SAY @35 /* [Brage]I thank you. */
IF ~~ THEN + sword_path_bg1_start_14
IF ~!PartyHasItem("SW2H03")~ THEN + sword_path_bg1_start_13
END

IF ~~ THEN sword_path_bg1_start_13
SAY @36 /* [Brage]We do no longer have the sword in our possession, and maybe it's for the better. */
IF ~~ THEN + sword_path_bg1_start_18
END

IF ~~ THEN sword_path_bg1_start_14
SAY @37 /* [Brage]We still have the sword in our possession - could I... keep it so I can show it to experts we might seek out if our time allows along the way? */
++ @38 /* [PC Reply]Yes, of course, Brage. The sword is yours, I have no further need for it. */ + sword_path_bg1_start_17
++ @39 /* [PC Reply]I would like to hold on to the sword, Brage - it might be needed for some other purpose. */ + sword_path_bg1_start_16
END

IF ~~ THEN sword_path_bg1_start_15
SAY @40 /* [Brage]I see. Then I will not pursue this further - for now. */
IF ~~ THEN DO ~SetGlobal("C#BE_BG1SwordPath","GLOBAL",50) AddJournalEntry(@100020,QUEST_DONE)~ EXIT
END

IF ~~ THEN sword_path_bg1_start_16
SAY @41 /* [Brage]I see. */
IF ~~ THEN + sword_path_bg1_start_18
END

IF ~~ THEN sword_path_bg1_start_17
SAY @42 /* [Brage]I thank you! Never would I have thought I would say these words upon receiving the sword - with disgust and horror being the only emotions taking hold of me when looking at it. I will use it for a righteous cause. Not only me, but also the sword will repent for what it's done! */
IF ~~ THEN DO ~TakePartyItem("SW2H03")~ + sword_path_bg1_start_19
END

IF ~~ THEN sword_path_bg1_start_18
SAY @43 /* [Brage]I recall Nalin made extensive notes about the sword and its curse. I will base my reseach on his knowledge. Please, let us collect these notes from him - hoping he still has them. */
IF ~~ THEN DO ~SetGlobal("C#BE_BG1SwordPath","GLOBAL",2) AddJournalEntry(@100016,QUEST) AddJournalEntry(@100017,QUEST)~ EXIT
END

IF ~~ THEN sword_path_bg1_start_19
SAY @44 /* [Brage]Please, let us seek counsel from any wellversed smith, mage, or priest we might meet along the way, and revisit the ones we already met. I need to hear as many experts' opinions on the sword as possible. */
= @45 /* This includes Nalin - I recall he made extensive notes about the sword and its curse. I would like to collect them. */
IF ~~ THEN DO ~SetGlobal("C#BE_BG1SwordPath","GLOBAL",3) SetGlobal("C#BE_HasCursedSword","LOCALS",3) AddJournalEntry(@100016,QUEST) 
AddJournalEntry(@100018,QUEST)AddJournalEntry(@100017,QUEST)~ EXIT
END

IF ~~ THEN sword_path_bg1_start_20
SAY @46 /* [Brage]I will only know if I'll succeed in my search. */
+ ~!PartyHasItem("SW2H03")~ + @24 /* [PC Reply]We do not have the sword any more, though. */ + sword_path_bg1_start_11
++ @25 /* [PC Reply]Yes, I see why you want to investigate this. I will support you as best as possible. */ + sword_path_bg1_start_12
++ @26 /* [PC Reply]Meeting the people who make such excellently enchanted weapons and are able to see such a conspiracy through would interest me, too. */ + sword_path_bg1_start_09
++ @27 /* [PC Reply]I need you in this group, Brage. Will this take you away? */ + sword_path_bg1_start_10
++ @28 /* [PC Reply]Whatever you anticipate, it will have to wait until I have no more need of you. */ + sword_path_bg1_start_10
END

/* sword wasn't there during the first dialogue, but it is now */
/* this plays ONCE */
IF ~Global("C#BE_HasCursedSword","LOCALS",1)~ THEN sword_back
SAY @47 /* [Brage]<CHARNAME>, I see the cursed sword is back in our posession - could I... keep it so I can show it to experts we might seek out if our time allows along the way? */
++ @38 /* [PC Reply]Yes, of course, Brage. The sword is yours, I have no further need for it. */ + sword_back_02
++ @39 /* [PC Reply]I would like to hold on to the sword, Brage - it might be needed for some other purpose. */ + sword_back_01
++ @48 /* [PC Reply]I am sorry, Brage, but the sword will be gone again soon. */ + sword_back_01
END

IF ~~ THEN sword_back_01
SAY @49 /* [Brage]I see. It will work out nevertheless, with Nalin's notes. */
IF ~~ THEN DO ~SetGlobal("C#BE_HasCursedSword","LOCALS",2)~ EXIT
END

IF ~~ THEN sword_back_02
SAY @42 /* [Brage]I thank you! Never would I have thought I would say these words upon receiving the sword - with disgust and horror being the only emotions taking hold of me when looking at it. I will use it for a righteous cause. Not only me, but also the sword will repent for what it's done! */
IF ~~ THEN DO ~TakePartyItem("SW2H03") SetGlobal("C#BE_HasCursedSword","LOCALS",3)~ EXIT
IF ~!PartyHasItem("c#be1sp1")~ THEN DO ~TakePartyItem("SW2H03")~ + sword_back_03
END

IF ~~ THEN sword_back_03
SAY @44 /* [Brage]Please, let us seek counsel from any wellversed smith, mage, or priest we might meet along the way, and revisit the ones we already met. I need to hear as many experts' opinions on the sword as possible. */
IF ~~ THEN DO ~SetGlobal("C#BE_BG1SwordPath","GLOBAL",3)
SetGlobal("C#BE_HasCursedSword","LOCALS",3)~ UNSOLVED_JOURNAL @100018 EXIT
END

/* Sword is gone after is was granted but Nalin's notes are not lost */
/* this plays ONCE */
IF ~Global("C#BE_HasCursedSword","LOCALS",4)~ THEN sword_gone
SAY @50 /* [Brage]<CHARNAME>, the cursed sword is no longer in our possession. I will focus on using Nalin's notes for my research about it - showing the sword would be advantageous, but it should work like this, too. */
IF ~~ THEN DO ~SetGlobal("C#BE_HasCursedSword","LOCALS",5)~ EXIT
IF ~!PartyHasItem("c#be1sp1")~ THEN DO ~SetGlobal("C#BE_HasCursedSword","LOCALS",5)AddJournalEntry(@100019,QUEST)~ EXIT
END

/* Nalin's notes are gone, sword was lost already */
/* ends quest for BG1 */
IF ~Global("C#BE_HasCursedSword","LOCALS",6)~ THEN nalins_notes_gone_after_sword_gone
SAY @51 /* [Brage]<CHARNAME>, we lost Nalin's notes about the cursed sword. We could get another copy easily enough, but I realize now that - as good as the idea about pursuing my research about its origin was, it seems it's not feasible and too great a distraction while I am travelling with you. I will concentrate on our tasks for now, and will pursue my search regarding the cursed sword after we'll part ways. */
IF ~~ THEN DO ~SetGlobal("C#BE_HasCursedSword","LOCALS",50) SetGlobal("C#BE_BG1SwordPath","GLOBAL",50) 
EraseJournalEntry(@100016) 
EraseJournalEntry(@100017) 
EraseJournalEntry(@100018) 
EraseJournalEntry(@100019)
AddJournalEntry(@100020,QUEST_DONE)~ EXIT
END

IF ~~ THEN brage_thanks_1
SAY @1 /* ~Thank you for taking the time, <CHARNAME>. I appreciate it.~ */
IF ~~ THEN EXIT
END

IF ~~ THEN brage_thanks_2
SAY @2 /* ~Thank you for repeatedly taking the time for this, <CHARNAME>. I really appreciate it.~ */ 
IF ~~ THEN EXIT
END

END //APPEND

/* speak to Nalin about his notes on the sword */
/* for both with sword or without; distiction is at the end for different journal entries */

CHAIN 
IF WEIGHT #-1
~OR(2)
Global("C#BE_BG1SwordPath","GLOBAL",2)
Global("C#BE_BG1SwordPath","GLOBAL",3)
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ THEN ~%tutu_var%NALIN~ hello_notes
@53 /* [Nalin]Brage! It is good to see you again. My senses tell me you are in higher spirit than when you left with <CHARNAME>. */
== C#BrageJ @54 /* [Brage]I am, Nalin. I have come to ask you about the notes you took when investigating the curse of the sword. */
== C#BrageJ IF ~OR(2) Global("C#BE_BG1SwordPath","GLOBAL",2) !PartyHasItem("SW2H03")~ THEN @55 /* [Brage]I would like to use them for my endeveor to learn about the sword and its curse. */
== C#BrageJ @56 /* [Brage]My aim is to learn as much as possible about where the sword came from and make an end to it. Your notes would surely help me in this search. */
== ~%tutu_var%NALIN~ @57 /* [Nalin]Of course, this is an honorable quest. Here is a copy - I wrote everything down that I noticed. */
== C#BrageJ @58 /* [Brage]I thank you dearly, Nalin. I wish you well.~ */
== C#BrageJ IF ~Global("C#BE_BG1SwordPath","GLOBAL",2)~ THEN @59 /* ~<CHARNAME> - please, let us seek counsel from any wellversed smith, mage, or priest we might meet along the way, and revisit the ones we already met. I need to hear as many experts' opinions on the sword as possible. */
END
IF ~~ THEN DO ~EraseJournalEntry(@100017)
EraseJournalEntry(@100019)
AddJournalEntry(@100021,QUEST)
GiveItemCreate("c#be1sp1","C#Brage",0,0,0)
AddExperienceParty(250)
SetGlobal("C#BE_BG1SwordPath","GLOBAL",4)~ EXIT
IF ~Global("C#BE_BG1SwordPath","GLOBAL",2)~ THEN DO ~EraseJournalEntry(@100017)
EraseJournalEntry(@100019)
AddJournalEntry(@100018,QUEST)
AddJournalEntry(@100021,QUEST)
GiveItemCreate("c#be1sp1","C#Brage",0,0,0)
AddExperienceParty(250)
SetGlobal("C#BE_BG1SwordPath","GLOBAL",4)~ EXIT


/* Taerom */
EXTEND_BOTTOM Taerom 8
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathTaerom","GLOBAL",0)
PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200000 /* My comrade Brage here has a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + taerom_sword
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathTaerom","GLOBAL",0)
PartyHasItem("c#be1sp1") !PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200001 /* My comrade Brage here has information about a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + taerom_only_notes
END

EXTEND_BOTTOM Taerom 12
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathTaerom","GLOBAL",0)
PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200000 /* My comrade Brage here has a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + taerom_sword
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathTaerom","GLOBAL",0)
PartyHasItem("c#be1sp1") !PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200001 /* My comrade Brage here has information about a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + taerom_only_notes
END

EXTEND_BOTTOM Taerom 14
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathTaerom","GLOBAL",0)
PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200000 /* My comrade Brage here has a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + taerom_sword
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathTaerom","GLOBAL",0)
PartyHasItem("c#be1sp1") !PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200001 /* My comrade Brage here has information about a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + taerom_only_notes
END

APPEND Taerom 
IF ~~ THEN taerom_sword
SAY @61 /* [Taerom]Hmm. This is a fine sword in terms of craftmansship. I would have said it shows signs of a style used in Tethyr, but I see some other styles in there, too. It was either forged by someone who assembled several forging styles, or someone tried to imitate a Tethyrian blade without knowing how. */
IF ~~ THEN + sword_evaluation
END

IF ~~ THEN taerom_only_notes
SAY @62 /* [Taerom]It is a pity you don't have the original sword with you. These notes are extensive, but they are clearly made with focus on the enchantment and the sword's appearance, but not the craftmanship to forge it. */
+ ~PartyHasItem("thsw2h01")~ + @63 /* Oh, we have the former sword with us. The enchantment was changed, but the sword should be the same in terms of how it was forged. */ + taerom_sword
+ ~PartyHasItem("thsw2h01")~ + @64 /* You'll have to work with this, I am afraid. */ + taerom_only_notes_01
IF ~!PartyHasItem("thsw2h01")~ THEN + taerom_only_notes_01
END

IF ~~ THEN taerom_only_notes_01
SAY @65 /* [Taerom]Still, from what I see in the drawing, I would have said it shows signs of a style used in Tethyr, but if this drawing depicts the sword's true imensions, then the blade is too thick. It was either forged by someone who assembled several forging styles, or someone tried to imitate a Tethyrian blade. */
IF ~~ THEN + sword_evaluation
END
END //APPEND

CHAIN
IF ~~ THEN Taerom sword_evaluation
@66 /* [Taerom]A shame the enchantment went wrong - at least I would assume it did, because who would make such a fine weapon, only to curse it afterwards. If on purpose, then this was created to deceive a well versed weapon expert. */
== C#BrageJ @67 /* [Brage]Für mich hätte ein einfacheres Schwert gereicht... Ich kann ein gut ausbalanciertes und verarbeitetes Schwert erkennen, aber ich bin kein Fachmann für verschiedene Schwertstile oder Fertigungsarten. This means it might not have been forged for me. I thank you very much for the information, Master Taerom. */
END
IF ~~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathTaerom","GLOBAL",1)~ EXIT
IF ~GlobalLT("C#BE_BG1SwordPath","GLOBAL",29) Global("C#BE_BG1SwordPathThanks","GLOBAL",3)~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathTaerom","GLOBAL",1)~ EXTERN C#BrageJ brage_thanks_2
IF ~GlobalLT("C#BE_BG1SwordPath","GLOBAL",29) Global("C#BE_BG1SwordPathThanks","GLOBAL",0)~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathTaerom","GLOBAL",1)~ EXTERN C#BrageJ brage_thanks_1 
IF ~Global("C#BE_BG1SwordPath","GLOBAL",29)
Global("C#BE_BG1SwordPathThanks","GLOBAL",4)~ EXTERN C#BrageJ brage_thanks_final


/* Thalantyr */
EXTEND_BOTTOM THALAN 1
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathThalantyr","GLOBAL",0)
PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200000 /* My comrade Brage here has a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathThalantyr","GLOBAL",0)
PartyHasItem("c#be1sp1") !PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200001 /* My comrade Brage here has information about a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
END

CHAIN
IF ~~ THEN THALAN sword_evaluation
@68 /* [Thalantyr]What am I, a free weapon assessor? (sigh) Very well, my curiosity is peaked, in case this is the weapon that made a commander known to be loyal go berserk. */
== C#BrageJ @69 /* It... is indeed this weapon. */
== THALAN @70 /* [Thalantyr]Yes, I see. Very well versed enchantment spells are needed to create a curse like this - there was a mighty mage involved in creating this cursed weapon. This cannot be done by a smith alone. */ 
== THALAN IF ~OR(2)
PartyHasItem("thsw2h01")~ THEN @71 /* [Thalantyr]I remember the sword - and changing the curse to something useful, indeed. I was not aware it was the one that put you into such misery. */
== C#BrageJ @72 /* [Brage]I thank you dearly for the information, Master Thalantyr. */
END
IF ~~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathThalantyr","GLOBAL",1)~ EXIT
IF ~GlobalLT("C#BE_BG1SwordPath","GLOBAL",29) Global("C#BE_BG1SwordPathThanks","GLOBAL",3)~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathThalantyr","GLOBAL",1)~ EXTERN C#BrageJ brage_thanks_2
IF ~GlobalLT("C#BE_BG1SwordPath","GLOBAL",29) Global("C#BE_BG1SwordPathThanks","GLOBAL",0)~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathThalantyr","GLOBAL",1)~ EXTERN C#BrageJ brage_thanks_1  
IF ~Global("C#BE_BG1SwordPath","GLOBAL",29)
Global("C#BE_BG1SwordPathThanks","GLOBAL",4)~ EXTERN C#BrageJ brage_thanks_final


/* Ragefast */
APPEND RAGEFA 
IF WEIGHT #-1
~NumTimesTalkedToGT(0)
!InMyArea("ABELA")
GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathRagefast","GLOBAL",0)
OR(2) PartyHasItem("SW2H03") PartyHasItem("c#be1sp1")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ show_sword
SAY @73 /* [Ragefast]Please, have you not bothered me enough? I need solitude to recover from the folly that befell me. */
+ ~PartyHasItem("SW2H03")~ + @200000 /* My comrade Brage here has a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
+ ~PartyHasItem("c#be1sp1") !PartyHasItem("SW2H03")~ + @200001 /* My comrade Brage here has information about a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
++ @74 /* Apologies. There is nothing important enough to disturb you with it. Farewell. */ + show_sword_01
END

IF ~~ THEN BEGIN show_sword_01
  SAY @75 /* [Ragefast]Then leave me be, and get out of my home. */
  IF ~~ THEN DO ~SetGlobal("C#BE_BG1SwordPathRagefast","GLOBAL",1)~ EXIT
END
END //APPEND

CHAIN
IF ~~ THEN RAGEFA sword_evaluation
@76 /* [Ragefast]I've led a rather cloistered life, and my knowledge is limited to my studies. I can see the curse that is on this weapon, but I cannot tell you anything about the sword's origin. */
== C#BrageJ @77 /* [Brage]Thank you nevertheless, Master Ragefast. I apologize for the intrusion. */
END
IF ~~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathRagefast","GLOBAL",1)~ EXIT
IF ~GlobalLT("C#BE_BG1SwordPath","GLOBAL",29) Global("C#BE_BG1SwordPathThanks","GLOBAL",3)~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathRagefast","GLOBAL",1)~ EXTERN C#BrageJ brage_thanks_2
IF ~GlobalLT("C#BE_BG1SwordPath","GLOBAL",29) Global("C#BE_BG1SwordPathThanks","GLOBAL",0)~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathRagefast","GLOBAL",1)~ EXTERN C#BrageJ brage_thanks_1  
IF ~Global("C#BE_BG1SwordPath","GLOBAL",29)
Global("C#BE_BG1SwordPathThanks","GLOBAL",4)~ EXTERN C#BrageJ brage_thanks_final


/* Ramazith */
/* before getting Abela, after quest accepted */
APPEND RAMAZI 
IF WEIGHT #-1
~Global("HelpRamazith","GLOBAL",1)
!PartyHasItem("MISC68")
!Dead("Abela")
!Global("AbelaNotExists","GLOBAL",1)
GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathRamazith","GLOBAL",0)
OR(2) PartyHasItem("SW2H03") PartyHasItem("c#be1sp1")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ show_sword
SAY @78 /* [Ramazith]I must insist that you do not tarry in my home, but rather go find Ragefast and acquire the captured nymph. */
+ ~PartyHasItem("SW2H03")~ + @200000 /* My comrade Brage here has a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
+ ~PartyHasItem("c#be1sp1") !PartyHasItem("SW2H03")~ + @200001 /* My comrade Brage here has information about a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
++ @79 /* Yes, we will do so. There will be time for questions later, I guess. */ DO ~SetGlobal("C#BE_BG1SwordPathRamazith","GLOBAL",1)~ + show_sword_01
END

IF ~~ THEN show_sword_01
SAY @80 /* [Ramazith]Do not tarry! That old fool might be ruining my precious nymph as we speak. */
IF ~~ THEN EXIT
END

IF ~~ THEN show_sword_02
SAY @81 /* [Ramazith]Especially not mine. I ask you again to leave. */
COPY_TRANS RAMAZI 16
END

IF ~~ THEN show_sword_03
SAY @82 /* [Ramazith]I do not have time for such an investigation now! My request to you is of urgent nature. Accept it and bring the nymph to me, then I will find time for such inquiries. */
COPY_TRANS RAMAZI 6
END
END //APPEND

/* before accepting the quest */
EXTEND_BOTTOM RAMAZI 6
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathRamazith","GLOBAL",0)
OR(2) PartyHasItem("SW2H03") PartyHasItem("c#be1sp1")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @83 /* You are a wizard? My comrade Brage here has questions to a cursed sword. */ + show_sword_03
END

/* after giving Abela to Ramazith */
EXTEND_BOTTOM RAMAZI 16
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
GlobalLT("C#BE_BG1SwordPathRamazith","GLOBAL",2)
PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200000 /* My comrade Brage here has a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
GlobalLT("C#BE_BG1SwordPathRamazith","GLOBAL",2)
PartyHasItem("c#be1sp1") !PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200001 /* My comrade Brage here has information about a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
END

CHAIN
IF ~~ THEN RAMAZI sword_evaluation
@84 /* [Ramazith]You want to profit from Ramazith's wisdom? You will not find a wizard more knowledgable than me. I am very busy now, but do come back in... say, 6 weeks and pay me a sum of 5000 gold, and I will investigate this sword of yours thoroughly. */
DO ~SetGlobal("C#BE_BG1SwordPathRamazith","GLOBAL",2)~ 
== C#BrageJ @85 /* [Brage]We would be ready to pay for your knowledge, but this sum is rediculously high. */
== RAMAZI @86 /* [Ramazith]It is my worth, you insolent fellow. I will not even *look* at it for less. */
== C#BrageJ @87 /* [Brage]This is a waste of time, <CHARNAME>. I do not trust the gold would be well spent. We shouldn't waste time here any longer. */
END
IF ~~ THEN + show_sword_02
IF ~Global("HelpRamazith","GLOBAL",1)
!PartyHasItem("MISC68")~ THEN + show_sword_01


/* Halbazzer Drin */
EXTEND_BOTTOM HALBAZ 0
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathHalbazzer","GLOBAL",0)
PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200000 /* My comrade Brage here has a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathHalbazzer","GLOBAL",0)
PartyHasItem("c#be1sp1") !PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200001 /* My comrade Brage here has information about a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
END

CHAIN
IF ~~ THEN HALBAZ sword_evaluation
@88 /* [Halbazzer Drin]Hmm. Oh, that is an interesting curse, indeed. The ingredients needed for such a curse - or the corresponding useful enchantment - are not trivial. Some I haven't had in my shop for months. I would assume this sword was not enchanted in a place near to here. */
== C#BrageJ @89 /* [Brage]Thank you very much for the information, Master Drin. */
END
IF ~~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathHalbazzer","GLOBAL",1)~ EXIT
IF ~GlobalLT("C#BE_BG1SwordPath","GLOBAL",29) Global("C#BE_BG1SwordPathThanks","GLOBAL",3)~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathHalbazzer","GLOBAL",1)~ EXTERN C#BrageJ brage_thanks_2
IF ~GlobalLT("C#BE_BG1SwordPath","GLOBAL",29) Global("C#BE_BG1SwordPathThanks","GLOBAL",0)~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathHalbazzer","GLOBAL",1)~ EXTERN C#BrageJ brage_thanks_1  
IF ~Global("C#BE_BG1SwordPath","GLOBAL",29)
Global("C#BE_BG1SwordPathThanks","GLOBAL",4)~ EXTERN C#BrageJ brage_thanks_final


/* Aldeth Sashenstar, Merchant's Guild */
ADD_TRANS_TRIGGER ~ALDETH~ 28 ~False()~ DO 0

REPLACE_STATE_TRIGGER ~ALDETH~ 28 ~Global("HelpAldeth","GLOBAL",2)~

/* this is compatible with Baldurdash, JAP, and bgqe and vice versa independent on install order(JAP 0.7 or higher also considers this accordingly)  */

EXTEND_BOTTOM ~ALDETH~ 28
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathAldeth","GLOBAL",0)
PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200000 /* My comrade Brage here has a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathAldeth","GLOBAL",0)
PartyHasItem("c#be1sp1") !PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200001 /* My comrade Brage here has information about a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathAldeth","GLOBAL",0)
PartyHasItem("c#be1sp1") !PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @90 /* I will not disturb you with some weapon inquiries. */ DO ~SetGlobal("C#BE_BG1SwordPathAldeth","GLOBAL",1)~ EXIT
END

EXTEND_BOTTOM ALDETH 14
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathAldeth","GLOBAL",0)
PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200000 /* My comrade Brage here has a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathAldeth","GLOBAL",0)
PartyHasItem("c#be1sp1") !PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200001 /* My comrade Brage here has information about a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
END

CHAIN
IF ~~ THEN ALDETH sword_evaluation
@91 /* [Aldeth Sashenstar]A cursed weapon? The Merchants League does not trade with such abominations! */
== ALDETH IF ~PartyHasItem("SW2H03")~ THEN @92 /* [Aldeth Sashenstar]And you bring it here?! */
== C#BrageJ IF ~PartyHasItem("SW2H03")~ THEN @93 /* [Brage]Forgive us, Master Sashenstar. We did not mean to dishonor the League's good name. */
== C#BrageJ @94 /* [Brage]All we were hoping for is to profit from your expertise. Surely you have seen a lot of swords from all over the lands and far away. This sword is the cause of a lot of misery, and I am decided to put an end to whoever was behind it. */
== ALDETH @95 /* [Aldeth Sashenstar]Fine. Hmm, it shows resemblance to some swords we had in our repertoire - I am referring to the style, not the curse, of course. */
== ALDETH IF ~PartyHasItem("SW2H03")~ THEN @96 /* [Aldeth Sashenstar]From the shape and overall appearance I would assume the smith learned their profession somewhere south from here - maybe even Tethyr, but the style seems blended with others. That would be all I could say about its possible origin. */ 
== ALDETH IF ~!PartyHasItem("SW2H03")~ THEN @97 /* [Aldeth Sashenstar]From what I see in the drawing about the shape and overall appearance I would assume the smith learned their profession somewhere south from here - maybe even Tethyr, but the style seems blended with others. That would be all I could say about its possible origin. */
== ALDETH @98 /* [Aldeth Sashenstar]What I can asure you of is that I am 100 per cent sure that it was never traded by us or any of our partners. */
== C#BrageJ @99 /* [Brage]Thank you very much for the information, Master Sashenstar. */
END
IF ~~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathAldeth","GLOBAL",1)~ EXIT
IF ~GlobalLT("C#BE_BG1SwordPath","GLOBAL",29) Global("C#BE_BG1SwordPathThanks","GLOBAL",3)~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathAldeth","GLOBAL",1)~ EXTERN C#BrageJ brage_thanks_2
IF ~GlobalLT("C#BE_BG1SwordPath","GLOBAL",29) Global("C#BE_BG1SwordPathThanks","GLOBAL",0)~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathAldeth","GLOBAL",1)~ EXTERN C#BrageJ brage_thanks_1  
IF ~Global("C#BE_BG1SwordPath","GLOBAL",29)
Global("C#BE_BG1SwordPathThanks","GLOBAL",4)~ EXTERN C#BrageJ brage_thanks_final

/* Firebead Elvenhair */

/* Firebead will give his book quest first if he hasn't already. It only triggers for "IsGabber(Player1) in BGT. BG:EE rearranged the whole FIREBE dialogue states for reasons unknown. */
APPEND FIREBE
IF WEIGHT #-1
~Global("TalkedToFirebead","GLOBAL",0)
InMyArea(Player1)
GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathElvenhair","GLOBAL",0)
PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ THEN greeting_bookquest
SAY @100 /* [Firebead Elvenhair]Hello, young adventurers! */
IF ~~ THEN + %FIREBE_Bookqueststate%
END

IF WEIGHT #-1
~Global("TalkedToFirebead","GLOBAL",1)
GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathElvenhair","GLOBAL",0)
OR(2) PartyHasItem("SW2H03") PartyHasItem("c#be1sp1")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ show_sword
SAY @101 /* [Firebead Elvenhair]Ah, I know a bookworm when I see one. */
+ ~PartyHasItem("SW2H03")~ + @200000 /* My comrade Brage here has a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
+ ~PartyHasItem("c#be1sp1") !PartyHasItem("SW2H03")~ + @200001 /* My comrade Brage here has information about a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
++ @90 /* I will not disturb you with some weapon inquiries. */ DO ~SetGlobal("C#BE_BG1SwordPathElvenhair","GLOBAL",1)~ EXIT 
END
END //APPEND

CHAIN
IF ~~ THEN FIREBE sword_evaluation
@102 /* [Firebead Elvenhair]I am not a weapon smith and I didn't enchant items for a long time, I can only tell about what I read in my books. I can say that this enchantment is not a simple one, and the needed ingredients are rather rare. */
== C#BrageJ @103 /* [Brage]Thank you, Master Elvenhair. */
END
IF ~~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathElvenhair","GLOBAL",1)~ EXIT
IF ~GlobalLT("C#BE_BG1SwordPath","GLOBAL",29) Global("C#BE_BG1SwordPathThanks","GLOBAL",3)~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathElvenhair","GLOBAL",1)~ EXTERN C#BrageJ brage_thanks_2
IF ~GlobalLT("C#BE_BG1SwordPath","GLOBAL",29) Global("C#BE_BG1SwordPathThanks","GLOBAL",0)~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathElvenhair","GLOBAL",1)~ EXTERN C#BrageJ brage_thanks_1  
IF ~Global("C#BE_BG1SwordPath","GLOBAL",29)
Global("C#BE_BG1SwordPathThanks","GLOBAL",4)~ EXTERN C#BrageJ brage_thanks_final


/* Alatos, Thieves Guild */
ADD_TRANS_ACTION ALATOS BEGIN 20 END BEGIN END ~SetGlobal("C#BE_BG1SPAlatosDone","MYAREA",1)~
APPEND ALATOS
IF WEIGHT #-1
~NumTimesTalkedToGT(0)
OR(4)
	GlobalTimerNotExpired("AlatosTenDayTimer","GLOBAL")
	!PartyHasItem("MISC69")
	!PartyHasItem("MISC70")
	!PartyHasItem("MISC71")
!Dead("Resar")
GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathAlatos","GLOBAL",0)
OR(2) PartyHasItem("SW2H03") PartyHasItem("c#be1sp1")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ show_sword_early
SAY @104 /* [Alatos]When I said make yourself known to my thieves, I did not mean trying to convers with me. */
++ @105 /* You fence all sorts of goods? My comrade Brage here has questions to a cursed sword. */ + show_sword_01
++ @106 /* Sorry for disturbing you, I'm on my way. */ + show_sword_02
END

IF WEIGHT #-1
~Global("C#BE_BG1SPAlatosDone","MYAREA",1)
GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
GlobalLT("C#BE_BG1SwordPathAlatos","GLOBAL",2)
OR(2) PartyHasItem("SW2H03") PartyHasItem("c#be1sp1")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ show_sword_after
SAY @107 /* [Alatos]Don't worry, you have full run of the guild—if you're able to kill a Halruaan mage, I'm sure there's little that my guild members can do to you. Again, accept my apologies for the entire incident. */
+ ~PartyHasItem("SW2H03")~ + @200000 /* My comrade Brage here has a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
+ ~PartyHasItem("c#be1sp1") !PartyHasItem("SW2H03")~ + @200001 /* My comrade Brage here has information about a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
++ @90 /* I will not disturb you with some weapon inquiries. */ DO ~SetGlobal("C#BE_BG1SwordPathAlatos","GLOBAL",2)~ EXIT 
END

IF ~~ THEN show_sword_01
SAY @108 /* [Alatos]Don't you have other things to do? Like, something I requested? I might be up to answering any questions once you finished the task I gave you. */
IF ~~ THEN + show_sword_02
END

IF ~~ THEN show_sword_02
SAY @109 /* [Alatos]Do not waste my time again until you're done. Resor is already very impatient and making me regret I hired you in the first place. */
IF ~~ THEN DO ~SetGlobal("C#BE_BG1SwordPathAlatos","GLOBAL",1)~ EXIT 
END
END //APPEND

CHAIN
IF ~~ THEN ALATOS sword_evaluation
@110 /* [Alatos]Ah, so you do want to profit from my knowledge directly. Very well. No, I have never seen this blade. It has resemblance to some Tethyrian or Amnian blades I saw, but it's a bit off, as if someone was mixing different forging styles. I can't say for sure where it is from. */
== C#BrageJ @111 /* [Brage]I thank you nontheless. */
END
IF ~~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathAlatos","GLOBAL",2)~ EXIT
IF ~GlobalLT("C#BE_BG1SwordPath","GLOBAL",29) Global("C#BE_BG1SwordPathThanks","GLOBAL",3)~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathAlatos","GLOBAL",2)~ EXTERN C#BrageJ brage_thanks_2
IF ~GlobalLT("C#BE_BG1SwordPath","GLOBAL",29) Global("C#BE_BG1SwordPathThanks","GLOBAL",0)~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathAlatos","GLOBAL",2)~ EXTERN C#BrageJ brage_thanks_1  
IF ~Global("C#BE_BG1SwordPath","GLOBAL",29)
Global("C#BE_BG1SwordPathThanks","GLOBAL",4)~ EXTERN C#BrageJ brage_thanks_final


/* Black Lily BLACKL */
APPEND BLACKL
IF WEIGHT #-1
~Global("C#BE_BG1SPAlatosDone","MYAREA",1)
GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathBLACKL","GLOBAL",0)
OR(2) PartyHasItem("SW2H03") PartyHasItem("c#be1sp1")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ show_sword_after
SAY @112 /* [#2842 Black Lily]It will be the darkest day ye have never seen before I don't have what ye need. Fer the right price, anyway. */
+ ~PartyHasItem("SW2H03")~ + @200000 /* My comrade Brage here has a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
+ ~PartyHasItem("c#be1sp1") !PartyHasItem("SW2H03")~ + @200001 /* My comrade Brage here has information about a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
++ @90 /* I will not disturb you with some weapon inquiries. */ DO ~SetGlobal("C#BE_BG1SwordPathAlatos","GLOBAL",2)~ EXIT 
END
END //APPEND

CHAIN
IF ~~ THEN BLACKL sword_evaluation
@113 /* [Black Lily]We didn't have anything to do with this blade, I can tell ye that. Never seen it in my life. If at all, then Alatos would know whether it was a special client's order. */
== C#BrageJ @114 /* [Brage]Well, thank you. */
END
IF ~~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathBLACKL","GLOBAL",1)~ EXIT
IF ~GlobalLT("C#BE_BG1SwordPath","GLOBAL",29) Global("C#BE_BG1SwordPathThanks","GLOBAL",3)~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathBLACKL","GLOBAL",1)~ EXTERN C#BrageJ brage_thanks_2
IF ~GlobalLT("C#BE_BG1SwordPath","GLOBAL",29) Global("C#BE_BG1SwordPathThanks","GLOBAL",0)~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathBLACKL","GLOBAL",1)~ EXTERN C#BrageJ brage_thanks_1 
IF ~Global("C#BE_BG1SwordPath","GLOBAL",29)
Global("C#BE_BG1SwordPathThanks","GLOBAL",4)~ EXTERN C#BrageJ brage_thanks_final


/* Priest of Helm, Temple of Helm, BG, AR0002 */
EXTEND_BOTTOM PRIHEL 0
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathPRIHEL","GLOBAL",0)
PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200000 /* My comrade Brage here has a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathPRIHEL","GLOBAL",0)
PartyHasItem("c#be1sp1") !PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200001 /* My comrade Brage here has information about a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
END

CHAIN
IF ~~ THEN PRIHEL sword_evaluation
@115 /* [male priest]Such a mighty weapon, with such a sneaky curse. It makes the wielder quite dangerous in a fight - for foes and allies, both. */
== C#BrageJ @116 /* [Brage]You have no idea how true that is. */
== PRIHEL IF ~PartyHasItem("c#be1sp1")~ THEN @117 /* [male priest]I see Nalin already put everything down in these notes that I could tell you about this blade. */
== PRIHEL @118 /* [male priest]I see how perfidious the curse is, but apart from that, I am sorry that I cannot tell anything about the sword or where it is from. */
== C#BrageJ @119 /* [Brage]Thank you for taking the time. */
END
IF ~~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathPRIHEL","GLOBAL",1)~ EXIT
IF ~GlobalLT("C#BE_BG1SwordPath","GLOBAL",29) Global("C#BE_BG1SwordPathThanks","GLOBAL",3)~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathPRIHEL","GLOBAL",1)~ EXTERN C#BrageJ brage_thanks_2
IF ~GlobalLT("C#BE_BG1SwordPath","GLOBAL",29) Global("C#BE_BG1SwordPathThanks","GLOBAL",0)~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathPRIHEL","GLOBAL",1)~ EXTERN C#BrageJ brage_thanks_1  
IF ~Global("C#BE_BG1SwordPath","GLOBAL",29)
Global("C#BE_BG1SwordPathThanks","GLOBAL",4)~ EXTERN C#BrageJ brage_thanks_final


/* Kelddath Ormlyr , Temple Song of the Morning by Beregost */
EXTEND_BOTTOM KELDDA 0
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathKelddath","GLOBAL",0)
PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200000 /* My comrade Brage here has a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathKelddath","GLOBAL",0)
PartyHasItem("c#be1sp1") !PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200001 /* My comrade Brage here has information about a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
END

APPEND KELDDA
IF WEIGHT #-1
~Dead("CORWYVRN")
!PartyHasItem("MISC52")
!Global("wyvernp","GLOBAL",1)
GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathKelddath","GLOBAL",0)
OR(2) PartyHasItem("SW2H03") PartyHasItem("c#be1sp1")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ show_sword_after
SAY @120 /* [Kelddath Ormlyr]Without the beast's head, I cannot give you the reward. I hope you understand. */
+ ~PartyHasItem("SW2H03")~ + @200000 /* My comrade Brage here has a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
+ ~PartyHasItem("c#be1sp1") !PartyHasItem("SW2H03")~ + @200001 /* My comrade Brage here has information about a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
++ @90 /* I will not disturb you with some weapon inquiries. */ DO ~SetGlobal("C#BE_BG1SwordPathKelddath","GLOBAL",1)~ EXIT 
END
END //APPEND

CHAIN
IF ~~ THEN KELDDA sword_evaluation
@121 /* [Kelddath Ormlyr]This is a throrough curse, and it hides well, which makes it even more dangerous. A nontrained eye would not be able to suspect it. */
== C#BrageJ @122 /* [Brage]You cannot imagine what these words mean to me. */
== KELDDA @123 /* [Kelddath Ormlyr]It is not a cursed item that would be suited for a mere hoax. It seems designed to fail in moments where noone is there to watch and "enjoy" the chaos. This is meant to create misery - to destroy. */
== C#BrageJ @124 /* [Brage]That it did in all its horrible truth. I will not rest until I found and confronted the ones responsible for this sword's existence, if they are still alive! */
== KELDDA @125 /* [Kelddath Ormlyr]And you are doing a great service with this, my friend. */
== C#BrageJ @126 /* [Brage]Thank you, Master Ormlyr. */
END
IF ~~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathKelddath","GLOBAL",1)~ EXIT
IF ~GlobalLT("C#BE_BG1SwordPath","GLOBAL",29) Global("C#BE_BG1SwordPathThanks","GLOBAL",3)~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathKelddath","GLOBAL",1)~ EXTERN C#BrageJ brage_thanks_2
IF ~GlobalLT("C#BE_BG1SwordPath","GLOBAL",29) Global("C#BE_BG1SwordPathThanks","GLOBAL",0)~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathKelddath","GLOBAL",1)~ EXTERN C#BrageJ brage_thanks_1  
IF ~Global("C#BE_BG1SwordPath","GLOBAL",29)
Global("C#BE_BG1SwordPathThanks","GLOBAL",4)~ EXTERN C#BrageJ brage_thanks_final


/* WaterQueen's House AR0609 */
/* PUMBERL */
EXTEND_BOTTOM PUMBERL 0
+ ~!Dead("Jalantha")
!InMyArea("Jalantha")
GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathJalantha","GLOBAL",0)
OR(2) PartyHasItem("SW2H03") PartyHasItem("c#be1sp1")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @127 /* My comrade Brage has a special weapon we would like to hear your high priestess' opinion about. */ + 1
END

/* JALANT */
EXTEND_BOTTOM JALANT 0
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathJalantha","GLOBAL",0)
PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200000 /* My comrade Brage here has a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathJalantha","GLOBAL",0)
PartyHasItem("c#be1sp1") !PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200001 /* My comrade Brage here has information about a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
END

CHAIN
IF ~~ THEN JALANT sword_evaluation
@128 /* [Jalantha]That sword... hahaha. Yes, that's a fine weapon. A *very* fine weapon. */
== JALANT IF ~PartyHasItem("SW2H03")~ THEN @129 /* [Jalantha]I was starting to get impatient that you seem to think this temple is offering services to just anyone, but seeing this curse delights me. */
== JALANT IF ~!PartyHasItem("SW2H03")~ THEN @130 /* [Jalantha]I was starting to get impatient that you come here, waving a Helm priest's notes in front of my face, but seeing this curse delights me. */
== C#BrageJ @131 /* [Brage]You feel joy by seeing a weapon where innocents were murdered with? */
== JALANT @132 /* [Jalantha]Oh, but isn't this something you could say about almost any weapon? But this one - a true amusement for those who watch from a distance. It is almost as if the curse was designed for this purpose. This was amusing, so I will not charge you for my insight. */
== C#BrageJ @133 /* [Brage]An "amusement"  - ah, what did we expect to ask in such a place, <CHARNAME>. Let us go, before I do something I will regret. */
END
IF ~~ THEN DO ~SetGlobal("C#BE_BG1SwordPathJalantha","GLOBAL",1)~ EXIT


/* Temple of Oghma in Candlekeep AR2626, POGHM5 */
EXTEND_BOTTOM POGHM5 0
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathPOGHM5","GLOBAL",0)
PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200000 /* My comrade Brage here has a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathPOGHM5","GLOBAL",0)
PartyHasItem("c#be1sp1") !PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200001 /* My comrade Brage here has information about a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
END

CHAIN
IF ~~ THEN POGHM5 sword_evaluation
@134 /* [male priest]Oh, this is a malicious curse indeed. Some might want to make use of it in a fierce fight, but you have to know this blade very well to know how to confine the situations. In the wrong  - or unsuspecting - hands, this blade will cause a lot of misery, and it seems to me that the creator of this curse was aiming for this purpose. It is wise of you that you try to gather as much information about it as possible. */
== C#BrageJ @135 /* [Brage]Thank you for your kind words. */
END
IF ~~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathPOGHM5","GLOBAL",1)~ EXIT
IF ~GlobalLT("C#BE_BG1SwordPath","GLOBAL",29) Global("C#BE_BG1SwordPathThanks","GLOBAL",3)~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathPOGHM5","GLOBAL",1)~ EXTERN C#BrageJ brage_thanks_2
IF ~GlobalLT("C#BE_BG1SwordPath","GLOBAL",29) Global("C#BE_BG1SwordPathThanks","GLOBAL",0)~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathPOGHM5","GLOBAL",1)~ EXTERN C#BrageJ brage_thanks_1  
IF ~Global("C#BE_BG1SwordPath","GLOBAL",29)
Global("C#BE_BG1SwordPathThanks","GLOBAL",4)~ EXTERN C#BrageJ brage_thanks_final


/* Shandalar */
EXTEND_BOTTOM SHANDAL2 19
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathShandalar","GLOBAL",0)
OR(2) PartyHasItem("SW2H03") PartyHasItem("c#be1sp1")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @136 /* First, we would like to profit from your immesearable wisdom. My comrade Brage has questions to a cursed sword you might be able to help us with. */ DO ~SetGlobal("C#BE_BG1SwordPathShandalar","GLOBAL",1)~ + sword_too_soon_19
END

APPEND SHANDAL2 
IF ~~ THEN sword_too_soon_19
SAY @137 /* [Shandalar]No, there will be no questions until you did what I asked of you. */
COPY_TRANS SHANDAL2 19
END
END //APPEND

EXTEND_BOTTOM SHANDAL2 20
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathShandalar","GLOBAL",0)
OR(2) PartyHasItem("SW2H03") PartyHasItem("c#be1sp1")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @136 /* First, we would like to profit from your immesearable wisdom. My comrade Brage has questions to a cursed sword you might be able to help us with. */ DO ~SetGlobal("C#BE_BG1SwordPathShandalar","GLOBAL",1)~ + sword_too_soon_20
END

APPEND SHANDAL2 
IF ~~ THEN sword_too_soon_20
SAY @137 /* [Shandalar]No, there will be no questions until you did what I asked of you. */
COPY_TRANS SHANDAL2 20
END
END //APPEND

EXTEND_BOTTOM SHANDAL2 21
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathShandalar","GLOBAL",0)
OR(2) PartyHasItem("SW2H03") PartyHasItem("c#be1sp1")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @136 /* First, we would like to profit from your immesearable wisdom. My comrade Brage has questions to a cursed sword you might be able to help us with. */ DO ~SetGlobal("C#BE_BG1SwordPathShandalar","GLOBAL",1)~ + sword_too_soon_21
END

APPEND SHANDAL2 
IF ~~ THEN sword_too_soon_21
SAY @137 /* [Shandalar]No, there will be no questions until you did what I asked of you. */
COPY_TRANS SHANDAL2 21
END
END //APPEND

EXTEND_BOTTOM SHANDAL2 22
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathShandalar","GLOBAL",0)
OR(2) PartyHasItem("SW2H03") PartyHasItem("c#be1sp1")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @136 /* First, we would like to profit from your immesearable wisdom. My comrade Brage has questions to a cursed sword you might be able to help us with. */ DO ~SetGlobal("C#BE_BG1SwordPathShandalar","GLOBAL",1)~ + sword_too_soon_22
END

APPEND SHANDAL2 
IF ~~ THEN sword_too_soon_22
SAY @137 /* [Shandalar]No, there will be no questions until you did what I asked of you. */
COPY_TRANS SHANDAL2 22
END
END //APPEND

EXTEND_BOTTOM SHANDAL2 25
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathShandalar","GLOBAL",0)
OR(2) PartyHasItem("SW2H03") PartyHasItem("c#be1sp1")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @136 /* First, we would like to profit from your immesearable wisdom. My comrade Brage has questions to a cursed sword you might be able to help us with. */ DO ~SetGlobal("C#BE_BG1SwordPathShandalar","GLOBAL",1)~ + sword_too_soon_25
END

APPEND SHANDAL2 
IF ~~ THEN sword_too_soon_25
SAY @137 /* [Shandalar]No, there will be no questions until you did what I asked of you. */
COPY_TRANS SHANDAL2 25
END
END //APPEND

I_C_T3 SHANDAL2 27 C#BE_BG1SP_SHANDAL2_27
== C#BrageJ IF ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathShandalar","GLOBAL",1)
OR(2) PartyHasItem("SW2H03") PartyHasItem("c#be1sp1")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ THEN @138 /* [Brage]Wait, Master Shandalar! We still have a question for you. Is there anything you can tell us about this sword? */
== SHANDAL2 IF ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathShandalar","GLOBAL",1)
PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ THEN @139 /* [Shandalar]It is a cursed weapon, I can see that - very clearly, by the way, so stop waving it in my face! What else is there to it? What do you think I am, a weapon smith? Well, I am not. */
== SHANDAL2 IF ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathShandalar","GLOBAL",1)
!PartyHasItem("SW2H03")
PartyHasItem("c#be1sp1")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ THEN @140 /* [Shandalar]Well, I see the priest already wrote everything down that there is to see about the curse. What else do you expect? What do you think I am, a weapon smith? Well, I am not. */
END

I_C_T3 SHANDAL2 28 C#BE_BG1SP_SHANDAL2_28
== C#BrageJ IF ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathShandalar","GLOBAL",1)
OR(2) PartyHasItem("SW2H03") PartyHasItem("c#be1sp1")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ THEN @138 /* [Brage]Wait, Master Shandalar! We still have a question for you. Is there anything you can tell us about this sword? */
== SHANDAL2 IF ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathShandalar","GLOBAL",1)
PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ THEN @141 /* [Shandalar]It is a cursed weapon, I can see that - very clearly, by the way, so stop waving it in my face! What else is there to it? What do you think I am, a weapon smith? Well, I am not.  */
== SHANDAL2 IF ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathShandalar","GLOBAL",1)
PartyHasItem("c#be1sp1")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ THEN @140 /* [Shandalar]Well, I see the priest already wrote everything down that there is to see about the curse. What else do you expect? What do you think I am, a weapon smith? Well, I am not. */
END

I_C_T3 SHANDAL2 29 C#BE_BG1SP_SHANDAL2_29
== C#BrageJ IF ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathShandalar","GLOBAL",1)
OR(2) PartyHasItem("SW2H03") PartyHasItem("c#be1sp1")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ THEN @138 /* [Brage]Wait, Master Shandalar! We still have a question for you. Is there anything you can tell us about this sword? */
== SHANDAL2 IF ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathShandalar","GLOBAL",1)
PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ THEN @139 /* [Shandalar]It is a cursed weapon, I can see that - very clearly, by the way, so stop waving it in my face! What else is there to it? What do you think I am, a weapon smith? Well, I am not. */ 
== SHANDAL2 IF ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathShandalar","GLOBAL",1)
PartyHasItem("c#be1sp1")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ THEN @140 /* [Shandalar]Well, I see the priest already wrote everything down that there is to see about the curse. What else do you expect? What do you think I am, a weapon smith? Well, I am not. */ 
END


/* Nashkel Shop SHOPKN */
EXTEND_BOTTOM SHOPKN 0
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathSHOPKN","GLOBAL",0)
PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200000 /* My comrade Brage here has a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathSHOPKN","GLOBAL",0)
PartyHasItem("c#be1sp1") !PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200001 /* My comrade Brage here has information about a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
END

EXTEND_BOTTOM SHOPKN 1
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathSHOPKN","GLOBAL",0)
PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200000 /* My comrade Brage here has a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathSHOPKN","GLOBAL",0)
PartyHasItem("c#be1sp1") !PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200001 /* My comrade Brage here has information about a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
END

CHAIN
IF ~~ THEN SHOPKN sword_evaluation
@142 /* [male shopkeeper]Yes, of course I know about the cursed sword that caused so much misery to Nashkel in general - and you, personally, Brage. I am afraid there is nothing I can say to it - other that I never saw it before and don't know where it came from. */
== C#BrageJ @143 /* [Brage]Thank you, nevertheless. */
END
IF ~~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathSHOPKN","GLOBAL",1)~ EXIT
IF ~GlobalLT("C#BE_BG1SwordPath","GLOBAL",29) Global("C#BE_BG1SwordPathThanks","GLOBAL",3)~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathSHOPKN","GLOBAL",1)~ EXTERN C#BrageJ brage_thanks_2
IF ~GlobalLT("C#BE_BG1SwordPath","GLOBAL",29) Global("C#BE_BG1SwordPathThanks","GLOBAL",0)~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathSHOPKN","GLOBAL",1)~ EXTERN C#BrageJ brage_thanks_1  
IF ~Global("C#BE_BG1SwordPath","GLOBAL",29)
Global("C#BE_BG1SwordPathThanks","GLOBAL",4)~ EXTERN C#BrageJ brage_thanks_final


/* melee merchant at Nashkel Carnival MERCH5 */
EXTEND_BOTTOM MERCH5 0
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathMERCH5","GLOBAL",0)
PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200000 /* My comrade Brage here has a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathMERCH5","GLOBAL",0)
PartyHasItem("c#be1sp1") !PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200001 /* My comrade Brage here has information about a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
END

CHAIN
IF ~~ THEN MERCH5 sword_evaluation
@144 /* [male merchant]Ah - the sword that we all heard so much about. Unfortunately, there isn't much I can say about it - it shows some resemblance to a Tethyrian forging style, but it seems a bit too heavy, and I can't tell who the smith would have been. I'm afraid there is nothing else I can say to it. */
== C#BrageJ @119 /* [Brage]Thank you for taking the time. */
END
IF ~~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathMERCH5","GLOBAL",1)~ EXIT
IF ~GlobalLT("C#BE_BG1SwordPath","GLOBAL",29) Global("C#BE_BG1SwordPathThanks","GLOBAL",3)~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathMERCH5","GLOBAL",1)~ EXTERN C#BrageJ brage_thanks_2
IF ~GlobalLT("C#BE_BG1SwordPath","GLOBAL",29) Global("C#BE_BG1SwordPathThanks","GLOBAL",0)~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathMERCH5","GLOBAL",1)~ EXTERN C#BrageJ brage_thanks_1  
IF ~Global("C#BE_BG1SwordPath","GLOBAL",29)
Global("C#BE_BG1SwordPathThanks","GLOBAL",4)~ EXTERN C#BrageJ brage_thanks_final


/* Maltz' Shop MALTZ */

APPEND MALTZ
IF WEIGHT #-1
~Dead("CORWYVRN")
!PartyHasItem("MISC52")
!Global("wyvernp","GLOBAL",1)
GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathMALTZ","GLOBAL",0)
OR(2) PartyHasItem("SW2H03") PartyHasItem("c#be1sp1")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ show_sword_after
SAY @145 /* [#10085 Maltz]Hello there! I'm Maltz. I know my place doesn't look much like a store, but I think it suits my purposes quite nicely. What is it that you'd like? */
+ ~PartyHasItem("SW2H03")~ + @200000 /* My comrade Brage here has a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
+ ~PartyHasItem("c#be1sp1") !PartyHasItem("SW2H03")~ + @200001 /* My comrade Brage here has information about a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
++ @146 /* I will not disturb you with some weapon inquiries. Show me your wares. */ DO ~SetGlobal("C#BE_BG1SwordPathMALTZ","GLOBAL",1)~ EXIT 
END

IF ~~ THEN show_wares
SAY @147 /* [Maltz]What is it that you'd like? */
COPY_TRANS MALTZ 0
END
END //APPEND

CHAIN
IF ~~ THEN MALTZ sword_evaluation
@148 /* [Maltz]Hmm, the style is a bit different to what I see from local smithies. I would assume it was forged far away. */
== MALTZ IF ~PartyHasItem("c#be1sp1")~ THEN @149 /* [Maltz]What the notes state is a tricky curse indeed. */ 
== MALTZ IF ~!PartyHasItem("c#be1sp1")~ THEN @150 /* [Maltz]I can't say anything to the curse, but it seems like a decent enough weapon. I'll take your word for it being cursed, so I'll keep my distance. */
== MALTZ @151 /* [Maltz]This reminds me of a pair of gauntlets I was once offered. They were all nice and useful if put on in solitude, but gods beware if you wore them in a fight. I was lucky I showed them to a priest before selling, it was only my gut feeling that made me do it. It's always a risk if trading things one didn't make oneself - catching a cursed item only a priest or mage can reveal. */
== C#BrageJ @119 /* [Brage]Thank you for taking the time. */
END
IF ~~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathMALTZ","GLOBAL",1)~ EXIT
IF ~GlobalLT("C#BE_BG1SwordPath","GLOBAL",29) Global("C#BE_BG1SwordPathThanks","GLOBAL",3)~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathMALTZ","GLOBAL",1)~ EXTERN C#BrageJ brage_thanks_2
IF ~GlobalLT("C#BE_BG1SwordPath","GLOBAL",29) Global("C#BE_BG1SwordPathThanks","GLOBAL",0)~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathMALTZ","GLOBAL",1)~ EXTERN C#BrageJ brage_thanks_1  
IF ~Global("C#BE_BG1SwordPath","GLOBAL",29)
Global("C#BE_BG1SwordPathThanks","GLOBAL",4)~ EXTERN C#BrageJ brage_thanks_final


/* The Lady's Hall in BG CHANTH */
EXTEND_BOTTOM CHANTH 0
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathCHANTH","GLOBAL",0)
PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200000 /* My comrade Brage here has a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathCHANTH","GLOBAL",0)
PartyHasItem("c#be1sp1") !PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200001 /* My comrade Brage here has information about a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
END

CHAIN
IF ~~ THEN CHANTH sword_evaluation
@152 /* [male priest]This sword is unknown to me, and I can't say anything to this weapon. I do see that the curse is an unlucky one, for the one who falls prey to it unprepared. */
== C#BrageJ @153 /* [Brage]Thank you, nontheless. */
END
IF ~~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathCHANTH","GLOBAL",1)~ EXIT
IF ~GlobalLT("C#BE_BG1SwordPath","GLOBAL",29) Global("C#BE_BG1SwordPathThanks","GLOBAL",3)~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathCHANTH","GLOBAL",1)~ EXTERN C#BrageJ brage_thanks_2
IF ~GlobalLT("C#BE_BG1SwordPath","GLOBAL",29) Global("C#BE_BG1SwordPathThanks","GLOBAL",0)~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathCHANTH","GLOBAL",1)~ EXTERN C#BrageJ brage_thanks_1  
IF ~Global("C#BE_BG1SwordPath","GLOBAL",29)
Global("C#BE_BG1SwordPathThanks","GLOBAL",4)~ EXTERN C#BrageJ brage_thanks_final


/* Bentley Mirrorshade BENTLY */
EXTEND_BOTTOM BENTLY 0
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathBentley","GLOBAL",0)
PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200000 /* My comrade Brage here has a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathBentley","GLOBAL",0)
PartyHasItem("c#be1sp1") !PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200001 /* My comrade Brage here has information about a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
END

CHAIN
IF ~~ THEN BENTLY sword_evaluation
@154 /* [Bentley Mirrorshade]Ah, it's a shame that these items exist, but that is the price if one tinkers with arcane forces, it is bound to fail occasionally. I wished people had the decency to get rid of these cursed objects right away. */
== BENTLY IF ~PartyHasItem("SW2H03")~ THEN @155 /* [Bentley Mirrorshade]If you haven't, talk to my wife Gellana about it, I am sure she'll make you a good price to make sure this thing will be gone forever. */
== BENTLY @156 /* [Bentley Mirrorshade]The hilt reminds me of Tethyrian blades I saw, but I wouldn't know whether the smith could be found out by it's design, maybe an expert smith would be able to narrow down the geographic part where this style is commonly used. */
== C#BrageJ @157 /* [Brage]Thank you for taking the time, Master Mirrorshade. */
END
IF ~~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathBentley","GLOBAL",1)~ EXIT
IF ~GlobalLT("C#BE_BG1SwordPath","GLOBAL",29) Global("C#BE_BG1SwordPathThanks","GLOBAL",3)~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathBentley","GLOBAL",1)~ EXTERN C#BrageJ brage_thanks_2
IF ~GlobalLT("C#BE_BG1SwordPath","GLOBAL",29) Global("C#BE_BG1SwordPathThanks","GLOBAL",0)~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathBentley","GLOBAL",1)~ EXTERN C#BrageJ brage_thanks_1  
IF ~Global("C#BE_BG1SwordPath","GLOBAL",29)
Global("C#BE_BG1SwordPathThanks","GLOBAL",4)~ EXTERN C#BrageJ brage_thanks_final


/* Gellana Mirrorshade GELLAN */
EXTEND_BOTTOM GELLAN 0
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathGELLAN","GLOBAL",0)
PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200000 /* My comrade Brage here has a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathGELLAN","GLOBAL",0)
PartyHasItem("c#be1sp1") !PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200001 /* My comrade Brage here has information about a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
END

CHAIN
IF ~~ THEN GELLAN sword_evaluation
@158 /* [Gellana Mirrorshade]Oh, this reminds me of the cursed things we found when cleansing this place. - Not because the sword would have been one of them, but because it seems such a fine sword infested with a nasty curse. There is way too much of these items around, and often enough it is innocents that fall prey to them. */
== GELLAN IF ~PartyHasItem("SW2H03")~ THEN @159 /* [Gellana Mirrorshade]If you'll leave it with me I will make sure it will never again fool someone into attacking their own. */
== C#BrageJ IF ~PartyHasItem("SW2H03")~ THEN @160 /* [Brage]I thank you kindly for the offer, but I will hold on to it just a while longer, until I finished my investigations. I swear upon my life that this sword will not fall into unaware hands again. */
== GELLAN @161 /* [Gellana Mirrorshade]I can't tell you anything more about it, but if you haven't already, go and ask my husband Bentley. He does the trading of adventurer's gear and gets to see more weapons people bring along than me. */
== C#BrageJ @153 /* [Brage]Thank you, nontheless. */
END
IF ~~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathGELLAN","GLOBAL",1)~ EXIT
IF ~GlobalLT("C#BE_BG1SwordPath","GLOBAL",29) Global("C#BE_BG1SwordPathThanks","GLOBAL",3)~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathGELLAN","GLOBAL",1)~ EXTERN C#BrageJ brage_thanks_2
IF ~GlobalLT("C#BE_BG1SwordPath","GLOBAL",29) Global("C#BE_BG1SwordPathThanks","GLOBAL",0)~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathGELLAN","GLOBAL",1)~ EXTERN C#BrageJ brage_thanks_1  
IF ~Global("C#BE_BG1SwordPath","GLOBAL",29)
Global("C#BE_BG1SwordPathThanks","GLOBAL",4)~ EXTERN C#BrageJ brage_thanks_final


/* Temple in Gullykin ALVAHE */
EXTEND_BOTTOM ALVAHE 0
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathALVAHE","GLOBAL",0)
PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200000 /* My comrade Brage here has a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathALVAHE","GLOBAL",0)
PartyHasItem("c#be1sp1") !PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200001 /* My comrade Brage here has information about a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
END

CHAIN
IF ~~ THEN ALVAHE sword_evaluation
@162 /* [female priest]A cursed sword? I knew ye adventurers are out of your minds. What are ye coming to me about this for? */
== ALVAHE IF ~PartyHasItem("SW2H03")~ THEN @163 /* [female priest]I see enough to know I don't want this blade being waved around in here. And take it away from the local folks, as well! */
== ALVAHE @164 /* [female priest]I can't tell you anything ye don't probably know yourself already. Make sure this sword does not get into someone's hands who doesn't have divine help, is what I can tell ye. */
== C#BrageJ @153 /* [Brage]Thank you, nontheless. */
END
IF ~~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathALVAHE","GLOBAL",1)~ EXIT
IF ~GlobalLT("C#BE_BG1SwordPath","GLOBAL",29) Global("C#BE_BG1SwordPathThanks","GLOBAL",3)~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathALVAHE","GLOBAL",1)~ EXTERN C#BrageJ brage_thanks_2
IF ~GlobalLT("C#BE_BG1SwordPath","GLOBAL",29) Global("C#BE_BG1SwordPathThanks","GLOBAL",0)~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathALVAHE","GLOBAL",1)~ EXTERN C#BrageJ brage_thanks_1 
IF ~Global("C#BE_BG1SwordPath","GLOBAL",29)
Global("C#BE_BG1SwordPathThanks","GLOBAL",4)~ EXTERN C#BrageJ brage_thanks_final


/* Shop in Ulgoths Beard BART14 */
EXTEND_BOTTOM BART14 0
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathBART14","GLOBAL",0)
PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200000 /* My comrade Brage here has a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathBART14","GLOBAL",0)
PartyHasItem("c#be1sp1") !PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200001 /* My comrade Brage here has information about a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
END

CHAIN
IF ~~ THEN BART14 sword_evaluation
@165 /* [male shopkeep]Hmm, cursed, you say? No, I have never seen it before. */
== C#BrageJ @114 /* [Brage]Well, thank you. */
END
IF ~~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathBART14","GLOBAL",1)~ EXIT
IF ~GlobalLT("C#BE_BG1SwordPath","GLOBAL",29) Global("C#BE_BG1SwordPathThanks","GLOBAL",3)~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathBART14","GLOBAL",1)~ EXTERN C#BrageJ brage_thanks_2
IF ~GlobalLT("C#BE_BG1SwordPath","GLOBAL",29) Global("C#BE_BG1SwordPathThanks","GLOBAL",0)~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathBART14","GLOBAL",1)~ EXTERN C#BrageJ brage_thanks_1  
IF ~Global("C#BE_BG1SwordPath","GLOBAL",29)
Global("C#BE_BG1SwordPathThanks","GLOBAL",4)~ EXTERN C#BrageJ brage_thanks_final


/* Husam */
EXTEND_BOTTOM HUSAM2 14
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathHusam","GLOBAL",0)
OR(2) PartyHasItem("SW2H03") PartyHasItem("c#be1sp1")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @166 /* I assume your organisation has a lot of resources? My comrade Brage here has questions to the origins of a cursed sword. */ EXTERN C#BrageJ husam_sword_chain_01
END

CHAIN 
IF ~~ THEN C#BrageJ husam_sword_chain_01
@167 /* [Brage]<CHARNAME>, I will not ask the Shadow Thieves for help. You might not be aware, but they are a corrupt organisation of thieves and assassins, with a huge branch being seated in Athkatla, Amn's capital. I know them very well from the trouble they stir. */
DO ~SetGlobal("C#BE_BG1SwordPathHusam","GLOBAL",1)~
== HUSAM2 @168 /* [Husam]Which would make us the most capable source for any investigations about a cursed sword, I would say? I would be open to cut you a good deal for this. */
END
++ @169 /* Shouldn't you use every possible source to get informations from, Brage? This one is an especially resourceful one, as it seems. */ + husam_sword_02
++ @170 /* See? This sounds good, I think. */ + husam_sword_01
++ @171 /* Well, we are working with them now, Brage, no?... */ + husam_sword_01
++ @172 /* Well, I understand you do not want to rely on such an organisation. */ + husam_sword_chain_02

APPEND C#BrageJ 
IF ~~ THEN husam_sword_01
SAY @173 /* [Brage]I do not trust this rogue to act in my interest with regard to this, <CHARNAME>. */
IF ~~ THEN + husam_sword_chain_02
END

IF ~~ THEN husam_sword_02
SAY @174 /* [Brage]Resourceful - yes, and in ways that make me shudder to even think about it! */
IF ~~ THEN + husam_sword_01
END
END //APPEND

CHAIN 
IF ~~ THEN C#BrageJ husam_sword_chain_02
@175 /* [Brage]If it suits his guild, he could give me false information of any kind. Who knows, maybe the mage who enchanted this weapon is already working for them! */
== HUSAM2 @176 /* [Husam]I know for sure that this sword never was close to my guild halls, so for the possibility that we maintain connections to the ones who produced or secured this sword, I will give you my word that I would never lead you on a false trail if we agree on a deal now. */
== C#BrageJ @177 /* [Brage]Your word - your word is like a snake. It twirls and twists until it gets out of being hold. It only holds as long as your guild master doesn't think it's better to beak it, and you know it. */
== HUSAM2 @178 /* [Husam]I could point out that your words hurt my Shadow Thief's pride, but I guess you wouldn't care about it, anyway. So - "suit yourself"? */
== C#BrageJ @179 /* [Brage]I am not desperate enough to go to the Shadow Thieves for help, my search only just started. No more word of this, let us move on, we have an important task to tackle. */
== HUSAM2 @180 /* [Husam]Well, I could have made you a very good deal, but it seems you know where to find us if you'd want to. Just make sure you'll have the gold my guild will charge you then. */
EXIT

APPEND C#BrageJ

/* final dialogue - closes the quest for BG:EE without SoD */
IF ~Global("C#BE_BG1SwordPath","GLOBAL",20)~ THEN sword_path_bg1_end
SAY @181 /* [Brage]<CHARNAME>, we asked several experts about the cursed sword, and I think the information we gained is already very helpful. The smith seems to have used different style elements which makes it impossible to pin the blade to a certain geographic reason. */
= @182 /* [Brage]The curse seems to be too well suited for such a purpose to assume it just happened as a failed attempt to make a magic weapon, and the enchantment is not a trivial one but would need rare ingredients and a well versed mage to complete. (clenches teeth) So it is well possible the curse was refined before sending it my way, at least - and by the use of expensive resources. */
+ ~!Dead("Cythan") !PartyHasItem("SCRL3F") Global("DukeThanks","GLOBAL",0)~ + @183 /* We are still in pursuit of the whole conspiracy. Maybe we'll find more clues as to how the sword was ordered. */ + sword_path_bg1_end_01
+ ~OR(3) Dead("Cythan") PartyHasItem("SCRL3F") GlobalGT("DukeThanks","GLOBAL",0)~ + @184 /* We didn't find any more clues with the Iron Throne. I would have guessed Sarevok would have used the resources of his father's organisation. */ + sword_path_bg1_end_02
++ @185 /* Does it help you in your pursuit? */ + sword_path_bg1_end_03
++ @186 /* Are we done then? */ + sword_path_bg1_end_04
END

IF ~~ THEN sword_path_bg1_end_01
SAY @187 /* [Brage]I wouldn't be surprised if we won't find anything. It was a criminal action, I am sure it was not put down in any official books of any trading company we'll meet. */ 
IF ~~ THEN + sword_path_bg1_end_05
END

IF ~~ THEN sword_path_bg1_end_02
SAY @188 /* [Brage]I am not surprised. It was a criminal action, it is no wonder it was not put down in any official books of any trading company we investigated. */
IF ~~ THEN + sword_path_bg1_end_05
END

IF ~~ THEN sword_path_bg1_end_03
SAY @189 /* [Brage]Not in the sense that I would know where to turn to find the culprits.. but the information we gathered will help me in my further pursuit. */
IF ~~ THEN + sword_path_bg1_end_05
END

IF ~~ THEN sword_path_bg1_end_04
SAY @190 /* [Brage]We don't have to go on asking about the sword, if that is what you mean. */
IF ~~ THEN + sword_path_bg1_end_05
END

IF ~~ THEN sword_path_bg1_end_05
SAY @191 /* [Brage]It is striking that none of the people we asked ever saw the sword, not even the ones who are into the trading business... It went very shady paths to get to me, indeed. */
IF ~~ THEN + sword_path_bg1_end_06
END

IF ~~ THEN sword_path_bg1_end_06
SAY @192 /* [Brage]There will be no written record of the resources this sword came from - or of any of the others used for this conspiracy. I am sure of it. The letters we found were compromising enough. */
++ @193 /* We should go on asking about the sword. Maybe we'll learn something else. */ + sword_path_bg1_end_07
++ @194 /* So I'll stop asking about the sword? */ + sword_path_bg1_end_07
END

IF ~~ THEN sword_path_bg1_end_07
SAY @195 /* [Brage]I would be grateful if we could spare the time - but it seems to me we already asked some very well versed people. I will not insist on further investigations about the sword or its curse for the rest of our travels. */
++ @196 /* I'll continue asking if we meet someone who might have knowledge. You never know. */ DO ~SetGlobal("C#BE_BG1SwordPath","GLOBAL",29)~ + sword_path_bg1_end_08
++ @197 /* Suits me, I'll stop asking then and save the time. */ DO ~SetGlobal("C#BE_BG1SwordPath","GLOBAL",30)~ + sword_path_bg1_end_09
END

IF ~~ THEN sword_path_bg1_end_08
SAY @198 /* [Brage]I thank you, <CHARNAME>. I cannot put into words how grateful I am for your help. */
IF ~~ THEN + sword_path_bg1_end_10
END

IF ~~ THEN sword_path_bg1_end_09
SAY @199 /* [Brage]It is fine by me. Like I said, we already got very useful information. */
IF ~~ THEN + sword_path_bg1_end_10
END

IF ~~ THEN sword_path_bg1_end_10
SAY @200 /* [Brage]The information we gathered is one step in my search - which has only started. As soon as our task is done, I will travel to Waterdeep to confront the smith of the original sword. I do not dare send a message, for it might well be his smithy is infiltrated by the criminals who made using the original seal on the cursed sword possible, and I will not risk rousing their suspicion. */
IF ~~ THEN + sword_path_bg1_end_11
END

IF ~~ THEN sword_path_bg1_end_11
SAY @0 /* ~I will hold on to the hope that I will find the ones responsible from there. The smith of this sword might no longer be around, but the mage and the ones who put it into the sealed box still might - and if they are, I will find them!~ */
IF ~~ THEN DO ~EraseJournalEntry(@100017)
EraseJournalEntry(@100018)
AddExperienceParty(500)~ SOLVED_JOURNAL @100023 EXIT
IF ~GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)~ THEN DO ~EraseJournalEntry(@100016)
EraseJournalEntry(@100017)
EraseJournalEntry(@100018)
SetGlobal("C#BE_BG1SwordPathThanks","GLOBAL",0)
AddExperienceParty(500)~ SOLVED_JOURNAL @100022 EXIT
END

IF ~~ THEN brage_thanks_final
SAY @201 /* [Brage]I cannot thank you enough for how throrough you are pursuing this investigation, <CHARNAME>. All I can do is praise you for it. */ 
IF ~~ THEN DO ~AddExperienceParty(300) ReputationInc(1) SetGlobal("C#BE_BG1SwordPathThanks","GLOBAL",10)~ EXIT
END

END //APPEND
