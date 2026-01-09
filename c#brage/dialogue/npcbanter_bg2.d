/* banter and randomly triggered dialogues with PC */

/* Anomen */

CHAIN
IF WEIGHT #-1
~%IT_IS_BG2%
!%IT_IS_TOB%
!StateCheck(Myself,CD_STATE_NOTVALID)
InParty(Myself)
CombatCounter(0)
!See([ENEMY])
InParty("C#Brage")
See("C#Brage")
!StateCheck("C#Brage",CD_STATE_NOTVALID)
Global("C#BE_BrageAnomenBG2","GLOBAL",0)
Global("AnomenIsNotKnight","GLOBAL",0)~ THEN ~BANOMEN~ brage_anomen
~Brage, I... did not know you need the gold for paying to widows and supporting families.~ DO ~SetGlobal("C#BE_BrageAnomenBG2","GLOBAL",1)~ 
== C#BrageB ~It's nothing I'd go around telling freely, Anomen.~
== BANOMEN ~You were always the mercenary asking for more and more gold. "Grubby Brage", the squires would mockingly call you behind your back.~
== C#BrageB ~It's not a reputation I am proud of, but I would rather the people see me as greedy than promote myself as a saint, because I am none.~
== BANOMEN ~There is always more to a person than meets the eye.~
== C#BrageB ~There definitely is, Anomen, and it is true for everyone.~
EXIT


CHAIN
IF WEIGHT #-1
~%IT_IS_BG2%
!%IT_IS_TOB%
!StateCheck(Myself,CD_STATE_NOTVALID)
InParty(Myself)
CombatCounter(0)
!See([ENEMY])
InParty("C#Brage")
See("C#Brage")
!StateCheck("C#Brage",CD_STATE_NOTVALID)
Global("C#BE_BrageAnomenBG2","GLOBAL",0)
!Global("AnomenIsNotKnight","GLOBAL",0)~ THEN ~BANOMEN~ brage_anomen_nk
~So, Brage, you spend your rewards and gold for paying to widows and supporting families.~ DO ~SetGlobal("C#BE_BrageAnomenBG2","GLOBAL",1)~ 
== C#BrageB ~It's nothing I'd go around telling freely, Anomen.~
== BANOMEN ~You were always the mercenary asking for more and more gold. "Grubby Brage", the squires would mockingly call you behind your back.~
== C#BrageB ~It's not a reputation I am proud of, but I would rather the people see me as greedy than promote myself as a saint, because I am none.~
== BANOMEN ~Pfeh, indeed. I would call it stupid, Brage. It's been a long time. You shouldn't make yourself slave to others' needs.~
== C#BrageB ~It was a long time, indeed, and one without a bread-earner for most of the families. Call it what you want, but I know it is not stupid to care for people in need, Anomen.~
EXIT


/* Anomen romance reaction */

CHAIN
IF WEIGHT #-1
~%IT_IS_BG2%
!%IT_IS_TOB%
!StateCheck(Myself,CD_STATE_NOTVALID)
InParty(Myself)
CombatCounter(0)
!See([ENEMY])
InParty(Myself)
See(Myself)
!StateCheck(Myself,CD_STATE_NOTVALID)
!StateCheck(Player1,CD_STATE_NOTVALID)
Global("AnomenRomanceActive","Global",1)
Global("C#BE_BrageAnomenRomance","GLOBAL",0)~ THEN C#BrageB anomenromance_reaction
~<CHARNAME>, I could not help but notice that Anomen is courting you.~
DO ~SetGlobal("C#BE_BrageAnomenRomance","GLOBAL",1)~ 
END
++ ~Yes, I noticed, too.~ + anomenromance_reaction_02
++ ~What of it?~ + anomenromance_reaction_02
++ ~Jealous?~ + anomenromance_reaction_01
++ ~...Which would be none of your business, Brage.~ + anomenromance_reaction_02

APPEND C#BrageB 
IF ~~ THEN anomenromance_reaction_01
SAY ~No, jealousy is not the reason I speak of it.~
IF ~~ THEN + anomenromance_reaction_02
END

IF ~~ THEN anomenromance_reaction_02
SAY ~Anomen is a good man, <CHARNAME>. His heart is at the right place. But fate was not always kind to him. He bears wounds to his soul he tries to cover with great words, heroic deeds, and more tales about those.~
= ~He sounds all full of himself, and yet, he needs... a strong leader. And, most of all, a supporting woman. One who is willing to be there for him. Do not play with him, I beg of you.~
++ ~I have no intention to.~ + anomenromance_reaction_04
++ ~I am honestly intrigued to get to know him better.~ + anomenromance_reaction_04
++ ~Fine, I heard you.~ + anomenromance_reaction_03
++ ~I really think that this is no business of yours, Brage.~ + anomenromance_reaction_03
END

IF ~~ THEN anomenromance_reaction_03
SAY ~You are both adults, I will not interfere. I spoke up - this once.~
IF ~~ THEN EXIT
END

IF ~~ THEN anomenromance_reaction_04
SAY ~You are both adults and I will respect the decision of you both. Still, I feel... protective, even if Anomen himself would reject my sentiment fiercely. I thank you. I will not speak of it again.~
IF ~~ THEN EXIT
END


END //APPEND


/* more banter */

/* Nalia */
CHAIN
IF WEIGHT #-1
~%IT_IS_BG2%
!%IT_IS_TOB%
InParty(Myself)
CombatCounter(0)
!See([ENEMY])
InParty("nalia")
See("nalia")
!StateCheck("nalia",CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
Global("C#BE_NaliaCondolences","GLOBAL",1)~ THEN ~C#BrageB~ bragenalia_df
~Lady Nalia, it grieves me to hear about the death of your father and how it came to pass.~
DO ~SetGlobal("C#BE_NaliaCondolences","GLOBAL",2)~
== BNALIA ~I... I thank you, Brage. Life goes on, I guess. He had to pass eventually and will live on in our hearts - all those sayings that are meant to make us feel better, but it doesn't really work.~
== C#BrageB ~You did what you could, Nalia. Never let yourself think otherwise.~
== BNALIA ~Well... I was too late...~
== C#BrageB ~No, Nalia! Don't go there. You did what you could!~
EXIT


CHAIN
IF WEIGHT #-1
~%IT_IS_BG2%
!%IT_IS_TOB%
InParty(Myself)
CombatCounter(0)
!See([ENEMY])
InParty("C#Brage")
See("C#Brage")
!StateCheck("C#Brage",CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
Global("C#BE_NaliaCondolences","GLOBAL",2)~ THEN ~BNALIA~ bragenalia_df_2
~You are right, Brage. I did what I could to save the keep... save my father. It was not me who was too late. It was *them*. I begged, and begged... but noone would listen! No one would help me, not even if promised a reward.~
DO ~SetGlobal("C#BE_NaliaCondolences","GLOBAL",3)~
== C#BrageB ~No one but <CHARNAME>.~
== BNALIA ~Yes, but <PRO_HESHE> was too late! I mean... I met <PRO_HIMHER> so late. If the others would have...~
== C#BrageB ~Lady Nalia, I have full understanding for your rage and sorrow. Believe me, I do... But it is not those people's fault your father died.~
== BNALIA ~But if they would have...~
== C#BrageB ~Nalia, it is not *their* fault! It is good that you are angry. It is an important step for your wounds to heal. And it is a blessing that you are not angry at yourself. But focus on who is really responsible for what happened. Was it the drunkards and ruffians in the Copper Coronet?~
== BNALIA ~Well... no, of course not. But *if* someone would have come sooner, maybe my father could have been saved...~
== C#BrageB ~Maybe, Nalia. Maybe.~
EXIT




CHAIN
IF WEIGHT #-1
~%IT_IS_BG2%
!%IT_IS_TOB%
InParty(Myself)
CombatCounter(0)
!See([ENEMY])
InParty("nalia")
See("nalia")
!StateCheck("nalia",CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
Global("C#BE_BrageNalia","GLOBAL",0)
OR(2)
Global("C#BE_NaliaCondolences","GLOBAL",0)
GlobalGT("C#BE_NaliaCondolences","GLOBAL",1)~ THEN ~C#BrageB~ bragenalia
~Lady Nalia, to know about the troubles in your families' keep grieves me.~
DO ~SetGlobal("C#BE_BrageNalia","GLOBAL",1)~
= ~With no intention of being foreward, but what were your reasons not to come to the temples for help?~
== BNALIA ~Thank you, Brage. Well, the temples are not known for their great force of warriors.~
== C#BrageB ~That... might be true.~
== BNALIA ~Also, the temples usually expect... donations for their help, and I didn't have much on me.~
== C#BrageB ~It urges me to object to your words and the meaning they carry, but I fear there is more truth to them than I would like.~
= ~I, too, would have asked about the height of the reward first...~
== BNALIA ~Yes, but you are not a man of faith in the service of his god. You have your reasons.~
== C#BrageB ~Even men of faith need to sleep and eat, though.~
== BNALIA ~Yes, I *know* that. Still, I didn't expect to find the help I needed from the temples. That's the reason. Would I have known you were there, maybe I would have tried it, first.~
== C#BrageB ~I thank you for your vote of confidence. I have to admit I was thinking about me and my willingness to help you, but for this cause I wouldn't have been enough on my own. It is a good thing you went to the Copper Coronet and found <CHARNAME>.~
EXIT

CHAIN
IF WEIGHT #-1
~%IT_IS_BG2%
!%IT_IS_TOB%
InParty(Myself)
CombatCounter(0)
!See([ENEMY])
InParty("nalia")
See("nalia")
!StateCheck("nalia",CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
Global("C#BE_BrageNalia","GLOBAL",1)
Dead("Torgal")~ THEN ~C#BrageB~ bragenalia
~Nalia, you should be careful... We are quite similar, you and I. Don't do the same mistakes I did.~
DO ~SetGlobal("C#BE_BrageNalia","GLOBAL",2)~
== BNALIA ~I would be alike to you? I am surprised to hear you say this. Weren't you a Captain of the Amnish forces, serving your country, leading a batallion of soldiers to protect the town you were stationed? Until you took up a cursed sword and ended it all.~
== BNALIA ~I am sorry. I didn't mean...~
== C#BrageB ~These deeds of mine are a fact. But it is not what I was referring to. Or maybe it was... I'll elaborate on my thought on another day.~
== BNALIA ~Brage, I am truly sorry. I shouldn't have... put it that way.~
== C#BrageB ~Do not worry, Nalia. We are good.~
EXIT



/* Anomen */

CHAIN
IF WEIGHT #-1
~%IT_IS_BG2%
!%IT_IS_TOB%
!StateCheck(Myself,CD_STATE_NOTVALID)
InParty(Myself)
CombatCounter(0)
!See([ENEMY])
InParty("C#Brage")
See("C#Brage")
!StateCheck("C#Brage",CD_STATE_NOTVALID)
Global("C#BE_BrageAnomenBG2","GLOBAL",1)~ THEN ~BANOMEN~ brage_anomen_2
~So, Brage - you killed soldiers of the Amnish forces due to a cursed sword.~ DO ~SetGlobal("C#BE_BrageAnomenBG2","GLOBAL",2)~ 
== C#BrageB ~Yes, that is what I did. The sword was tricked into my hands to weaken the Nashkel forces during the times of the iron crisis at the Sword Coast.~
== BANOMEN IF ~Global("AnomenIsNotKnight","GLOBAL",0)~ THEN ~Cursed be those evil culprits. Their plotting and scheming always leads to innocent people suffering!~
== C#BrageB IF ~Global("AnomenIsNotKnight","GLOBAL",0)~ THEN ~Suffer... and die...~
== BANOMEN IF ~Global("AnomenIsNotKnight","GLOBAL",0)~ THEN ~There... is more than the killed soldiers?~
== C#BrageB IF ~Global("AnomenIsNotKnight","GLOBAL",0)~ THEN ~(inhales audibly) Yes, Anomen, there is. My family... was near me when I wielded that sword, as well...~
== BANOMEN IF ~Global("AnomenIsNotKnight","GLOBAL",0)~ THEN ~I had no idea, Brage. I am truly sorry for your loss.~

== BANOMEN IF ~!Global("AnomenIsNotKnight","GLOBAL",0)~ THEN ~Seemed like a plan that worked, then.~
== C#BrageB IF ~!Global("AnomenIsNotKnight","GLOBAL",0)~ THEN ~(inhales audibly) Yes, Anomen, it "worked". Do you want me to elaborate on the details so you could use this tactic yourself one day?~
== BANOMEN IF ~!Global("AnomenIsNotKnight","GLOBAL",0)~ THEN ~(grins) That sounds great, but something tells me you won't, for some reason.~
EXIT


/* Nalia */
CHAIN
IF WEIGHT #-1
~%IT_IS_BG2%
!%IT_IS_TOB%
InParty(Myself)
CombatCounter(0)
!See([ENEMY])
InParty("nalia")
See("nalia")
!StateCheck("nalia",CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
Global("C#BE_BrageNalia","GLOBAL",2)
Dead("Torgal")~ THEN ~C#BrageB~ bragenalia
~Nalia, when recently we spoke, here is what I meant.~
DO ~SetGlobal("C#BE_BrageNalia","GLOBAL",3)~
= ~I was blinded by my own prowess and powers, by my believe to be a force of law. I lost sight of what one man can do and achieve - realistically. I wanted to serve, I wanted to protect... but at the same time, I behaved like a megalomaniac in my own power. I looked down at people, Nalia, because I knew they wouldn't do as much good as I would, because they *couldn't* do as much good as I did.~
= ~I see the same pattern in you, Nalia. Do not lose sight of your own faults, of your limits as a mortal, your own smallness in the face of the gods. Do not belittle the people you want to help. They are not beneath you. They are even to you - maybe some of them even greater than you will ever be able to become, regardless of the profane lives they are living.~
== BNALIA ~I would belittle people?! Am I not giving up the safety and comfort of the keep to help them? Do I not give up on my title to be here, on the streets, fighting evil for them?~
== C#BrageB ~Oh, Nalia... And do you not expect their gratitude for it? Their worship, even? Do you not catch yourself with the thought that they cannot help themselves if you will not do it for them? That they cannot make the right decisions on their own but need your help for it, because it is your "destiny" to help them... even against their will, against their esplicit wishes because you would know better than them - better than the people themselves for whos lives you are making decisions for? Because you would know better what is good for them - because you would be the one *deciding* what is good?~
== C#BrageB ~Don't answer right away, my young friend. It is harsh accusations I am aiming at you. You have every right to scold me for them. But I see the pattern... I see the same pattern I lived by when I was your age, Nalia. You are young still, and I don't want you to fall into the same trap life laid out for people like us.~
= ~I spoke as a friend, Nalia, even if it might be hard to see at first glance.~
EXIT
