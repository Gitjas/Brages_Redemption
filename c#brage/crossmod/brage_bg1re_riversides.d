/* crossmod bg1re - The Honest Lies of Two Riversides */


CHAIN
IF 
~InParty(Myself)
CombatCounter(0) !See([ENEMY]) 
See(Player1)
!StateCheck(Player1,CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
Global("RE1_RiverGhostQuest","GLOBAL",4)
Global("C#BE_RE#GHON2_119","GLOBAL",0)~ THEN c#brageB gnollfeast_done
@29 /* ~I heard you freed Nashkel from the ghosts that lingered near the bridge.~ */
DO ~SetGlobal("C#BE_RE#GHON2_119","GLOBAL",1)~ 
= @30 /* ~To learn that it was unhappy lovers who came to their deaths here seems heart breaking. Not that I could judge how much a ghost can feel suffering, but it was surely a good deed to put them to rest. The Guard had calls repeatedly because of them. The inn keeper might be the only one who will miss the extra coins from occasional curious tourists attracted by the tale of roaming ghosts, but apart from that, I assume Naskel's citizens are grateful the spook is gone.~ */
EXIT

I_C_T ~RE#GHON2~ %RE#GHON2_119% C#BE_RE#GHON2_119
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @30 /* ~To learn that it was unhappy lovers who came to their deaths here seems heart breaking. Not that I could judge how much a ghost can feel suffering, but it was surely a good deed to put them to rest. The Guard had calls repeatedly because of them. The inn keeper might be the only one who will miss the extra coins from occasional curious tourists attracted by the tale of roaming ghosts, but apart from that, I assume Naskel's citizens are grateful the spook is gone.~ */
END