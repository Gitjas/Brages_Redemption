/* after Korlasz' tomb: Brandock will say his goodbyes upon transition to SoD / BGII */
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
// BeenInParty("C#Brage")
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

I_C_T BDDAZZO 2 C#Brage_BDDAZZO_2
== C#Bragej IF ~InParty("C#Brage") 
InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @0 /* ~<CHARNAME>, it is time to say farewell. We've done a great deed. We stopped an impending war and saved a lot of lives. But I will take this as my cue to leave. I need to walk own steps now, search for the smithy of that sword, earn gold for the families I hurt - return to my home on my own terms. Farewell, and may the gods bless you... If the gods will allow it, we will meet again.~ */
DO ~SetInterrupt(FALSE)
MakeGlobal()
SetGlobal("bd_joined","locals",0)
SetGlobal("Kickout","LOCALS",1)
ChangeAIScript("",DEFAULT)
LeaveParty()
EscapeArea()
SetInterrupt(TRUE)~ 
END

I_C_T BDDAZZO 3 C#Brage_BDDAZZO_3
== C#Bragej IF ~InParty("C#Brage") 
InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @0 /* ~<CHARNAME>, it is time to say farewell. We've done a great deed. We stopped an impending war and saved a lot of lives. But I will take this as my cue to leave. I need to walk own steps now, search for the smithy of that sword, earn gold for the families I hurt - return to my home on my own terms. Farewell, and may the gods bless you... If the gods will allow it, we will meet again.~ */
DO ~SetInterrupt(FALSE)
MakeGlobal()
SetGlobal("bd_joined","locals",0)
SetGlobal("Kickout","LOCALS",1)
ChangeAIScript("",DEFAULT)
LeaveParty()
EscapeArea()
SetInterrupt(TRUE)~ 
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
++ @22 /* ~What would you have me do? Fight that thing? Give my own soul? (pout)~ */ + after_thrix_02
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
++ @22 /* ~What would you have me do? Fight that thing? Give my own soul? (pout)~ */ + after_thrix_02
+ ~Global("BD_Thrix_riddle_won","GLOBAL",1)~ + @23 /* ~I am sorry if it upset you, but I expected to win, which I did. No harm done.~ */ + after_thrix_03
+ ~!Global("BD_Thrix_riddle_won","GLOBAL",1)~ + @24 /* ~I am truly sorry. I thought I could outsmart it - I was a fool, and you'll have to pay the price.~ */ + after_thrix_02
END

IF ~~ THEN after_thrix_03
SAY @29 /* ~Oh, but a lot of harm was done, <CHARNAME>.~ */
IF ~~ THEN + after_thrix_02
END

IF ~Global("C#Brage_SoDThrix","GLOBAL",8)~ THEN after_thrix_04
SAY @30 /* ~You traded your own soul to that fiend.~ */
+ ~!Global("BD_Thrix_riddle_won","GLOBAL",1)~ + @31 /* ~I couldn't bet another one's soul! And I didn't want to fight the fiend. At least not now.~ */ + after_thrix_05
+ ~!Global("BD_Thrix_riddle_won","GLOBAL",1)~ + @32 /* ~I gambled, I lost. Such is life.~ */ + after_thrix_05
+ ~!Global("BD_Thrix_riddle_won","GLOBAL",1)~ + @33 /* ~Don't remind me of that.~ */ + after_thrix_05
+ ~Global("BD_Thrix_riddle_won","GLOBAL",1)~ + @31 /* ~I couldn't bet another one's soul! And I didn't want to fight the fiend. At least not now.~ */ + after_thrix_05
+ ~Global("BD_Thrix_riddle_won","GLOBAL",1)~ + @34 /* ~I gambled, I won. Sometimes a risk pays off.~ */ + after_thrix_05
+ ~Global("BD_Thrix_riddle_won","GLOBAL",1)~ + @33 /* ~Don't remind me of that.~ */ + after_thrix_05
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
I_C_T BDDOGW01 0 C#BE_BDDOGW01_0
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



