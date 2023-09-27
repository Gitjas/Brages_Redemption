/* Brage: will be in the temple of Helm AFTER the Unseeing Eye incident. */

I_C_T BHARVAL 16 C#BE_BHARVAL_16
== BHARVAL IF ~!Dead("C#Brage")~ THEN ~Oh, and it seems that the temples' improver has returned from his recent mission. His name is Brage, and you will find him in the Temple of Helm. He will be ready to assist you in this holy service against a false god, if you request his assistance, as he has placed his strength into the temples' services.~
== ANOMENJ IF ~!Dead("C#Brage") InParty("ANOMEN") See("ANOMEN") !StateCheck("ANOMEN",CD_STATE_NOTVALID)~ THEN ~I know Brage. He assisted the Order in some local assignments. He is a good and honest fighter, but always negociating for a higher gold reward.~
END

I_C_T BHOISIG 18 C#BE_BHOISIG_18
== BHOISIG IF ~!Dead("C#Brage")~ THEN ~I was also informed that Brage has just returned from his recent mission, you will find him in the temple's quarters. He is on a personal path of redemption and an... improver to our temple's needs and requests. If you require his assisstance, he will be ready to go with you against this false god's followers.~
== ANOMENJ IF ~!Dead("C#Brage") InParty("ANOMEN") See("ANOMEN") !StateCheck("ANOMEN",CD_STATE_NOTVALID)~ THEN ~I know Brage. He assisted the Order in some local assignments. He is a good and honest fighter, but always negociating for a higher gold reward.~
END


/* Brage greets Oisig */

/* 
OR(2)
Global("BeholderPlot","GLOBAL",1)
Global("NoHelpBeholder","GLOBAL",1)
*/
CHAIN
IF WEIGHT #-1
~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)
Global("C#BE_OisigFarewell","AR0901",0)~ THEN BHOISIG farewell_oisig
~Brage, I see you found your way into <CHARNAME>'s group.~ DO ~SetGlobal("C#BE_OisigFarewell","AR0901",1)~
/* Brage already talked to Sir Lothtyran */
== BHOISIG IF ~Global("C#BE_LothtyranFarewell","AR0901",1)~ THEN ~Sir Lothtyran already told me your times of services to the temples have come to a hold.~
/* Brage did not talk to Sir Lothtyran */
== BHOISIG IF ~Global("C#BE_LothtyranFarewell","AR0901",0)~ THEN ~Does this mean...?~ 
== C#BrageJ IF ~Global("C#BE_LothtyranFarewell","AR0901",0)~ THEN ~It means foremost that my times of services to the temples have come to a hold, High Watcher Oisig.~
== C#BrageJ ~<CHARNAME> is a dear friend and in need of my help, so I will oblige <PRO_HISHER> call for support, and gladly. I thank you for helping me in my times of need, High Watcher.~
== BHOISIG ~The temples thank you in their gods' names for your services, son. You will always be welcome here.~
== BHOISIG IF ~Global("NoHelpBeholder","GLOBAL",1) !Dead("UnseeingEye")~ THEN ~What does this mean for our plea for help, though, <CHARNAME>?~ 
== BHOISIG IF ~Global("BeholderPlot","GLOBAL",1)~ THEN ~As to you, <CHARNAME>...~
END
IF ~~ THEN EXIT
IF ~Global("NoHelpBeholder","GLOBAL",1)
!Dead("UnseeingEye")~ THEN + 23
IF ~Global("BeholderPlot","GLOBAL",1)~ THEN + 24

CHAIN
IF WEIGHT #-1
~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)
!InMyArea("OISIG")
Global("C#BE_OisigFarewell","AR0901",0)
Global("C#BE_LothtyranFarewell","AR0901",0)~ THEN HELMPR farewell_lothtyran
#32296 /* ~Be ever watchful, <LADYLORD>. Do you require the services of Helm?~ */ DO ~SetGlobal("C#BE_LothtyranFarewell","AR0901",1)~
== C#BrageJ ~Sir Lothtyran, you see me in the company of <CHARNAME>, a good friend and in need of my support. My time as an improver for the temples has come to an end. I thank the temples deeply for their support and chances they have provided for me.~
== HELMPR ~I understand. I will inform High Watcher Oisig. Go with Helm's blessing, son.~
EXIT




/* joining dialogue */

BEGIN C#Brage2
IF ~Global("C#BE_SpawnBrage","GLOBAL",20)~ THEN joinbg2
SAY ~Greetings. Yes, I already heard about the "Unseeing Eye" cult and... <CHARNAME>?! Is it you? What a pleasant surprise! So you did find your way to Athkatla. But... you do not look well, <CHARNAME>. Not at all!~
++ ~Hello Brage. No, indeed. I was held prisoner and being tortured the last months by a powerful mage I need to persue now.~ + joinbg2_01
++ ~Brage! It is nice to see you. I need to raise a lot of gold to get to where the Cowled Wizards hold their prisoners!~ + joinbg2_02
++ ~Indeed, and I'm sure you'll hear the whole story soon enough.~ + joinbg2_03
END

IF ~~ THEN joinbg2_01
SAY ~But... what a horrid knowledge is this!~
IF ~~ THEN + joinbg2_03
END

IF ~~ THEN joinbg2_02
SAY ~You intend to go against the Cowled Wizards? Was one of our friends taken?!~
IF ~~ THEN + joinbg2_03
END

IF ~~ THEN joinbg2_03
SAY ~<CHARNAME>, I did pledge my service to the temples, but it is a temporary assignment and I can go whenever I want to. Let me help you in your search. I will join you once more - if you would have need for my company.~
= ~I do have... financial obligations, though. I... I need to request a part of any treasure we might encounter.~
IF ~~ THEN + joinbg2_07
END

IF ~~ THEN joinbg2_04
SAY ~Very well. I just returned from my last assignment and will rest for some time.~
IF ~~ THEN + joinbg2_05
END

IF ~~ THEN joinbg2_05
SAY ~Return here if I can be of service to you. Farewell.~
IF ~~ THEN DO ~SetGlobal("C#BE_SpawnBrage","GLOBAL",21)~ EXIT
END

CHAIN
IF ~~ THEN C#Brage2 joinbg2_06
~Wonderful! I am ready to go right now.~ 
== C#Brage2 IF ~!Dead("UnseeingEye")~ THEN ~I would feel oblidged to obey the temple's wishes and look into the Unseeing Eye cult, though. I hope you will spare the time and help save the poor souls that went with those tricksters. But if not... I know the Order of the Radiant Heart is also looking into it, so I will not insist if we have more important things to do.~
== C#Brage2 IF ~Dead("UnseeingEye")~ THEN ~You already clinsed the city of the "Unseeing Eye" cult, as I see. This leaves me with no more obligations to the temples.~
== C#Brage2 IF ~InMyArea("OISIG")~ THEN ~Please, take me to High Watcher Oisig, so I can tell him my farewell.~
== C#Brage2 IF ~!InMyArea("OISIG")~ THEN ~High Watcher Oisig seems to be absent - I'd need to speak with Sir Lothtyran before we go, so I can tell my farewells.~
END
IF ~~ THEN DO ~SetGlobal("C#BE_SpawnBrage","GLOBAL",22) SetGlobal("C#BE_BrageTalksBG2","GLOBAL",1) RealSetGlobalTimer("C#BE_BrageDialogueTimer","GLOBAL",1600) JoinParty()~ EXIT


CHAIN
IF ~~ THEN C#Brage2 joinbg2_07
~I found a way to pay back for my sins - literally. I need the gold to support the families of the soldiers I killed, back in Nashkel.~
== ANOMENJ IF ~InParty("ANOMEN") See("ANOMEN") !StateCheck("ANOMEN",CD_STATE_NOTVALID)~ THEN ~*You* would have killed soldiers of the Amnish forces - and walk alive?!~
== C#Brage2 IF ~InParty("ANOMEN") See("ANOMEN") !StateCheck("ANOMEN",CD_STATE_NOTVALID)~ THEN ~Yes, my friend. But dark forces were at play - <CHARNAME> be my witness, as <PRO_HESHE> saved me from the gallows by proving the evil magics involved.~
END
++ ~Agreed. I would be grateful if you'd come along, Brage.~ + joinbg2_06
+ ~Global("C#IM_ImoenStays","GLOBAL",0)~ + ~I can't spare any gold until I have the fare I need to go after Imoen.~ + joinbg2_08
+ ~GlobalGT("C#IM_ImoenStays","GLOBAL",0)~ + ~I can't spare any gold until I have the fare I need to go after this mage Irenicus.~ + joinbg2_08_a
++ ~No, I don't have a use for you yet.~ + joinbg2_04


APPEND C#Brage2

IF ~~ THEN joinbg2_08
SAY ~Of course! I will not stand in the way of saving our dear friend.~
IF ~~ THEN + joinbg2_08_b
END

IF ~~ THEN joinbg2_08_a
SAY ~Of course! I will not stand in the way of your urgent quest goals.~
IF ~~ THEN + joinbg2_08_b
END

IF ~~ THEN joinbg2_08_b
SAY ~The churches still owe me some payment... I will manage until then. So - I would join with you now?~
++ ~Agreed. I would be grateful if you'd come along, Brage.~ + joinbg2_06
++ ~No, I don't have a use for you yet.~ + joinbg2_04
END

IF ~Global("C#BE_SpawnBrage","GLOBAL",21)~ THEN joinbg2_09
SAY ~Greetings, <CHARNAME>.~
++ ~Hello Brage. Would you accompany me once more?~ + joinbg2_06
++ ~I was just passing by.~ + joinbg2_05
END

END //APPEND


