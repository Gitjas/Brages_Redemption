/* watching children at the tower */
CHAIN
IF WEIGHT #-1
~Global("C#BE_BST_1_CM","GLOBAL",1)~ THEN c#bragej the_girls
@0 /* ~[Brage](sigh) Seeing these curious children asking all those questions gives me a pain in the heart... How I would long to have my girls with me and explain to them the legend of the well ghost...~ */
DO ~SetGlobal("C#BE_BST_1_CM","GLOBAL",2)~
== ~%IMOEN_BANTER%~ IF ~InParty("%IMOEN_DV%") See("%IMOEN_DV%") 
!StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @1 /* ~[Imoen]You wouldn't have done that, anyway!~ */
== c#bragej IF ~InParty("%IMOEN_DV%") See("%IMOEN_DV%") 
!StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @2 /* ~[Brage]Imoen! How can you say that - yes, I was working overtime, but I *did* take the girls on trips as well... Although maybe not as often as I'd wish!~ */
== ~%IMOEN_BANTER%~ IF ~InParty("%IMOEN_DV%") See("%IMOEN_DV%") 
!StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @3 /* ~[Imoen]This is *Baldur's Gate*! You are from *Amn*! No way you would have taken your daughters into the Seatower for an afternoon leasure time.~ */
== c#bragej IF ~InParty("%IMOEN_DV%") See("%IMOEN_DV%") 
!StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @4 /* ~[Brage]Oh - you meant I wouldn't have taken them *here* because of the political tensions, especially as a commander of the Amnian guard... I'm sorry I snapped at you, Imoen. I thought you were referring to -~ */
== ~%IMOEN_BANTER%~ IF ~InParty("%IMOEN_DV%") See("%IMOEN_DV%") 
!StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @5 /* ~[Imoen]That you are an old fart who took duty over his family anytime, expecting them to get along fine on their own and be always happy when they see you?~ */
== c#bragej IF ~InParty("%IMOEN_DV%") See("%IMOEN_DV%") 
!StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @6 /* ~[Brage]...Exactly. Now that you actually said it - it doesn't sound as infuriating as I imagined. It's just true. (sigh).~ */
== c#bragej @7 /* ~[Brage]Ah well... I can't see my girls anymore, but I can see to other children growing up without fear and violence!~ */
EXIT

/* Shuck tells about smugglers in Nashkel */
I_C_T ~BSSHUCK~ 27 C#BE_BSSHUCK_27
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @8 /* ~*Now* I learn about this?! Well, better late than never, I guess.~ */
END


/* "sword path". ask about the sowrd's origins and special characteristic. */

/* Master Shizell */
EXTEND_BOTTOM bstrmage 6 //%open_shop%
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathbstrmage","GLOBAL",0)
PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200000 /* ~My comrade Brage here has a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it?~ */ + sword_evaluation
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathbstrmage","GLOBAL",0)
PartyHasItem("c#be1sp1") !PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200001 /* ~My comrade Brage here has information about a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it?~ */ + sword_evaluation
END

CHAIN
IF ~~ THEN bstrmage sword_evaluation
@9 /* ~Oh, who would make such a powerful sword and then give it such a curse... But it is such a special curse, there has to be some intention behind it. Such a specific curse doesn't just happen if an enchantment fails.~ */
== C#BrageJ IF ~GlobalLT("C#BE_BG1SwordPath","GLOBAL",20) //Brage's final dialogue did not happen yet
!GlobalGT("C#BE_BG1SwordPathPOGHM5","GLOBAL",0)
!GlobalGT("C#BE_BG1SwordPathJalantha","GLOBAL",0)
!GlobalGT("C#BE_BG1SwordPathKelddath","GLOBAL",0)~ THEN @10 /* ~Are you saying this sword might have been cursed for tricking someone unaware, specifically?~ */
== C#BrageJ IF ~OR(4) 
	GlobalGT("C#BE_BG1SwordPath","GLOBAL",19)
	GlobalGT("C#BE_BG1SwordPathPOGHM5","GLOBAL",0)
	GlobalGT("C#BE_BG1SwordPathJalantha","GLOBAL",0)
	GlobalGT("C#BE_BG1SwordPathKelddath","GLOBAL",0)~ THEN @11 /* ~Yes, we already heard the suspicion that this sword might have been cursed for tricking someone unaware, specifically.~ */
== bstrmage @12 /* ~It might be a possibility the curse was refined for the purpose. It is well possible that it already was a failed attempt of an enchantment before the current curse was put on it. They are not as rare as some might think - it happens more often than enchanters like to admit. Normally, such a failed attempt would be destroyed or corrected. Maybe it wasn't melted down dirctly because the curse hides so well, or it was spared with the intention of changing the curse to a useful enchantment, seeing what a very powerful sword it is.~ */
== C#BrageJ @13 /* ~Or it was spared for spreading malice. I thank you for your insights, Master Shizell.~ */
END
IF ~~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathbstrmage","GLOBAL",1)~ EXIT
IF ~Global("C#BE_BG1SwordPathThanks","GLOBAL",3)~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathbstrmage","GLOBAL",1)~ EXTERN C#BrageJ %brage_thanks_2%
IF ~Global("C#BE_BG1SwordPathThanks","GLOBAL",0)~ THEN DO ~IncrementGlobal("C#BE_BG1SwordPathThanks","GLOBAL",1)
SetGlobal("C#BE_BG1SwordPathbstrmage","GLOBAL",1)~ EXTERN C#BrageJ %brage_thanks_1% 

/* smugglers: Holger bssmgl02 */
/* ~So, do you have any news for me?~ */
EXTEND_BOTTOM bssmgl02 68 //%smuggler_37%
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathbssmgl02","GLOBAL",0)
PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200000 /* ~My comrade Brage here has a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it?~ */ + show_sword_01
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathbssmgl02","GLOBAL",0)
PartyHasItem("c#be1sp1") !PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200001 /* ~My comrade Brage here has information about a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it?~ */ + show_sword_02
END

APPEND bssmgl02
IF ~~ THEN show_sword_01
SAY @14 /* ~A fine blade, but it is cursed, you say?~ */
IF ~~ THEN + show_sword_02
END

IF ~~ THEN show_sword_02
SAY @15 /* ~No, I have never seen it before. We had a source for cursed objects, but they found their fate with a dissatisfied customer.~ */
IF ~~ THEN + show_sword_04
IF ~PartyHasItem("SW2H03")~ THEN + show_sword_03
END 

IF ~~ THEN show_sword_03
SAY @16 /* ~Hmmm, I could still find a buyer for you if you are interested. It's not our normal range of wares, though - very little market.~ */
IF ~~ THEN + sword_evaluation
END

IF ~~ THEN show_sword_04
SAY @17 /* ~Cursed objects are not our normal range of wares - very little market.~ */
IF ~~ THEN + sword_evaluation
END
END //APPEND

CHAIN
IF ~~ THEN bssmgl02 sword_evaluation
@18 /* ~Doesn't mean we'd never do them, they are just not as sought after. Last we sold was over a year ago... not counting the cursed collar of domination we procured for a noble for his very private and very illegal...~ */
== C#BrageJ @19 /* ~Spare us whatever sick details you wanted to give away!~ */
== bssmgl02 @20 /* ~... Imp hearding project.~ */
== C#BrageJ @23 /* ~Your jovial approach to this appalls me, but what do I expect from a smuggler.~ */
== bssmgl02 IF ~PartyHasItem("SW2H03")~ THEN @21 /* ~If you don't want me to sell it, there is nothing I can do.~ */
== C#BrageJ IF ~PartyHasItem("SW2H03")~ THEN @22 /* ~No, we will not sell it!~ */
== C#BrageJ @24 /* ~Thank you for taking the time, I guess.~ */
END
IF ~~ THEN DO ~SetGlobal("C#BE_BG1SwordPathbssmgl02","GLOBAL",1)~ EXIT


