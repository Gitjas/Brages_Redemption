/* after Korlasz' tomb: Brage will say his goodbyes upon transition to SoD / BGII */
/* the actual leaving will be handled by bd0103.bcs */


I_C_T bdimoen 53 C#Brage_BG1_bdimoen_53
== C#Bragej IF ~InParty("C#Brage") 
InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)
/* compatibility with EndlessBG1 "Korlasz Dungeon in BG1" + Transitions */
!Global("SOD_fromimport","global",2)~ THEN @2
END

I_C_T bdimoen 54 C#Brage_BG1_bdimoen_54
== C#Bragej IF ~InParty("C#Brage") 
InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)
/* compatibility with EndlessBG1 "Korlasz Dungeon in BG1" + Transitions */
!Global("SOD_fromimport","global",2)~ THEN @2
END


/* This goes into a .d file: Make Corwin mention Brage's whereabouts in BG city */
EXTEND_BOTTOM bdschael 39
IF ~!Dead("C#Brage") !InPartyAllowDead("C#Brage")
OR(2)
	BeenInParty("C#Brage")
	Global("SOD_fromimport","GLOBAL",0)
~ THEN JOURNAL @5 /* ~Brage

Brage seems to be back in Baldur's Gate. He was seen at the Sorcerous Sundries.~ */ + brage
END

APPEND bdschael

IF ~~ THEN brage
SAY @6 /* ~I also heard that your former compagnion Brage was seen in the Sorcerous Sundries recently.~ */
COPY_TRANS bdschael 39 
END

END //APPEND

/* at east BG */
I_C_T bdschael 66 C#Brage_bdschael_66
== bdschael IF ~!Dead("C#Brage") !InPartyAllowDead("C#Brage") 
//BeenInParty("C#Brage")
~ THEN @7 /* ~The fighter Brage was also reported to have been seen at the Sorcerous Sundries repeatedly.~ */
END

/* before PC goes to rest that night. Brage takes his leave */

I_C_T3 BDDAZZO 2 C#Brage_BDDAZZO_2
== C#Bragej IF ~GlobalLT("C#Brage_SoDSwordPathMess","GLOBAL",2)
InParty("C#Brage") 
InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @3 
DO ~SetInterrupt(FALSE)
MakeGlobal()
SetGlobal("bd_joined","locals",0)
SetGlobal("Kickout","LOCALS",1)
ChangeAIScript("",DEFAULT)
LeaveParty()
EscapeArea()
SetInterrupt(TRUE)~ 
== C#Bragej IF ~Global("C#Brage_SoDSwordPathMess","GLOBAL",2)
InParty("C#Brage") 
InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @64 
DO ~SetInterrupt(FALSE)
MakeGlobal()
SetGlobal("bd_joined","locals",0)
SetGlobal("Kickout","LOCALS",1)
ChangeAIScript("",DEFAULT)
LeaveParty()
EscapeArea()
SetInterrupt(TRUE)~ 
END

I_C_T3 BDDAZZO 3 C#Brage_BDDAZZO_3
== C#Bragej IF ~GlobalLT("C#Brage_SoDSwordPathMess","GLOBAL",2)
InParty("C#Brage") 
InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @3 
DO ~SetInterrupt(FALSE)
MakeGlobal()
SetGlobal("bd_joined","locals",0)
SetGlobal("Kickout","LOCALS",1)
ChangeAIScript("",DEFAULT)
LeaveParty()
EscapeArea()
SetInterrupt(TRUE)~ 
== C#Bragej IF ~Global("C#Brage_SoDSwordPathMess","GLOBAL",2)
InParty("C#Brage") 
InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @64 
DO ~SetInterrupt(FALSE)
MakeGlobal()
SetGlobal("bd_joined","locals",0)
SetGlobal("Kickout","LOCALS",1)
ChangeAIScript("",DEFAULT)
LeaveParty()
EscapeArea()
SetInterrupt(TRUE)~ 
END

/* interjection into Duke Jannath's dialogue */
I_C_T BDLIIA 27 C#BE_BDLIIA_27
== C#Bragej IF ~InParty("C#Brage") 
InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @65 /* ~[Brage]I humbly beg to differ, Duke Jannath. The Hero of Baldur's Gate dead, even just incapacitated would not only make <PRO_HIMHER> unable to fight, but would also lead to shaken morale in the Flaming Fist forces. Especially if attacked inside the guarded palace.~ */
END


/* PC handed over the Bridgefort Castle to the crusaders */

I_C_T BDKHALIJ 33 C#Brage_betrayal_discussion 
== C#Bragej IF ~IsValidForPartyDialogue("C#Brage")~ THEN @1005
END

/* Elandro and the Feyr */

I_C_T bdelandr 12 C#Brage_bdelandr_12
== C#BrageJ IF ~InParty("C#Brage") 
InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @38 /* ~Man, get your hold together! You let your anxiety take you over like this, it will affect your comrades and dampen the spirit of the whole squad!~ */
END

EXTEND_BOTTOM bdelandr 13
+ ~InParty("C#Brage") 
InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ + @39 /* ~Brage, you were a commander, you know how to brace fearful soldiers for something like this. Any advice?~ */ EXTERN c#bragej calm_elandro
END

APPEND C#BrageJ

IF ~~ THEN calm_elandro
SAY @40 /* ~Soldier, being in a siege is never easy to bear. You are not alone in this. Noone of you is. You and your comrades are one unity, and you will fight together. You are stronger than your fear if you know this. Fear is good if it makes you wary. Acknowledge and accept your fear as a sign that you are aware of the danger and ready to fight if necessary. Your fear is what will keep you alive - if you learn to use it.~ */
IF ~~ THEN EXTERN bdelandr 14
END


/* Comment before entering the Cave with the blind Wyrmlings (bd5100aw.bcs) */
IF ~Global("C#Brage_BD_SDD317_WYRMS","BD5100",1)~ THEN blind_wyrm_comment
SAY @8 /* ~These are strange noises coming out of that cave in front of us, <CHARNAME>. I am not sure what kind of animal would make those - we should be prepared when entering that cave.~ */
IF ~~ THEN DO ~SetGlobal("C#Brage_BD_SDD317_WYRMS","BD5100",2)~ EXIT
END

END //APPEND

/* coalition camp - training the recruits */
/* Hester */
I_C_T BDHESTER 5 C#BE_BDHESTER_5
== C#BrageJ IF ~InParty("C#Brage") 
InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @42 /* ~Private, it seems your problem runs deeper than just the question of how to use the weapon. I feel your anxiety and the hesitation it leads to. Do you want it to kill you in battle?~ */
END 

EXTEND_BOTTOM BDHESTER 6
+ ~InParty("C#Brage") 
InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ + @41 /* ~Brage, you think you can teach this recruit to improve his skills?~ */ EXTERN C#BrageJ teach_hester
END

EXTEND_BOTTOM BDHESTER 7
+ ~InParty("C#Brage") 
InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ + @41 /* ~Brage, you think you can teach this recruit to improve his skills?~ */ EXTERN C#BrageJ teach_hester
END

CHAIN
IF ~~ THEN C#BrageJ teach_hester
@43 /* ~[Brage]Private, being nervous or even afraid is only natural. You need to focus on *why* you are here. The only thing worth being afraid of is that your foe will overpower you - and not because of yourself, but because of your friends and the ones that depend on you! *They* are who you are here to protect. It's not to battle the foes. It's to battle them so they do not harm your loved ones!~ */
== BDHESTER @44 /* ~[Hester]So - by focussing on why we're here, the injustices Caelar's wrought upon the Sword Coast, maybe I can ignore my nerves - or even turn them in anger against my foes?~ */
== C#BrageJ @45 /* ~[Brage]Exactly! I see you caught the spirit. Keep it up, private! You can do this.~ */
END
IF ~~ THEN DO ~IncrementGlobal("BD_FIGHTERS_SKILL","BD3000",2)
SetGlobal("bd_sdd301_hester_skill","global",2)
~ EXTERN ~BDHESTER~ 10

/* Clovis */
EXTEND_BOTTOM BDCLOVIS 3
+ ~InParty("C#Brage") 
InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ + @46 /* ~[PC reply]Brage, as a commander I am sure you had smaller men in your guard, too. Any advice?~ */ EXTERN C#BrageJ teach_clovis
END

CHAIN
IF ~~ THEN C#BrageJ teach_clovis
@47 /* ~[Brage]You are doing very well, private. But you were trained by soldiers taller than you. You hit reaching upwards - which takes a lot of strength.~ */
== BDCLOVIS #%2%48093 /* ~I do get fatigued pretty quickly during drills. I thought I needed more training.~ */
== C#BrageJ @48 /* ~Focus on weak spots were you do not have to reach upwards. There are more than you might think - and the foes will fear you for it.~ */
END
IF ~~ THEN DO ~IncrementGlobal("BD_FIGHTERS_SKILL","BD3000",2)
SetGlobal("bd_sdd301_clovista_skill","global",2)~ EXTERN BDCLOVIS 5

/* Morlis */
EXTEND_BOTTOM BDMORLIS 4
+ ~InParty("C#Brage") 
InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ + @49 /* ~Brage, did you have a fierceful fighter like this private under your command and can give some advice?~ */ EXTERN C#BrageJ teach_morlis
END

CHAIN
IF ~~ THEN C#BrageJ teach_morlis
@50 /* ~[Brage]You are strong and do not shy away from being hit. You need to focus that strength on the foe. Try to be in the first row. It is where your skill will be useful the most, as you do not have to watch out not to hit allies. And work on your techniques. Like this...~ */
END
IF ~~ THEN DO ~IncrementGlobal("BD_FIGHTERS_SKILL","BD3000",2)
SetGlobal("bd_sdd301_morlis_skill","global",2)~ EXTERN BDMORLIS 8

/* Taield */
EXTEND_BOTTOM BDTAIELD 1
+ ~InParty("C#Brage") 
InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ + @51 /* ~Brage, as a former commander, can give this private some advice?~ */ EXTERN C#BrageJ teach_taield
END

CHAIN
IF ~~ THEN C#BrageJ teach_taield
@52 /* ~[Brage]You are good. You need more sparring with skilled opponents. Let us spar so I can show you some techniques.~ */
END
IF ~~ THEN DO ~IncrementGlobal("BD_FIGHTERS_SKILL","BD3000",2)
SetGlobal("bd_sdd301_taield_skill","global",2)~ EXTERN BDTAIELD 2


APPEND C#BrageJ 
IF ~~ THEN safana_military_code
SAY @154 /* ~The symbols remind me of ciphers used to encrypt military secret messages. I can't read these, though.~ */
COPY_TRANS bdsafana 92
END

IF ~~ THEN safana_military_code_j
SAY @154 /* ~The symbols remind me of ciphers used to encrypt military secret messages. I can't read these, though.~ */
COPY_TRANS BDSAFANJ 231
END
END //APPEND

EXTEND_BOTTOM BDSAFANA 92
+ ~IsValidForPartyDialogue("C#Brage")
!IsValidForPartyDialogue("Khalid")~ + @155 /* ~Brage, you seem to recognize these symbols?~ */ EXTERN C#BrageJ safana_military_code
END

EXTEND_BOTTOM BDSAFANJ 231
+ ~IsValidForPartyDialogue("C#Brage")
!IsValidForPartyDialogue("Khalid")~ + @155 /* ~Brage, you seem to recognize these symbols?~ */ EXTERN C#BrageJ safana_military_code_j
END


/* bdpolvi */
/* ~The loss of our loved ones is a test the gods have set before us, a test we too often fail. We bow our heads, shed some tears, and shrug our shoulders, accepting what should be unacceptable. The Dragonspear dead were not lost—they were taken. And what was taken once can be taken back.~ */
I_C_T BDPOLVI 14 C#BE_BDPOLVI_14
== C#BrageJ IF ~InParty("C#Brage") 
InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @156 /* ~But when, good priest - how to know when to take them back, and when to let them go - when to question the gods' decisions? How can you be so sure it is your right to question Helm?~ */
== BDPOLVI IF ~InParty("C#Brage") 
InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @157 /* ~Even the gods do not speak as one, and there is struggles between them and other powers. How would it be Helm's will that our loved ones are taken by fiends to hell? It is not, my friend. The Shining Lady made me see this clearly.~ */
END 


/* catapult at castle, bdheldmo.d */
I_C_T bdheldmo 1 C#BE_bdheldmo_1
== C#Bragej IF ~See([PC]) IsValidForPartyDialogue("C#Brage")~ THEN @54 /* ~<CHARNAME> - the catapult aims at the gates and that man is confused about his orders. You! Fire the catapult - now!~ */
== bdheldmo IF ~See([PC]) IsValidForPartyDialogue("C#Brage")~ THEN @55 /* ~Yes, sir! Er... wait...~ */
END



/* Thrix's game */

ADD_TRANS_TRIGGER BDTHRIX 13 ~!IsValidForPartyDialogue("C#Brage")~ DO 2 IF ~!Is?f?ValidForPartyDialogue("Rasaad")~


/*
EXTEND_BOTTOM BDTHRIX 21 22 23 24 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 
*/

EXTEND_BOTTOM BDTHRIX 21 26 30 34 38 42 46 50 54 58 62 66 70 74 78 82 86 90
IF ~Global("C#Brage_SoDThrix","GLOBAL",0) IsValidForPartyDialogue("C#Brage")~ THEN + npc
END

EXTEND_TOP BDTHRIX 22 27 31 35 39 43 47 51 55 59 63 67 71 75 79 83 87 91 #1
IF ~Global("C#Brage_SoDThrix","GLOBAL",0) IsValidForPartyDialogue("C#Brage")~ THEN + npc
END

EXTEND_TOP BDTHRIX 23 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 #10
IF ~Global("C#Brage_SoDThrix","GLOBAL",0) IsValidForPartyDialogue("C#Brage")~ THEN + npc
END

EXTEND_TOP BDTHRIX 24 29 33 37 41 45 49 53 57 61 65 69 73 77 81 85 89 93 #5
IF ~Global("C#Brage_SoDThrix","GLOBAL",0) IsValidForPartyDialogue("C#Brage")~ THEN + npc
END

EXTEND_BOTTOM BDTHRIX 118 119 120 121 
IF ~Global("C#Brage_SoDThrix","GLOBAL",2) IsValidForPartyDialogue("C#Brage")~ THEN + npc_01
END


APPEND BDTHRIX

IF ~~ THEN BEGIN npc
  SAY @9 /* ~The fallen soldier... He thinks his life were hell. I'll take him with me and show him what hell really means.~ */
  IF ~~ THEN REPLY @10 /* ~You want Brage? Then he will be yours if I lose.~ */ DO ~SetGlobal("C#Brage_SoDThrix","GLOBAL",2)
SetGlobal("bd_thrix_sacrifice_companion","global",1)
~ EXTERN C#BrageJ thrix_01

  IF ~RandomNum(4,1)~ THEN REPLY @11 /* ~Brage is with me on a path of redemption. You will not get his soul.~ */ DO ~SetGlobal("C#Brage_SoDThrix","GLOBAL",1) IncrementGlobal("BD_NumInParty","bd4500",1)~ + 70
  IF ~RandomNum(4,2)~ THEN REPLY @11 /* ~Brage is with me on a path of redemption. You will not get his soul.~ */ DO ~SetGlobal("C#Brage_SoDThrix","GLOBAL",1) IncrementGlobal("BD_NumInParty","bd4500",1)~ + 71
  IF ~RandomNum(4,3)~ THEN REPLY @11 /* ~Brage is with me on a path of redemption. You will not get his soul.~ */ DO ~SetGlobal("C#Brage_SoDThrix","GLOBAL",1) IncrementGlobal("BD_NumInParty","bd4500",1)~ + 72
  IF ~RandomNum(4,4)~ THEN REPLY @11 /* ~Brage is with me on a path of redemption. You will not get his soul.~ */ DO ~SetGlobal("C#Brage_SoDThrix","GLOBAL",1) IncrementGlobal("BD_NumInParty","bd4500",1)~ + 73

  IF ~!Global("BD_NumInParty","bd4500",1)
!Global("BD_NumInParty","bd4500",2)
!Global("BD_NumInParty","bd4500",3)
!Global("BD_NumInParty","bd4500",4)~ THEN REPLY @11 /* ~Brage is with me on a path of redemption. You will not get his soul.~ */ DO ~SetGlobal("C#Brage_SoDThrix","GLOBAL",1)~ + 114

  IF ~~ THEN REPLY @12 /* ~He has his faults, but I'll not risk Brage's soul in so blithe a fashion. If I cannot answer your riddle, mine is the soul you will take. Agreed?~ */ GOTO 113
  IF ~~ THEN REPLY @13 /* ~I'll feed you your own limbs if you don't let me into the tower, you wretched creature. I'm done playing games with you.~ */ GOTO 12
END

IF ~~ THEN npc_01
SAY @14 /* ~Thrix has marked your soul, desperate warrior. Your soul is mine!~ */
++ @15 /* ~Well, I guess that happens if we lose such a game. Sorry, Brage.~ */ DO ~SetGlobal("C#Brage_SoDThrix","GLOBAL",3)~ EXTERN C#BrageJ thrix_02
++ @16 /* ~No, you will not take his soul, devil. We will fight you!~ */ GOTO 10
END

END //APPEND

/*
Global("C#Brage_SoDThrix","GLOBAL",1): PC declined Thrix' choice
Global("C#Brage_SoDThrix","GLOBAL",2)-> 5: PC agreed on brage's soul before the riddle
Global("C#Brage_SoDThrix","GLOBAL",3)-> 6: PC agreed on brage's soul before the riddle and did not fight for brage after riddle was lost
*/

APPEND C#BrageJ

IF ~~ THEN thrix_01
SAY @17 /* ~There is nothing you could do to me physically that I am not already enduring everyday in my mind, fiend.~ */
IF ~~ THEN EXTERN ~BDTHRIX~ 116
END

IF ~~ THEN thrix_02
  SAY @18 /* ~I will be waiting, but I will not come with you without a fight.~ */
  IF ~~ THEN DO ~SetGlobal("bd_thrix_won","global",1)~ EXTERN ~BDTHRIX~ 140
END 

IF ~OR(2)
Global("C#Brage_SoDThrix","GLOBAL",6)
Global("C#Brage_SoDThrix","GLOBAL",5)~ THEN after_thrix
SAY @19 /* ~<CHARNAME>! Why did you do that? Trading my soul to a fiend?!~  [c#ablank] */
+ ~!Global("BD_Thrix_riddle_won","GLOBAL",1)~ + @20 /* ~I saved us all the fight. I didn't plan on losing that stupid game!~ */ + after_thrix_01
+ ~Global("BD_Thrix_riddle_won","GLOBAL",1)~ + @21 /* ~I saved us all the fight. Relax! I won in the end, right?~ */ + after_thrix_01
++ @22 /* ~What would you have me do? Fight that thing? Give my own soul? (scoff)~ */ + after_thrix_02
+ ~Global("BD_Thrix_riddle_won","GLOBAL",1)~ + @23 /* ~I am sorry if it upset you, but I expected to win, which I did. No harm done.~ */ + after_thrix_03
+ ~!Global("BD_Thrix_riddle_won","GLOBAL",1)~ + @24 /* ~I am truly sorry. I thought I could outsmart it - I was a fool, and you'll have to pay the price.~ */ + after_thrix_02
END

END //APPEND

CHAIN
IF ~~ THEN C#BrageJ after_thrix_01
@25 /* ~So it was carelessness as well as arrogance?~ */
== C#BrageJ IF ~!Global("BD_Thrix_riddle_won","GLOBAL",1)
OR(2)
Global("C#Brage_SoDThrix","GLOBAL",6)
Global("C#Brage_SoDThrix","GLOBAL",5)~ THEN  @26 /* ~I do admit that I expect nothing else than my soul going into hell after I died - be it for one specific fiend or in a general manner will not make much of a difference.~ */
END
IF ~~ THEN + after_thrix_02

APPEND C#BrageJ
IF ~~ THEN after_thrix_02
SAY @27 /* ~I am speechless with the readiness you traded a companion's soul to that fiend. That was untainted, inherently evil. I do not know what I expected from you - after you helped me so selflessly, I did believe you are different, but I see now that the evil is stirring within you, and that makes me very sad to witness.~ */
IF ~~ THEN DO ~SetGlobal("C#Brage_SoDThrix","GLOBAL",9)~ EXIT
END

IF ~Global("C#Brage_SoDThrix","GLOBAL",7)~ THEN after_thrix_00
SAY @28 /* ~<CHARNAME>! Why did you do that? Trading a companions soul to a fiend?!~ [c#ablank] */
+ ~!Global("BD_Thrix_riddle_won","GLOBAL",1)~ + @20 /* ~I saved us all the fight. I didn't plan on losing that stupid game!~ */ + after_thrix_02
+ ~Global("BD_Thrix_riddle_won","GLOBAL",1)~ + @21 /* ~I saved us all the fight. Relax! I won in the end, right?~ */ + after_thrix_02
++ @22 /* ~What would you have me do? Fight that thing? Give my own soul? (snort)~ */ + after_thrix_02
+ ~Global("BD_Thrix_riddle_won","GLOBAL",1)~ + @23 /* ~I am sorry if it upset you, but I expected to win, which I did. No harm done.~ */ + after_thrix_03
+ ~!Global("BD_Thrix_riddle_won","GLOBAL",1)~ + @24 /* ~I am truly sorry. I thought I could outsmart it - I was a fool, and you'll have to pay the price.~ */ + after_thrix_02
END

IF ~~ THEN after_thrix_03
SAY @29 /* ~Oh, but a lot of harm was done, <CHARNAME>.~ */
IF ~~ THEN + after_thrix_02
END

IF ~Global("C#Brage_SoDThrix","GLOBAL",8)~ THEN after_thrix_04
SAY @30 /* ~You traded your own soul to that fiend.~ */
+ ~!Global("BD_Thrix_riddle_won","GLOBAL",1)
!Global("C#Brandock_SoDThrix","GLOBAL",9)~ + @31 /* ~I couldn't bet another one's soul! And I didn't want to fight the fiend. At least not now.~ */ + after_thrix_05
+ ~!Global("BD_Thrix_riddle_won","GLOBAL",1)
!Global("C#Brandock_SoDThrix","GLOBAL",9)~ + @32 /* ~I gambled, I lost. Such is life.~ */ + after_thrix_05
+ ~!Global("BD_Thrix_riddle_won","GLOBAL",1)
!Global("C#Brandock_SoDThrix","GLOBAL",9)~ + @33 /* ~Don't remind me of that.~ */ + after_thrix_05
+ ~Global("BD_Thrix_riddle_won","GLOBAL",1)
!Global("C#Brandock_SoDThrix","GLOBAL",9)~ + @31 /* ~I couldn't bet another one's soul! And I didn't want to fight the fiend. At least not now.~ */ + after_thrix_05
+ ~Global("BD_Thrix_riddle_won","GLOBAL",1)
!Global("C#Brandock_SoDThrix","GLOBAL",9)~ + @34 /* ~I gambled, I won. Sometimes a risk pays off.~ */ + after_thrix_05
+ ~Global("BD_Thrix_riddle_won","GLOBAL",1)
!Global("C#Brandock_SoDThrix","GLOBAL",9)~ + @33 /* ~Don't remind me of that.~ */ + after_thrix_05
IF ~Global("C#Brandock_SoDThrix","GLOBAL",9)~ THEN + after_thrix_05
END

IF ~~ THEN after_thrix_05
SAY @35 /* ~I am deeply humbled and proud to be at your side, <CHARNAME>. This was an inherently selfless action. No matter what others might think, but I know that evil is not stirring within you, and if it does, it will not have a chance to influence your actions against your steady will.~ */
IF ~Global("BD_Thrix_riddle_won","GLOBAL",1)~ THEN + after_thrix_06
IF ~!Global("BD_Thrix_riddle_won","GLOBAL",1)~ THEN + after_thrix_07
END

IF ~~ THEN after_thrix_06
SAY @36 /* ~Luckily, you won and the danger is over.~ */
IF ~~ THEN DO ~SetGlobal("C#Brage_SoDThrix","GLOBAL",9)~ EXIT
END

IF ~~ THEN after_thrix_07
SAY @37 /* ~I hope the fiend comes to collect it's price while I am still at your side, so I can - and will! - help you fight it off.~ */
IF ~~ THEN DO ~SetGlobal("C#Brage_SoDThrix","GLOBAL",9)~ EXIT
END

END //APPEND

/* chicken in the well easter egg */
I_C_T BDDOGW01 2 C#BE_BDDOGW01_2
== C#Bragej IF ~IsValidForPartyDialogue("C#Brage")~ THEN @53 /* ~This might be an old well, but if you want to wash the chicken, taking out the water for it surely would have been the better option instead of putting the chicken inside.~ */
END

/* Torsin de Lancie, HC denied to poison the crusader provisions */
I_C_T BDDELANC 25 C#BE_BDDELANC_25
== C#Bragej IF ~IsValidForPartyDialogue("C#Brage")~ THEN @58 /* ~Would you do all in your power you would send the next squad to do the task, instead of tossing it all onto <CHARNAME>. It is up to *you* to make this happen, instead of blaming <PRO_HIMHER> for the casualties the undamped foe will cause!~ */
== BDDELANC IF ~IsValidForPartyDialogue("C#Brage")~ THEN @59 /* ~And you would be who to tell me what I am supposed to do? We do not have men to spare. <CHARNAME> is denying this task for no reasons other than morale vanity! Hurting the foe when he rises the weapon is fine, but seeing to the foe not being able to rise the weapon at all would be evil? What twisted sense of "righteousness" is this!~ */
== C#Bragej IF ~IsValidForPartyDialogue("C#Brage")~ THEN @60 /* ~I... am noone but a fighter with some experience in command. I see the benefit in this plan, sir. That is why I am surprised you toss it away just because one <PRO_MANWOMAN> refuses to do it - while rejecting responsibility for the outcome at the same time.~ */
== BDDELANC IF ~IsValidForPartyDialogue("C#Brage")~ THEN @61 /* ~I will not repeat that I lack the capable soldiers to execute this. This is not a trivial task, that is why I requested <CHARNAME> to do it! And you lecture me with morale of leadership, "fighter with some experience in command". Better know your place and keep quiet next time!~ */
END

/* wall came down with the barrel of Bwoosh! */
I_C_T BDDELANC 65 C#BE_BDDELANC_65
== C#Bragej IF ~IsValidForPartyDialogue("C#Brage")~ THEN @62 /* ~That is the uncertainty of command. You can never be sure a plan works out the way it was meant to. The more satisfaction it brings if everything works like a clockwork.~ */
END

/* portal is open, talk to Torsin de Lancie through the closed door */
I_C_T BDDELANC 75 C#BE_BDDELANC_75
== C#Bragej IF ~IsValidForPartyDialogue("C#Brage")~ THEN @56 /* ~There is no other way than facing it onwards - may Helm help us.~ */
END

I_C_T BDDELANC 79 C#BE_BDDELANC_79
== C#Bragej IF ~IsValidForPartyDialogue("C#Brage")~ THEN @57 /* ~We are back - and victorious! Never would I have believed it, had I heard this as a tale!~ */
END

APPEND C#BrageJ

/* 1st FD, after joining, but only if Caelar's plans aren't known yet */
IF ~Global("C#Brage_SoDDialog","GLOBAL",1)~ THEN crusade
SAY @66 /* [Brage]There were no reports about Caelar forming a crusade, or trying to revive Dragonspear Castle before. She just started marching one day, with an army that gets bigger and bigger. I know what effort it is to raise and sustain such a large amount of infantry. This is a planned march. She is forming an army in preparation for a war.~ */
++ @69 /* ~Question is what for.~ */ + crusade_05
++ @67 /* But... why the numbers of untrained farmers and village folk - does she really think she could overthrow current authorities with this thrown together army of civilians?~ */ + crusade_03
++ @68 /* It is surprising that the coalition doesn't know what the crusade is for yet. */ + crusade_01
++ @70 /* I'm sure we will learn soon enough. */ + crusade_03
++ @71 /* We will see. Let's move on. */ + crusade_04
END

IF ~~ THEN crusade_01
SAY @72 /* I understand the lack of information. It's not always simple to know the real goal of a military opponent. I am certain we will get to know the reason the crusaders are marching for soon, at least. */
IF ~~ THEN + crusade_04
END

IF ~~ THEN crusade_02
SAY @73 /* Not only. You already met some of her better trained followers when they attacked you inside the palace. But the majority of the soldiers seems to be farm folks they "collected" along the way. It makes the crusade weaker than a trained army - might very well be that this will come to our advantage. */
IF ~~ THEN + crusade_03
END

IF ~~ THEN crusade_03
SAY @74 /* It is imperative we know our opponent. I do expect the coalition to know more soon. */
IF ~~ THEN + crusade_04
END

IF ~~ THEN crusade_04
SAY @75 /* Well, Baldur's Gate and the neighboring authorities seem to agree with my assessment - here we are. Being as charismatic as Caelar is told to be, it seems easy for her to gain the loyalty of her followers. We need to know what for, and as quick as possible. The destruction we saw until now might be the smaller damage in comparison to what might be waiting. */
IF ~~ THEN DO ~IncrementGlobal("C#Brage_SoDDialog","GLOBAL",1)~ EXIT
END

IF ~~ THEN crusade_05 
SAY @111 /* ~They definitely have a reason to march. It is not good that we do know so little about their motives - considering the size of this crusade and the threat it poses.~ */
IF ~~ THEN + crusade_01
END

/* 2nd FD, after arriving at bd1000, first camp */
IF ~Global("C#Brage_SoDDialog","GLOBAL",3)~ THEN marching_with_crusade
SAY @76 /* [Brage]We are marching against the Crusade. Never would I have thought to be on a military mission again... */ 
++ @77 /* Especially not with the Flaming Fist. */ + marching_with_crusade_02
++ @78 /* Yes, I can imagine. */ + marching_with_crusade_01
++ @79 /* Yes, me neither. */ + marching_with_crusade_01
++ @80 /* Well, luckily we have a little more freedom than the soldiers have. */ + marching_with_crusade_01
++ @81 /* Just see it as another of our tasks, with a "little" more support. */ + marching_with_crusade_01
++ @82 /* Let's concentrate on the mission and not waste time with chatter. */ + marching_with_crusade_07
END

IF ~~ THEN marching_with_crusade_01
SAY @83 /* [Brage]I do not envy the Flaming Fist - having to march out so soon after such a commotion and reshuffle in the own ranks is not an easy task, for no military force. */
IF ~~ THEN + marching_with_crusade_03
END

IF ~~ THEN marching_with_crusade_02
SAY @84 /* [Brage](scoffs) No, indeed. Not as a former Amnian commander, and not after how Sarevok misused the Flaming Fist only recently. */
IF ~~ THEN + marching_with_crusade_01
END
END //APPEND

CHAIN
IF ~~ THEN C#BrageJ marching_with_crusade_03
@85 /* This might be one reason why the Dukes rely on you like they do, <CHARNAME>. You have proven to be the city's savior. They would be shortsighted not to enlist you for this, too. */
/* no interjection into other dialogues & does not know about PC's blood needed */
== C#BrageJ IF ~Global("C#BE_SoDHusamweak_poison_10","GLOBAL",0)
Global("C#BE_BDLIIA_27","GLOBAL",0)
Global("C#Brage_SoDCaelarWantsPC","GLOBAL",0)
GlobalLT("C#RtD_KnowsPortalBlood","GLOBAL",3)~ THEN @86 /* I am sure this is the reason why Caelar sent assassins to you as well. Going for the hero would have shaken the city's morale and weaken the Watch far beyong your actual fighting power. */
/* interjection into Husam's dialogue / Duke Jannath happened & does not know about PC's blood needed */
== C#BrageJ IF ~OR(2) 
	Global("C#BE_SoDHusamweak_poison_10","GLOBAL",1) 
	Global("C#BE_BDLIIA_27","GLOBAL",1)
Global("C#Brage_SoDCaelarWantsPC","GLOBAL",0)
GlobalLT("C#RtD_KnowsPortalBlood","GLOBAL",3)~ THEN @87 /* As I already pointed out, I am sure this is the reason why Caelar sent assassins to you as well. Going for the hero would have shaken the city's morale and weaken the Watch far beyong your actual fighting power. */
/* knows that Caelar didn't intend to kill the PC */
== C#BrageJ IF ~OR(2)
	GlobalGT("C#Brage_SoDCaelarWantsPC","GLOBAL",0)
	GlobalGT("C#RtD_KnowsPortalBlood","GLOBAL",2)~ THEN @88 /* Although we know that this is probably not the reason why Caelar sent assassins to you, I am sure she would have profited from shaken the city's morale and weaken the Watch far beyong your actual fighting power would she have succeeded in kidnapping you. */
== C#BrageJ @89 /* (sigh) A known tactic indeed - weakening the forces by going against the leaders and role models. Just like Sarevok did it with the Watch not long ago. As well as in Nashkel... Always the same method, and always effective. */
END
++ @90 /* Not this time. I am fine and more than determined to pay her back. */ + marching_with_crusade_05
++ @91 /* Yes, you would know a lot about that. A lot... */ + marching_with_crusade_04
++ @92 /* She hurt Imoen. She shouldn't have done that, you know. */ + marching_with_crusade_05
++ @93 /* The Dukes have guts, obligating me like that. I guess that's what I get from saving people from their own stupidity. */ + marching_with_crusade_06
++ @82 /* Let's concentrate on the mission and not waste time with chatter. */ + marching_with_crusade_07


APPEND C#BrageJ

IF ~~ THEN marching_with_crusade_04
SAY @94 /* [Brage]I do... */
IF ~~ THEN + marching_with_crusade_07
END

IF ~~ THEN marching_with_crusade_05
SAY @95 /* [Brage]It's good to see you in good spirit. */
IF ~~ THEN + marching_with_crusade_07
END

IF ~~ THEN marching_with_crusade_06
SAY @96 /* [Brage]It often is, yes. I see it as a good sign. It means they trust you enough. */
IF ~~ THEN + marching_with_crusade_07
END

IF ~~ THEN marching_with_crusade_07
SAY @97 /* [Brage]Let us go on - stopping the crusade will not be a simple task. */
IF ~~ THEN DO ~IncrementGlobal("C#Brage_SoDDialog","GLOBAL",1)~ EXIT
END



/* After meeting Caelar at CWC */
IF ~Global("C#Brage_SoDDialog","GLOBAL",5)~ THEN bringing_back_souls
SAY @98 /* Caelar is marching the crusade to bring back the trapped souls from Avernus. A whole crusade, set out to rescue lost loved ones - from guaranteed torture. */
+ ~Global("C#Brage_AllForAun","GLOBAL",0)~ + @99 /* This must hit a nerve with you, does it not? */ + bringing_back_souls_01
+ ~GlobalGT("C#Brage_AllForAun","GLOBAL",0)~ + @99 /* This must hit a nerve with you, does it not? */ + bringing_back_souls_01_A
COPY_TRANS_LATE C#BrageJ bringing_back_souls_01
END

IF ~~ THEN bringing_back_souls_01
SAY @106 /* It does, indeed. */
++ @100 /* It's quite impressive, thinking about it. */ + bringing_back_souls_02
++ @101 /* With a crusade that is bringing destruction and chaos where they go. */ + bringing_back_souls_04
++ @102 /* What does she think - storming into Avernus with her followers and fight the fiends in their home plane? */ + bringing_back_souls_07
++ @103 /* It sounds crazy, if you ask me. I'm surprised anyone would fall for such a promise. */ + bringing_back_souls_05
++ @104 /* Want to join them? */ + bringing_back_souls_03
++ @105 /* Let's not talk about that. */ + bringing_back_souls_06
END

IF ~~ THEN bringing_back_souls_01_A
SAY @119 /* It does, indeed. Especially knowing that Caelar wants to right a personal wrong and save her uncle. */
COPY_TRANS_LATE C#BrageJ bringing_back_souls_01
END

IF ~~ THEN bringing_back_souls_02
SAY @107 /* It is. */
IF ~~ THEN + bringing_back_souls_08_A
IF ~Global("C#Brage_AllForAun","GLOBAL",0)~ THEN + bringing_back_souls_08
END

IF ~~ THEN bringing_back_souls_03
SAY @108 /* It does, but the souls lost in the Dragonspear Wars is not my sorrow. */
IF ~~ THEN + bringing_back_souls_08_A
IF ~Global("C#Brage_AllForAun","GLOBAL",0)~ THEN + bringing_back_souls_08
END

IF ~~ THEN bringing_back_souls_04
SAY @109 /* I understand your sentiment when looking at the destruction the crusade left behind, the chaos it havocs across the land. But I also know that with an army of this size, these negative occurrences can't be completely prevented. */
IF ~~ THEN + bringing_back_souls_08_A
IF ~Global("C#Brage_AllForAun","GLOBAL",0)~ THEN + bringing_back_souls_08
END

IF ~~ THEN bringing_back_souls_05
SAY @114 /* I do understand the sentiment of her followers. Be they only half as tormented as I am by the loss of their loved ones... Do not underestimate the power of hope, and desperation. */
IF ~~ THEN + bringing_back_souls_08_A
IF ~Global("C#Brage_AllForAun","GLOBAL",0)~ THEN + bringing_back_souls_08
END

IF ~~ THEN bringing_back_souls_06
SAY  @63 /* [Brage]Then I will be quiet. */
IF ~~ THEN DO ~IncrementGlobal("C#Brage_SoDDialog","GLOBAL",1)~ EXIT
END

IF ~~ THEN bringing_back_souls_07
SAY @110 /* Both Dragonsear Wars took alliances of several forces to be defeated - attempting it with one army is risky at best.~ */
IF ~~ THEN + bringing_back_souls_08_A
IF ~Global("C#Brage_AllForAun","GLOBAL",0)~ THEN + bringing_back_souls_08
END

IF ~~ THEN bringing_back_souls_08
SAY @112 /* ~I salute to such a noble goal. Many a soul was dragged to Avernus in the Dragonspear wars - which is not too long ago, a fresh wound for all forces dragged into it. There is enough desparate relatives, missing their loved ones... And Caelar gatheres them, giving them hope and a purpose.~ */
IF ~GlobalGT("C#Brage_PortalAvernus","GLOBAL",0)~ THEN + bringing_back_souls_15
+ ~Global("C#Brage_PortalAvernus","GLOBAL",0)~ + @120 /* ~Leaving a wake of destruction and death. You can't be blind to that, Brage.~ */ + bringing_back_souls_13
+ ~Global("C#Brage_PortalAvernus","GLOBAL",0)~ + @121 /* ~I hope she gathered all those followers because they want to free loved ones, too - not because she thinks she'll need them to pull the souls out of Avernus, because I don't even want to think about what this would imply.~ */ + bringing_back_souls_09
+ ~Global("C#Brage_PortalAvernus","GLOBAL",0)~ + @113 /* It is a noble goal, I agree to that. */ + bringing_back_souls_09
+ ~Global("C#Brage_PortalAvernus","GLOBAL",0)~ + @105 /* Let's not talk about that. */ + bringing_back_souls_06
END

IF ~~ THEN bringing_back_souls_08_A
SAY @122 /* ~I salute to such a noble goal. Many a soul was dragged to Avernus in the Dragonspear wars - which is not too long ago, a fresh wound for all forces dragged into it. There is enough desparate relatives, missing their loved ones... And Caelar, on the path of putting her own turmoil right, gatheres them, giving them hope and a purpose.~ */
COPY_TRANS_LATE C#BrageJ bringing_back_souls_08
END

IF ~~ THEN bringing_back_souls_09
SAY @117 /* ~I don't understand where it went wrong - why are Caelar and her crusade being perceived as a threat? Daggerford had severe losses in the second war alone. Why are they on the other side of Caelar's efforts to retrieve the souls lost in these wars?~ */
++ @118 /* ~Maybe because there is a crusade rampaging through the lands, cutting off routes and bridges, attacking important persons in city authorities' palaces? Just a guess.~ */ + bringing_back_souls_10
++ @124 /* ~You're not asking why Daggerford wouldn't join a crusade that leaves burnt villages in its wake, are you?~ */ + bringing_back_souls_11
++ @125 /* ~You mean like a collaboration to free the dead?~ */ + bringing_back_souls_14
++ @126 /* ~Well, maybe the Dukes were scared shitless when they heard what it was all about. Or they didn't care - I'm sure it wasn't *their* child or sibling lost in the wars.~ */ + bringing_back_souls_11
++ @127 /* ~Maybe because they can't fund every charismatic warlady who comes knocking.~ */ + bringing_back_souls_11
++ @128 /* ~Because the goal of freeing the souls is noble, but doing it might cost more than it will bring.~ */ + bringing_back_souls_12
++ @105 /* Let's not talk about that. */ + bringing_back_souls_06
END

IF ~~ THEN bringing_back_souls_10
SAY @129 /* ~Yes, I am aware of *that*. I meant how did it come to this.~ */
IF ~~ THEN + bringing_back_souls_11
END

IF ~~ THEN bringing_back_souls_11
SAY @130 /* ~With such a noble goal, why did Caelar not manage to get the authorities on her side - before her army started marching. Surely she must have tried? Even if she thinks she can reach her goal without further military backup, I am sure more ressources would have been helpful. Maybe they could have prevented the damage done by the crusade in the first place!~ */
IF ~~ THEN + bringing_back_souls_12
END

IF ~~ THEN bringing_back_souls_12
SAY @131 /* ~Now she is facing a coalition of three powerful allies trying to stop her - and I agree to them, because she is a rogue warlady marching an army of mercenaries through other authorities' lands and needs to be stopped, or at least disciplined. But - I am more than curious how she plans on pursuing her goal of freeing the souls.~ */
IF ~~ THEN DO ~IncrementGlobal("C#Brage_SoDDialog","GLOBAL",1)~ EXIT
END

IF ~~ THEN bringing_back_souls_13
SAY @116 /* ~I was a commander, <CHARNAME>. It occurring does not mean Caelar want this to happen. With an army this size, all a commander can do is maintain the morale of the troops and respond to the lapses.~ */
IF ~~ THEN + bringing_back_souls_09
END

IF ~~ THEN bringing_back_souls_14
SAY @123 /* ~Exactly. This must hit a nerve with the forces who fought these wars not too long ago, I wager.~ */
IF ~~ THEN + bringing_back_souls_11
END

IF ~~ THEN bringing_back_souls_15
SAY @132 /* ~(sigh) But even I am not blind to the fact that her means are wrong, now that we have intel on how she is planning on achieving it, apparently. Let's go, and stop the crusade before we are facing *another* monster and find war at Dragonspear Castle.~ */
IF ~~ THEN DO ~IncrementGlobal("C#Brage_SoDDialog","GLOBAL",1)~ EXIT
END

/* after returning from Avernus */

IF ~Global("C#Brage_SoDEnd","GLOBAL",1)~ THEN sod_final
SAY @136 /* We are back. We stopped the crusade - and so much more. */
++ @137 /* ~We are, indeed.~ */ + sod_final_03
++ @138 /* ~And I am glad we did.~ */ + sod_final_03
++ @139 /* ~I noticed, but thanks for stating the obvious.~ */ + sod_final_01
++ @140 /* ~I'm expecting a feast for us heros that is worth its name.~ */ + sod_final_02
END

IF ~~ THEN sod_final_01
SAY @141 /* ~I wasn't sure we would be.~ */
IF ~~ THEN + sod_final_03
END

IF ~~ THEN sod_final_02
SAY @142 /* ~If they understood what was at stake, I am sure there will be.~ */
IF ~~ THEN + sod_final_03
END

IF ~~ THEN sod_final_03
SAY @133 /* ~Caelar, the crusaders - they marched with such a noble goal, but Caelar lost herself. She risked the lives of her followers, solely focussing on freeing her uncle, falling for the lures of a beast from the hells. How *could* she - she knew what her uncle wanted, but disrespected his wishes, dragging so many people into death while doing so.~ */
++ @134 /* ~I understand that she wanted to set it right and free him.~ */ + sod_final_05
++ @135 /* ~She felt too guilty, Brage. And maybe too righteous to see that she was wrong.~ */ + sod_final_05
++ @143 /* ~She was raised to be a leader, so after her big failure, she couldn't accept that this is not meant for her.~ */ + sod_final_06
++ @144 /* ~Just because he said it then doesn't mean he wouldn't be thankful for a rescue. Repeating it after he's been freed is also kind of cheap.~ */ + sod_final_04
++ @145 /* ~I don't know what went on in her mind, and to be honest, I don't really care.~ */ + sod_final_06
++ @146 /* ~Let's just enjoy our victory.~ */ + sod_final_07
END

IF ~~ THEN sod_final_04
SAY @147 /* ~Her uncle wasn't just anyone. He was a well respected paladin and knight! He knew very well what he agreed to when he took on her place.~ */
IF ~~ THEN + sod_final_06
END

IF ~~ THEN sod_final_05
SAY @148 /* ~Don't think I wouldn't understand the sentiment of wanting to set something right, to save a loved one.~ */
IF ~~ THEN + sod_final_06
END
END //APPEND

CHAIN
IF ~~ THEN C#BrageJ sod_final_06
@149 /* ~What would I give to know my families wishes! I am in agony not knowing what they are expecting from me - if they even want to have anything to do with me anymore.~ */
== C#BrageJ IF ~InMyArea("bdaun") !Dead("bdaun")~ THEN @150 /* ~Caelar saved her uncle, but at what cost. He will never be happy again - he has to live on with the guilt that should be Caelar's. He will never be ready to enjoy his freedom.~ */
== C#BrageJ IF ~OR(2) !InMyArea("bdaun") Dead("bdaun")~ THEN @151 /* ~And Caelar did *everything* for naught. His sense of duty prevented him from leaving this forsaken place. He took on the guilt that should have been Caelar's, fixing her mistakes - again.~ */
== C#BrageJ IF ~GlobalLT("C#BE_BrageTalksRes","GLOBAL",8)~ THEN @153 /* There is no justification to try to get a loved one back, if the cost is too high. To focus solely on saving them means to fail them in the end. I see that clearly now. */
END
IF ~~ THEN + sod_final_07

APPEND C#BrageJ
IF ~~ THEN sod_final_07
SAY @152 /* ~Caelar created hundreds of no less desperate relatives with her crusade. If only one of them goes the same path... I feel nothing but disdain for this woman. She is where she belongs.~ */
IF ~~ THEN DO ~SetGlobal("C#Brage_SoDEnd","GLOBAL",2)~ EXIT
END

END //APPEND