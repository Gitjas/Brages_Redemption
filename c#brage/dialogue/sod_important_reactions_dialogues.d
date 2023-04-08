
APPEND c#brageJ

/* 1. Hephernaan's own plans */

/* 1.1 General reaction to Hephernaan is betraying Caelar: knowledge gained BEFORE the portal scene at Dragonspear basement; PC does NOT know that he is working for a fiend yet. */
IF ~Global("C#Brage_HephernaanBetrayal","GLOBAL",1)~ THEN hephernaan_betraying_caelar
SAY @400 /* The evidence is growing that Hephernaan is deceiving Caelar? He supported her to form an army for a noble goal, but has own plans on how to use them? My gut tells me this will take a sinister turn. It is fortunate the coalition is already here to face them. */
IF ~~ THEN DO ~SetGlobal("C#Brage_HephernaanBetrayal","GLOBAL",2) SetGlobal("C#RtD_HephernaanBetrayal_SET","GLOBAL",2) SetGlobal("C#RtD_VariableEvaluation","GLOBAL",1)~ EXIT
END

/* 1.2 A General reaction to the knowledge that Hephernaan is working for a fiend: knowledge gained BEFORE the portal scene at Dragonspear basement */
/* Brage knew about Hephernaan betraying C. */
IF ~Global("C#Brage_HephernaanFiend","GLOBAL",1)
GlobalLT("bd_plot","global",485) //before the portal is opened 
Global("C#Brage_HephernaanBetrayal","GLOBAL",2) 
~ THEN hephernaan_working_for_fiend
SAY @401 /* Hephernaan would be in league with a fiend master - and here I was, thinking he wanted to use the crusaders to compensate his own power hunger. Now, I am not sure why he helped Caelar form an army, but I see clearly that the real threat of this crusade would be Hephernaan's influence. What would make a man do such a thing? */
++ @414 /* I also don't see why he would help her form an army who will be there to "greet" his master.~ */ + hephernaan_working_for_fiend_06
COPY_TRANS_LATE C#BrageJ hephernaan_working_for_fiend_06
END

/* 1.2 B General reaction to the knowledge that Hephernaan is working for a fiend: knowledge gained BEFORE the portal scene at Dragonspear basement */
/* Did not know about Hephernaan betraying C. */
IF ~Global("C#Brage_HephernaanFiend","GLOBAL",1)
GlobalLT("bd_plot","global",485) //before the portal is opened 
Global("C#Brage_HephernaanBetrayal","GLOBAL",0) 
~ THEN hephernaan_working_for_fiend_00
SAY @466 /* Hephernaan would be in league with a fiend master - and here I was, thinking Caelar was our main foe, the one we need to pursuade to see beyond her noble goal to what the crusade really became. I am not sure why he helped Caelar form an army, but I see clearly that the real threat of this crusade would be Hephernaan's influence. What would make a man do such a thing? */
++ @414 /* I also don't see why he would help her form an army who will be there to "greet" his master.~ */ + hephernaan_working_for_fiend_06
COPY_TRANS_LATE C#BrageJ hephernaan_working_for_fiend_06
END

IF ~~ THEN hephernaan_working_for_fiend_01
SAY @412 /* It is always good to know your foe, to be able to better assess them.~ */ 
IF ~~ THEN + hephernaan_working_for_fiend_05
END

IF ~~ THEN hephernaan_working_for_fiend_02
SAY @409 /* The old and never disappearing theme. */
IF ~~ THEN + hephernaan_working_for_fiend_05
END

IF ~~ THEN hephernaan_working_for_fiend_03
SAY @410 /* I doubt he could be such a good advisor, had he to fight a Geas for every decision. */
IF ~~ THEN + hephernaan_working_for_fiend_05
END

IF ~~ THEN hephernaan_working_for_fiend_04
SAY @411 /* We have to assume she doesn't. It contradicts all she is openly working for. */
IF ~~ THEN + hephernaan_working_for_fiend_05
END

IF ~~ THEN hephernaan_working_for_fiend_05
SAY @408 /* I never understood loyalty to masters who could turn on you just as easily, no matter the promised personal gain. I guess we will not learn about his motives in time. All is left to us is trying to stop Caelar and her crusade before they ignorantly help a fined master to cross planes - speaking the words alone makes me shiver. */
IF ~~ THEN DO ~SetGlobal("C#Brage_HephernaanFiend","GLOBAL",2)~ EXIT
END

IF ~~ THEN hephernaan_working_for_fiend_06
SAY @424 /* The implication sends shivers down my back, because it could be that his master isn't afraid of them - of us, at least not once there is a way to cross planes. But there is none *yet*, so we are safe - at least now. And yet he is working on helping this fiend, for whatever reasons.~ */ 
++ @403 /* Being hungry for power or - "insert any other desirable goal here". */ + hephernaan_working_for_fiend_02
++ @404 /* Maybe he is being brainwashed, or under the influence of a Geas. */ + hephernaan_working_for_fiend_03
++ @405 /* Do we really care what his motives are? This is a catastrophy - it makes a confrontation not only with fiends but with a *lot* of fiends very possible. */ + hephernaan_working_for_fiend_01
++ @406 /* And Caelar doesn't seem to suspect a thing with regard to her 'right hand' Hephernaan. */ + hephernaan_working_for_fiend_04
++ @402 /* Honestly, I don't care.~ */ + hephernaan_working_for_fiend_05
++ @407 /* Let's move on. */ + hephernaan_working_for_fiend_05
END

/* General reaction to the knowledge that Caelar's ulterior motive was to free her uncle BEFORE meeting Aun. */
IF ~Global("C#Brage_AllForAun","GLOBAL",2) 
GlobalLT("bd_plot","global",485)~ THEN all_for_aun
SAY @413 /* Caelar... she would be doing all this to free her uncle's soul - her uncle himself - from the grasps of Avernus. Where he came due to her foolishness... I... understand her, <CHARNAME>. */
++ @416 /* Yes, I know what you mean. I do, too, in a way. */ + all_for_aun_05
++ @417 /* Of course you feel sympathy for her situation, Brage. It's too alike to yours. */ + all_for_aun_02
++ @418 /* You mean purely theoretically, yes? I surely hope you are not switching sides here just because you feel sympathy. */ + all_for_aun_02
++ @415 /* You feel sympathy for a warlady that destroyed villages and drove countless people into flight?~ */ + all_for_aun_05
+ ~GlobalGT("C#BE_BrageTalksRes","GLOBAL",8)~ + @468 /* ~You said yourself a while back that there is no justification to try to get a loved one back, if the cost is too high!~ */ + all_for_aun_07
++ @420 /* No, I don't. This whole crusade is the wrong means, it causes too much destruction to justify saving anyone. */ + all_for_aun_04
++ @421 /* I don't want to talk about this. */ DO ~SetGlobal("C#Brage_AllForAun","GLOBAL",3)~ + all_for_aun_06
END

IF ~~ THEN all_for_aun_02
SAY @422 /* It is. And yet it is different.~ */
IF ~~ THEN + all_for_aun_05
END

IF ~~ THEN all_for_aun_03
SAY @423 /* I understand so well why she does it that I wonder why she didn't tell her followers. Why doesn't she tell the people that she is mourning a loved one lost in Avernus, too? A good leader knows when to unite a crowd by the appearance of being "one of them". She has just as much motivation to get to the souls in Avernus than any of her followers who march to free a lost relative. She might make use of their more recent pain to form her army, but they are united in their grieve.~ */
IF ~~ THEN DO ~SetGlobal("C#Brage_AllForAun","GLOBAL",3)~ EXIT
END

IF ~~ THEN all_for_aun_04
SAY @429 /* Maybe. */
IF ~~ THEN + all_for_aun_05
END

IF ~~ THEN all_for_aun_05
SAY @419 /* ~Her situation is... more dire than mine ever was. I am not judging who would have the greater guilt - I believe this would be me. What I am referring to is that the chance of her uncle still waiting for rescue, of him *needing* rescue is imminent. ...My family might already be in Mount Celestia for all I know. */
IF ~~ THEN + all_for_aun_03
END

IF ~~ THEN all_for_aun_06
SAY @431 /* I will be quiet then. */ 
IF ~~ THEN EXIT
END

IF ~~ THEN all_for_aun_07
SAY @469 /* I did, and I mean it. But I understand her, <CHARNAME>. */
IF ~~ THEN + all_for_aun_05
END

END //APPEND

/* Interjection into Aun's dialogue in Avernus if dialogue didn't run before */

I_C_T BDAUN 28 C#Brage_AllForAun
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @426 /* ~Caelar did all this to free her uncle from the grasps of Avernus - where he came due to her foolishness... I... I understand her.~ */
END

I_C_T BDAUN 30 C#Brage_AllForAun
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @426 /* ~Caelar did all this to free her uncle from the grasps of Avernus - where he came due to her foolishness... I... I understand her.~ */
END

I_C_T BDAUN 31 C#Brage_AllForAun
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @426 /* ~Caelar did all this to free her uncle from the grasps of Avernus - where he came due to her foolishness... I... I understand her.~ */
END

I_C_T BDAUN 32 C#Brage_AllForAun
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @426 /* ~Caelar did all this to free her uncle from the grasps of Avernus - where he came due to her foolishness... I... I understand her.~ */
END

APPEND C#BrageJ 

/* 5.4 General reaction: Caelar wants to open a portal to Avernus. (No reaction to needed blood, will be extra in 7.3.) BEFORE portal scene at Dragonspear Castle */

IF ~Global("C#Brage_PortalAvernus","GLOBAL",1)~ THEN knows_avernus_portal
SAY  @435 /* ~So, that's Caelar's great plan to free the souls from Avernus - opening a portal and march her army in. She needs to go the profane way, like everyone else would - just crossing planes and fighting the fiends, man to beast. I am... appalled, <CHARNAME>. Somehow I expected... more.~ */
++ @427 /* ~What did you expect?~ */ + knows_avernus_portal_01
++ @428 /* You expected more magic, a solution that would not require fighting the fiends directly?~ */ + knows_avernus_portal_02
++ @430 /* Even a Shining Lady has no special means up her sleaves, as it seems.~ */ + knows_avernus_portal_02
++ @432 /* There is no easy way for this, or someone would already have tried.~ */ + knows_avernus_portal_03
++ @433 /* ~Were there an easy way, or a magical way that wouldn't require high man power, there wouldn't have been a reason to gather such an army.~ */ + knows_avernus_portal_04
++ @421 /* I don't want to talk about this. */ DO ~SetGlobal("C#Brage_PortalAvernus","GLOBAL",2)~ + all_for_aun_06
END

IF ~~ THEN knows_avernus_portal_01
SAY @436 /* ~Some magic to pull them out, some special conjuring, some divine ways of intervention - I am not sure. Just not *that*.~ */
IF ~~ THEN + knows_avernus_portal_02
END

IF ~~ THEN knows_avernus_portal_02
SAY @449 /* ~I feel like a fool now for even thinking such a thing.~ */
++ @451 /* ~You mean you were hoping she found some "fool proof" way that won't put so many lives at risk.~ */ + knows_avernus_portal_05
++ @452 /* ~It is indeed a naive thought.~ */ + knows_avernus_portal_05
++ @453 /* ~I understand. I was hoping she wouldn't go the most dangerous way, too.~ */ + knows_avernus_portal_05
END 

IF ~~ THEN knows_avernus_portal_03
SAY @464 /* ~The last Dragonspear War is not too long ago. She might as well have been the first one to try.~ */
IF ~~ THEN + knows_avernus_portal_02
END

IF ~~ THEN knows_avernus_portal_04
SAY @465 /* ~The army she gathered makes a lot more sense now.~ */
IF ~~ THEN + knows_avernus_portal_02
END

IF ~~ THEN knows_avernus_portal_05
SAY @467 /* ~It took alliances from several widespread authorities to win the last wars at Dragonspear Castle. Caelar thinks she can open a hellhole and fight off the fiends with one army alone!~ */
IF ~~ THEN DO ~SetGlobal("C#Brage_PortalAvernus","GLOBAL",2)~ EXIT
END


/* 6. Caelar wants the PC for something */

/* 6.2 Reaction after learning that Caelar needs the PC / PC's blood for something but does NOT know any specifics (BEFORE portal scene) */
IF ~Global("C#Brage_SoDCaelarWantsPC","GLOBAL",1)~ THEN caelar_wants_pc
SAY @470 /* It seems I was wrong about Caelar's motives to attack you, the Hero of Baldur's Gate. It was not about incapacitating you - but to get to you, personally, for a reason we do not know yet. All we can do is double - triple - our efforts to keep you safe and out of our enemies reach. */
IF ~~ THEN DO ~SetGlobal("C#Brage_SoDCaelarWantsPC","GLOBAL",2)~ EXIT
END


/* 7. Caelar needs the PC's blood to open the portal. */

/* 7.3 General reaction to the knowledge that Caelar needs the PC's blood to open the portal (BEFORE portal betrayal scene). */
/* Knowledge is gained before Hephernaan's betrayal/going to Avernus */
IF ~Global("C#Brage_PortalPCBlood","GLOBAL",1)~ THEN portal_needs_pc_blood
SAY @438 /* It seems I was wrong about Caelar's motives to attack you, the Hero of Baldur's Gate. It was not about incapacitating you - but to get to you, personally, for a reason crucial to her plan.~ */
= @437 /* These power hungry, melagomaniac people, going for whoever they want, to use them as pawns in their own game, making them miserable just because they believe it to be a step in their own chase for whatever goal they are aiming at! I cannot put in words the disgust I am feeling. */
++ @439 /* This reminds you of what happened to you, doesn't it? */ + portal_needs_pc_blood_01
COPY_TRANS_LATE C#BrageJ portal_needs_pc_blood_01
END

IF ~~ THEN portal_needs_pc_blood_01
SAY @443 /* I guess it is that obvious. */
++ @440 /* I guess it's my fate. */ + portal_needs_pc_blood_02
++ @441 /* Not much I can do, other than fight them off I guess. */ + portal_needs_pc_blood_02
++ @442 /* There is only one person who will use my body for gaining power, and that's me! */ + portal_needs_pc_blood_03
END

IF ~~ THEN portal_needs_pc_blood_02
SAY @444 /* I fear so, my friend. */
IF ~~ THEN + portal_needs_pc_blood_04
END

IF ~~ THEN portal_needs_pc_blood_03
SAY @445 /* As is your right. */
IF ~~ THEN + portal_needs_pc_blood_04
END

IF ~~ THEN portal_needs_pc_blood_04
SAY @446 /* Of course I... thought about what happened to me. But the difference is - I am out of these "games" now, I lost my status as a commander and with it any importance in a struggle for power. You, on the other hand, will never lose your heritage. Rather, you will become even more powerful, attracting more and more of these scavengers. I am... sorry, <CHARNAME>, for the gods bestowed upon you such a stony path. */
IF ~~ THEN DO ~SetGlobal("C#Brage_PortalPCBlood","GLOBAL",2)~ EXIT
END
END //APPEND

/* 9. Reaction to betrayal at the portal */

I_C_T3 BDHEPHER 16 C#Brage_SoDPortalScene
/* 9.A. PC didn't suspect anything about Hephernaan's plans */
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)
Global("C#RtD_HephernaanBetrayal","GLOBAL",0)
Global("C#RtD_HephernaanFiend","GLOBAL",0)~ THEN @447 /* The portal to Avernus is open - and Hephernaan in league with a fiend master. May the gods help us! */
/* 9.B PC knew about Hephernaan's own plans before */
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)
OR(2)
	GlobalGT("C#RtD_HephernaanBetrayal","GLOBAL",0)
	GlobalGT("C#RtD_HephernaanFiend","GLOBAL",0)~ THEN @448 /* ~Hephernaan's scheme unfolds - despite our efforts to stop him. The portal to Avernus is open! May the gods help us. */
END

APPEND C#BrageJ 

/* 4. Incident at Boareskyr Bridge. */

/* after Bhaal sign incident at bridge */
IF ~Global("C#Brage_SoDBoareskyrBridgeScene","GLOBAL",1)
Global("C#BE_c#stff24_10","GLOBAL",0)~ THEN bhaal_bridge
SAY @450 /* [Brage]Whatever that was, it was frightening as hell. I hope you are alright, <CHARNAME>! */
IF ~~ THEN DO ~SetGlobal("C#Brage_SoDBoareskyrBridgeScene","GLOBAL",2)~ EXIT
END

IF ~Global("C#Brage_SoDBoareskyrBridgeScene","GLOBAL",3)
Global("C#BE_c#stff24_10","GLOBAL",1)~ THEN bhaal_bridge_00
SAY @455 /* After Sarevok and the havoc he caused, having the Bhaal sign appear around you, literally *claiming* you as Bhaal's child probably frightened a lot of people. */
++ @456 /* Yes, I think so, too. This is probably bad. */ + bhaal_bridge_02
++ @457 /* You don't say! */ + bhaal_bridge_02
++ @458 /* I *know*, Brage. What am I to do to change that? */ + bhaal_bridge_02
++ @459 /* That's good. They should be frightened. */ + bhaal_bridge_01
++ @460 /* Whatever. Let's move on. */ + bhaal_bridge_03
END

IF ~~ THEN bhaal_bridge_01
SAY @461 /* From fear arises objection, <CHARNAME>. It's a dangerous path to chose. */
IF ~~ THEN + bhaal_bridge_03
END

IF ~~ THEN bhaal_bridge_02
SAY @462 /* You can't change what's happened, but you can influence how people see you from now on and judge you for your actions. */
IF ~~ THEN + bhaal_bridge_03
END

IF ~~ THEN bhaal_bridge_03
SAY @463 /* All we can do is keep on defending these lands from the current threat. People will see your worth if you'll fight for them and won't be lead astray, <CHARNAME>. The people in Baldur's Gate already know you as their hero - let's add Dragonspear to it, too. */
IF ~~ THEN DO ~SetGlobal("C#Brage_SoDBoareskyrBridgeScene","GLOBAL",4)~ EXIT
END

END //APPEND