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