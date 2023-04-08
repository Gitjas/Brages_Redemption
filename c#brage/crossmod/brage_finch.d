/* Brage - Finch */

/* library failed SUFINCHJ @800 */
I_C_T SUFINCHJ %finch_800% C#BE_FinchQuestFailed
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @0 /* [Brage]Dammit, I knew Lord and Lady Fenric were easily flustered but this was unfortunate, indeed. */
END

/* Interjection into NOBL2.dlg (added by Finch mod) */
I_C_T NOBL2 %nobl_890% C#BE_NOBL2_IntFinch
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @1 /* [Brage]We are so grateful, sir, for your hospitality to host the library. We will not disturb you any more than necessary. */
END

I_C_T NOBL2 %nobl_898% C#BE_NOBL2_IntFinch
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @1 /* [Brage]We are so grateful, sir, for your hospitality to host the library. We will not disturb you any more than necessary. */
END



/* Brage - Finch 1 */
CHAIN
IF 
~%BG1_BEFORE_TRANSITION%
InParty(Myself)
CombatCounter(0) !See([ENEMY]) 
InParty("SUFINCH")
See("SUFINCH") See(Player1)
!StateCheck("SUFINCH",CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
Global("C#BrageFinch_BG1","GLOBAL",0)~ THEN C#BrageB bragefinch1
@6 /* [Brage]I bow to your bravety to open a library at these chaos stricken times, Finch. */
DO ~SetGlobal("C#BrageFinch_BG1","GLOBAL",1)~
== BSUFINCH @7 /* [Finch]Oh, but there are no bad times to open a library! Or was it that there are never good times for it? Anyway, if you can open a library and everyone is enthousiastic and thankful about it, then you probably wouldn't need it - not as much as if there is opposition and the attempts to repress it. */
== C#BrageB @8 /* [Brage]I am glad Ghastkill saw the benefit of it. Nashkel will profit from your efforts, Finch. */
== BSUFINCH @9 /* [Finch]I thank you, Brage! We both want only the best for the town, don't we? Naskel is such a beautiful place... Only thing missing is a library! */
EXIT

/* Brage - Finch 2 */
CHAIN
IF WEIGHT #-1
~%BG1_BEFORE_TRANSITION%
InParty(Myself)
CombatCounter(0) !See([ENEMY]) 
InParty("SUFINCH")
See("SUFINCH") See(Player1)
!StateCheck("SUFINCH",CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
Global("C#BrageFinch_BG1","GLOBAL",1)~ THEN C#BrageB bragefinch2
@2 /* [Brage]I am sorry you have to deal with so much hardships for your library, Finch. I admit it wasn't on my highest priority when I first heard of it. And finding a place for it, neither. There *was* discussion as to whether the library could be housed in the less frequented rooms of the barracks, but I decided that public access to some areas would cause distractions the Guard wouldn't have the manpower to handle on top of everything else. */
DO ~SetGlobal("C#BrageFinch_BG1","GLOBAL",2)~
== BSUFINCH @3 /* [Finch]Well, I think the manor is a good place to begin. We shouldn't give people the impression the books need to be guarded - to frighten them unnecessarily wouldn't be a good start, I think. */
== C#BrageB @4 /* [Brage]That is an aspect I didn't even consider. It lessens my feelings of guilt that I ended the discussion about hosting it inside the barracks the moment I heard it. */
== BSUFINCH @5 /* [Finch]Oh, don't you worry. I didn't mean to stir any trouble with my library, or cause any inconveniences. Well... maybe Lord and Lady Fenric have a different opinion about that, but - let us conentrate on finding worthy books before worrying about it! */
EXIT

/* Nashkel: A Folk History "SUFBOOK4" OR "SUFBOOK5" ("library books") */
/* Brage - Finch 3 */
CHAIN
IF 
~%BG1_BEFORE_TRANSITION%
InParty(Myself)
CombatCounter(0) !See([ENEMY]) 
InParty("SUFINCH")
See("SUFINCH") See(Player1)
!StateCheck("SUFINCH",CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
OR(2) PartyHasItem("SUFBOOK4") PartyHasItem("SUFBOOK5")
Global("C#BrageFinch_BG1","GLOBAL",2)~ THEN C#BrageB bragefinch3
@10 /* [Brage]"Nashkel: A Folk History" - that's a neat summary of the earlier history of the town. I guess I can call myself lucky it wasn't written recently, or I would probably find mentionings of my doings in there... */
DO ~SetGlobal("C#BrageFinch_BG1","GLOBAL",3)~
== BSUFINCH @11 /* [Finch]Yes, the minority of people realize that the dream of being mentioned in history books is rarely because of great deeds, but rather because of great mishaps that lead to destruction... Or some do, and that is when misery is born. */
== C#BrageB @12 /* [Brage]I definitely never wanted to be mentioned in any history records. */
== BSUFINCH @13 /* [Finch]Oh, of course not. You and I, we know that it means a life full of hardship, hard decisions, and sacrifice. But it is great to watch someone leading a life that has potential for it - and I will make sure the world will know of <CHARNAME>'s adventures and accomplishments! */
EXIT

/* Brage - Finch 4 */
CHAIN
IF WEIGHT #-1
~%BG1_BEFORE_TRANSITION%
InParty("C#Brage")
CombatCounter(0) !See([ENEMY]) 
InParty("SUFINCH")
See("C#Brage") See(Player1)
!StateCheck("SUFINCH",CD_STATE_NOTVALID)
!StateCheck("C#Brage",CD_STATE_NOTVALID)
Global("C#BrageFinch_BG1","GLOBAL",3)~ THEN BSUFINCH bragefinch4
@14 /* [Finch]Brage, I can't guarantee you there won't be transcripts of what happened with you and the sword evetually, though... */
DO ~SetGlobal("C#BrageFinch_BG1","GLOBAL",4)~
== C#BrageB @15 /* [Brage]Of course. And it will be for the better that these schemes to weaken the Guard will be remembered accordingly. It is just my petty pride that hopes it will not be all I will be remembered by. But like you already said - making an impression on history goes fastest by causing misery... The pen is mightier than the sword, like you so well put it, since it defines how the coming generations will look at us and our deeds. */
== BSUFINCH @16 /* [Finch]Well, I *think* I know who will be the librarian of the Nashkel Library, yes? I will put in a good word with her to make sure you will be remembered as the skillful commander and loving husband and father who was tricked by evil and dark magic! */
== C#BrageB @17 /* [Brage]I... I thank you dearly, Finch. This is the first time I am thankful to hear that someone wants to write about my story. */
== BSUFINCH @18 /* [Finch]Only too gladly! Can I ask you a question or two to how it all happened, then? */
== C#BrageB @19 /* [Brage]I... I will answer your questions gladly, Finch. Just give me a little bit more time to come to terms with my role in what happened. */
== BSUFINCH @20 /* [Finch]Of course, if time allows and you are ready, I will be, too, quill and ink in hand! */
== C#BrageB @21 /* [Brage]...And this prospect makes me sweat more than any violent confrontation I ever had to face. You are right that the pen is mightier than the sword, indeed! */
EXIT