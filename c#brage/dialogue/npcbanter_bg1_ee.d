/* Brage - Neera 1 */
CHAIN
IF 
~%BG1_BEFORE_TRANSITION%
InParty(Myself)
CombatCounter(0) !See([ENEMY]) 
InParty("Neera")
See("Neera") See(Player1)
!StateCheck("Neera",CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
Global("C#BrageNeera_BG1","GLOBAL",0)~ THEN C#BrageB brageneera1
@153 /* ~[Brage]Neera, I wished you wouldn't practice magic the way you do.~ */ DO ~SetGlobal("C#BrageNeera_BG1","GLOBAL",1)~
== BNeera @135 /* ~[Neera]What, you mean I should stop doing wild surges? You know I don't have a choice!~ */
== c#brageB @136 /* ~[Brage]I know that. I meant the way you are using it.~ */
== BNeera @137 /* ~[Neera]Oh, you want me to stop using magic altogether? Just because it is unreliable at times? You are master of your sword, and yet you do not always hit like you intend to.~ */
== c#brageB @138 /* ~[Brage]That is not a good comparison, and you know it. If we were to compare this, it would mean that my weapon would turn into something else uncontrollably.~ */
== BNeera @139 /* ~[Neera]Well, we all know you *had* such a sword, so don't talk so highty-mighty about my magic.~ */
== c#brageB @140 /* ~[Brage]That-that is *exactly* the reason why I do! You would justify your unreliable magic with the tragedy that destroyed my whole life forever? *This* would be your justification why you'd have the right to go on casting your unreliable magic the way you do? You don't need a cursed item to leash havoc onto the ones dear to you!~ */
== BNeera @141 /* ~[Neera]I... I am sorry, it was a bad comparison. What I meant was, no one is perfect. We all do mistakes...~ */
== c#brageB @142 /* ~[Brage]"Mistakes", yes. I guess it's to be expected you would phrase it that way. I'm not suggesting you stop using magic altogether, Neera, but I see you can't understand what I was pointing at, which proves my point only the stronger.~ */
EXIT

/* Brage - Neera 2 */
CHAIN
IF WEIGHT #-1
~%BG1_BEFORE_TRANSITION%
InParty(Myself)
CombatCounter(0) !See([ENEMY]) 
InParty("Neera")
See("Neera") See(Player1)
!StateCheck("Neera",CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
Global("C#BrageNeera_BG1","GLOBAL",1)~ THEN BNeera brageneera2
@143 /* ~[Neera]Brage, if you are not suggesting that I should stop using magic, and are aware of the fact that I can't prevent the wild surges - what were you suggesting, then?~ */ DO ~SetGlobal("C#BrageNeera_BG1","GLOBAL",2)~
== BNeera IF ~Kit(Player1,WILDMAGE)~ THEN @144 /* ~[Neera]And you never told <CHARNAME> to stop, either!~ */
== c#brageB IF ~Kit(Player1,WILDMAGE)~ THEN @145 /* ~[Brage]I trust <CHARNAME> with <PRO_HISHER> magic more than you.~ */
== BNeera IF ~Kit(Player1,WILDMAGE)~ THEN @146 /* ~What, you think <PRO_HISHER> magic would be more reliable than mine? That's rediculous.~ */
== c#brageB IF ~Kit(Player1,WILDMAGE)~ THEN @147 /* ~[Brage]No, but I believe that <CHARNAME> is capable of taking responsibility, a trait that I do not see as much developped in you.~ */
== c#brageB @148 /* ~[Brage]I wished you would use your magic more *reasonably*. I see a certain... recklessness in your ways I do not approve of.~ */
== BNeera @149 /* ~[Neera]Recklessness, eh? If you fear my magic that much, why not ask <CHARNAME> to get rid of me?~ */
== c#brageB @150 /* ~[Brage]I am talking to you directly. Leaving you behind might help us, but not the next in your path. I rather have you near, so I can convince you to be more reasonable.~ */
== BNeera @151 /* ~[Neera]Do you hear yourself talking? That's as if *I*'d say that I would watch over you so you'd never take up a cursed sword again!~ */
== c#brageB @152 /* ~[Brage]And I would sincerely thank you if you would, Neera. Don't you see? You used this example with the intend to let it sound like a mockery, oblivious to its real meaning. You still have a long way to go before you'll see my point, I wager. I clearly hope it will not be a tragedy that will open your eyes.~ */
EXIT



