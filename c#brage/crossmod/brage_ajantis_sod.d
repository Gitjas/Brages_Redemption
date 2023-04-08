
/* @99 ~Why are you still here? Go away!~ */
I_C_T c#besq0a %c#besq0a_99% C#AjSoD_c#besq0a_99
== BDAJANTJ IF ~InParty("Ajantis") InMyArea("Ajantis")!StateCheck("Ajantis",CD_STATE_NOTVALID)~ THEN @0 /* [Ajantis]I am sworn to protect the ones in need. Come down, now. We will not harm you, I give you my word of honor! */
== c#besq0a IF ~InParty("Ajantis") InMyArea("Ajantis")!StateCheck("Ajantis",CD_STATE_NOTVALID)~ THEN @1 /* Is *exactly* what the bad people would say. (sniff) */
END

/* @126 ~[Tilda]What?! You are... you are so mean! You can't do that... (sob)~ */
I_C_T c#besq0a %c#besq0a_126% C#AjSoD_c#besq0a_126
== BDAJANTJ IF ~InParty("Ajantis") InMyArea("Ajantis")!StateCheck("Ajantis",CD_STATE_NOTVALID)~ THEN @2 /* I am against frightening the child so, <CHARNAME>! */
END

/*
Global("C#BE_SoDleavingcomment","GLOBAL",3): Ajantis and Brage talked about travelling together to Waterdeep
*/
/* banter */
CHAIN
IF WEIGHT #-1
~%IT_IS_SOD%
CombatCounter(0) !See([ENEMY]) 
InParty("C#Brage")
InParty("Ajantis")
!StateCheck("Ajantis",CD_STATE_NOTVALID)
!StateCheck("C#Brage",CD_STATE_NOTVALID)
See("C#Brage") See(Player1)
GlobalGT("bd_plot","global",40)
Global("C#BrageAjantis_SoD","GLOBAL",0)~ THEN BDAJANTB brage_ajantis_1
@3 /* [Ajantis]Brage, did you succeed in pursuing your search for the maker of the cursed sword? */
DO ~SetGlobal("C#BrageAjantis_SoD","GLOBAL",1)~
== BDAJANTB IF ~Global("C#BE_SoDleavingcomment","GLOBAL",3)~ THEN @4 /* I hope you fared well after we parted ways at the city gates of Waterdeep. */
== C#BrageB @5 /* [Brage]I did, Ajantis, even though there are no concrete results yet. I need to be patient now and hope for the authorities to succeed in their pursuit of the traitor inside the smithy. */
== BDAJANTB @6 /* I hope you will hear from them soon, Brage. The thought of the culprit still roaming free is unbearable. */
EXIT

CHAIN
IF WEIGHT #-1
~%IT_IS_SOD%
CombatCounter(0) !See([ENEMY]) 
InParty("C#Brage")
InParty("Ajantis")
!StateCheck("Ajantis",CD_STATE_NOTVALID)
!StateCheck("C#Brage",CD_STATE_NOTVALID)
See("Ajantis") See(Player1)
Global("C#BrageAjantis_SoD","GLOBAL",1)~ THEN C#BrageB brage_ajantis_2
@7 /* [Brage]I hope you fared well as well while we parted ways, Ajantis? I know you felt under a lot of pressure to arrive in time. */
DO ~SetGlobal("C#BrageAjantis_SoD","GLOBAL",2)~
== BDAJANTB IF ~Global("X#AjantisRomanceActive","GLOBAL",2)~ THEN @8 /* Alas, I was not successful in my endeavors. My parents were away on a business trip, and Waterdeep soon started preparing to march against the crusade. */
== BDAJANTB @9 /* The ongoings put the Order of the Radiant heart into highest alert, and with it, all knights and squires in the region were deployed to help stabilize the situation. My request to help from here was granted readily enough due to my recent successes along the Sword Coast. I made my way back to Baldur's Gate a soon as possible. */
== BDAJANTB IF ~Global("X#AjantisRomanceActive","GLOBAL",2)~ THEN @10 /* I will not complain about the order taking me away so soon and sending me after Caelar - considering it brought me back together with my betrothed <CHARNAME>. But it did prevent me from meeting with my parents to settle a private matter. */
== C#BrageB IF ~Global("X#AjantisRomanceActive","GLOBAL",2)~ THEN @11 /* It seems we both have no other chance than to be patient, Ajantis. Let's make sure we use the time of waiting well. */
EXIT