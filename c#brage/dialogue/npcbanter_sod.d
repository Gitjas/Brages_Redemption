/* NPC Banter in dialogue form for SoD */

/* Trigger system needs to be adjusted - should be triggered by script */

/* Add variable so we know whether Brage knows about Rhoma's father */
ADD_TRANS_ACTION bdcorwiJ BEGIN 87 88 END BEGIN END ~SetGlobal("C#BrageCorwinBeno_SoD","GLOBAL",1)~
ADD_TRANS_ACTION BDFAMARI BEGIN 0 END BEGIN END ~SetGlobal("C#BrageCorwinBeno_SoD","GLOBAL",1)~


/* Brage - Corwin 1 */
CHAIN
IF WEIGHT #-1
~%IT_IS_SOD%
CombatCounter(0) !See([ENEMY]) 
InParty("C#Brage")
InParty("CORWIN")
!StateCheck("CORWIN",CD_STATE_NOTVALID)
!StateCheck("C#Brage",CD_STATE_NOTVALID)
See("CORWIN") See(Player1)
Global("C#BrageCorwin_SoD","GLOBAL",0)~ THEN C#BrageB bragecorwin1
@0 /* [Brage]Corwin, it was heart warming to see you with your daughter. */
DO ~SetGlobal("C#BrageCorwin_SoD","GLOBAL",1)~
== C#BrageB IF ~Global("C#BrageCorwinBeno_SoD","GLOBAL",0)~ THEN @1 /* [Brage]I understand the father is no longer with you? */ 
== BDCORWIB IF ~Global("C#BrageCorwinBeno_SoD","GLOBAL",0)~ THEN @2 /* [Corwin]Yes, you could say that. He's still alive, if that is your question. */
== C#BrageB @3 /* [Brage]It is always difficult, giving them the time and attention they need and staying true to one's duty. They grow so fast... Sometimes it was like meeting new children, when my tasks took me away for too long. */
== BDCORWIB @4 /* [Corwin]Oh, you are a father, too? How old are yours? */
== C#BrageB @5 /* [Brage]I... I *was* a father, Corwin. */
== BDCORWIB @6 /* [Corwin]I had no idea, Brage. I am so sorry. */
== C#BrageB @7 /* [Brage]You probably won't be, once you've heard the full story. I am sure it will reach you here, too. But I thank you for your sympathy - I am mourning, like every parent. */
EXIT


/* Brage - Corwin 2 */
CHAIN
IF WEIGHT #-1
~%IT_IS_SOD%
CombatCounter(0) !See([ENEMY]) 
InParty("C#Brage")
InParty("CORWIN")
!StateCheck("CORWIN",CD_STATE_NOTVALID)
!StateCheck("C#Brage",CD_STATE_NOTVALID)
See("CORWIN") See(Player1)
Global("C#BrageCorwin_SoD","GLOBAL",1)~ THEN BDCORWIB bragecorwin2
@8 /* [Corwin]I really had no idea, Brage. The time you fell victim to the cursed sword was a very strained one, for Baldur's Gate and the Flaming Fist as well. We heard of troubles in the Nashkel Carrison and a commander going... berserk but truth be told, I didn't catch the name and at the time, bad news from Amn's forces were good news for us - I am truly sorry. */
DO ~SetGlobal("C#BrageCorwin_SoD","GLOBAL",2)~
== C#BrageB @9 /* [Brage]You don't have to apologize. I understand. */
== BDCORWIB @10 /* [Corwin]How do you... how do you even *try* to cope with what happened?... I am sorry, I shouldn't poke the wound. But the thought - the thought of accidentally killing one's own child - I can't even start to imagine how you must feel. */
== C#BrageB @11 /* [Brage]I... try to cope as best as I can. They died by my hand, Corwin. My mourning is interfering with the feeling that I have no *right* to miss them... */
== BDCORWIB @12 /* [Corwin]That's bullshit. You have *every* right to miss them, Brage, and then some! It was an outrageous injustice, using that sword on you. */
== C#BrageB @13 /* [Brage]I thank you, Captain. */
EXIT


/* Brage - Corwin 3 */
CHAIN
IF 
~%IT_IS_SOD%
CombatCounter(0) !See([ENEMY]) 
InParty("C#Brage")
InParty("CORWIN")
!StateCheck("CORWIN",CD_STATE_NOTVALID)
!StateCheck("C#Brage",CD_STATE_NOTVALID)
See("CORWIN") See(Player1)
Global("C#BrageCorwin_SoD","GLOBAL",2)~ THEN BDCORWIB bragecorwin3
@14 /* [Corwin]Brage, how can you be so calm? I would go about, shouting and lamenting and cursing the gods! */
DO ~SetGlobal("C#BrageCorwin_SoD","GLOBAL",3)~
== C#BrageB @15 /* [Brage]Well, so did I, Corwin. <CHARNAME> had to endure it, back at the Sword Coast. How you see me now is the result of an extensive mourning path - and it is not done yet, not at all. */
== BDCORWIB @16 /* [Corwin]And it probably never will be. It's unbearable to imagine losing Roma to some "normal" cause. But... by your own hands, for the gods' sake... I am sorry - I shouldn't repeat it all the time. */
== C#BrageB @17 /* [Brage]Don't worry. Mentioning it can't evoke any feelings I am not already dealing with. */
== BDCORWIB @18 /* [Corwin]I would have gone on a revenge rampage, Brage. Let everyone bleed who even *looked* at the cursed sword. */
== C#BrageB @19 /* [Brage]The ones who swapped it in are all dead. I know exactly what you mean. */
== BDCORWIB @20 /* [Corwin]And the ones who produced and delivered it? */
== C#BrageB @21 /* [Brage]I am working on finding them. */
== BDCORWIB @22 /* [Corwin]If I can help you with anything - contacts for official Baldur's Gate Watch smithies, connections, anything that would be helpful for your search, do not hesitate to ask me. */
== BDCORWIB @23 /* [Corwin]My offer was a genuine one. But I admit that I think this is of importance to my city, too. Whoever was involved in the actual sword exchange could be activated to harm the Flaming Fist and with it Baldur's Gate, given the circumstances. */
== C#BrageB @24 /* [Brage]It is a generous offer, regardless of your motives. I thank you dearly for it. */
EXIT