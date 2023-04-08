
/*
Global("C#Brage_ImoenBG1NPCTome","GLOBAL",2): Brage scolded Imoen for creating her tome in BG1 (BG1NPC crossmod) 
*/


CHAIN
IF WEIGHT #-1
~%IT_IS_SOD%
CombatCounter(0) !See([ENEMY]) 
InParty("C#Brage")
InParty("%IMOEN_DV%")
!StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)
!StateCheck("C#Brage",CD_STATE_NOTVALID)
See("%IMOEN_DV%") See(Player1)
Global("C#BrageImoen_SoD","GLOBAL",0)~ THEN C#BrageB brage_imoen_1
@0 /* [Brage]Imoen, in Amn, every magic user has to go in training with a mage for several years before they are allowed to cast spells on their own. You stayed with Duke Jannath for some weeks and then decided that you would prefer to go with <CHARNAME> after Caelar. */
DO ~SetGlobal("C#BrageImoen_SoD","GLOBAL",1)~
== bdimoenB @1 /* Ugh, of course you would scold me for leaving her tutoring early. */
== bdimoenB IF ~Global("C#Brage_ImoenBG1NPCTome","GLOBAL",2)~ THEN @2 /* You made it quite clear already that you do not approve of my "tinkering" with magic unless I get myself a capable teacher. */
== bdimoenB @3 /* I understand your concern. I had a good teacher - a superb teacher, to be sure, one many mages would be only too happy to get a chance to learn from - and yet, here I am, prefering to travel with my friend... */
== C#BrageB @4 /* Going after the one who attacked you and <PRO_HIMHER>. Imoen, I very well understand the urge - the *need* to go after the ones who wronged you and the ones dear to you. But I also know that it is important to be prepared and ready to face them. */
== bdimoenB @5 /* Ooh, I never looked at it that way! But you are right. Part of why I couldn't let <CHARNAME> go against Caelar without me was because it's *Caelar* and her crusade <PRO_HESHE> is going against. Yes, I think I wanted to be part of that. */
EXIT

CHAIN
IF WEIGHT #-1
~%IT_IS_SOD%
CombatCounter(0) !See([ENEMY]) 
InParty("C#Brage")
InParty("%IMOEN_DV%")
!StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)
!StateCheck("C#Brage",CD_STATE_NOTVALID)
See("C#Brage") See(Player1)
Global("C#BrageImoen_SoD","GLOBAL",1)~ THEN bdimoenB brage_imoen_2
@6 /* [Imoen]Brage, do you think I'm not prepared to kick the crusaders' butts? Or are you scared I might do something stupid along the way? */
DO ~SetGlobal("C#BrageImoen_SoD","GLOBAL",2)~
== C#BrageB @7 /* No, Imoen, neither. I just... wanted to stress that learning with Duke Jannath might have been a chance that won't come to you again, and I think - I think it would have suited you well to profit from it. */
== bdimoenB @8 /* Because I am too impulsive and playful to handle magic properly without it, huh? Yeah, I get it. It's not like I'm hearing this for the first time. */
== C#BrageB @9 /* Because you would have deserved it, Imoen. You are young, and you are full of wit - and you have a good heart. I think you would make a good mage - once you get past the trial and error phase. */
== bdimoenB @10 /* "Trial and error phase", huh? Are you concerned I could hurt us more than our enemies - wait, now I get it. You are worried about me! Brage is worried that little Imoen might gets hurt! */
== C#BrageB @11 /* ...I am indeed, Imoen. */
== bdimoenB @12 /* Wait, what? */
== C#BrageB @13 /* I was very relieved to see you recovered to full health - and I don't want to see you hurt again, especially not by a situation that arose because some magic was not strong enough to ward off enemies. */
== bdimoenB @14 /* Aw, that was a nice thing to say. Thanks - "Dad". I'll make sure I'll stay behind you and your big sword then, so don't you worry about me. And I promise, if there'll be any trial and error, I'll make sure it's directed at our enemies, heheh. */
EXIT
