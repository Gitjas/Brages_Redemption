/* crossmod bg1re - Necromancer's trouble */

/*
@78   = ~Beth and I fell in love, she caught an incurable disease. I promised her to heal her - she died, since then I have been researching how to raise her... Raise her in good health.~
*/
I_C_T ~C#q11nec~ %C#q11nec_78% C#BE_C#q11nec_78
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @0 /* ~So you were trying... you were trying to restore your love's health like you promised. I... understand well why, man, but - did you have a look around you - what you turned your home into?!~ */
== C#q11nec IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @1 /* ~Yes, I know I concentrated my work on how to restore her - means were necessary...~ */
END


/* ~(sigh) Why not tell it. In the end it all comes down to this. I cannot do it without blood. Blood of a beloved, female, innocent creature. It has to be collected while the main magic potion is prepared... And the creature has to die while giving it.~ */
I_C_T3 ~C#q11nec~ 40 C#BE_C#q11nec_40
== C#BrageJ IF ~Global("C#BE_WASYLAR_4","GLOBAL",0)
InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @26 /* ~What are you talking, man? Life for a life? Killing a beloved to restore a beloved? This is what you get when you think you could turn around the natural order of arcane and divine magic, to grant live in flesh and blood and sane mind whithout the help of the gods! I don't know whether to laugh at you or rise my sword at such foolish thoughts! Losing a loved one - loved ones - is a hard and cruel fate. Who are you to decide which loved ones are to live and which should die?!~ */
== C#BrageJ IF ~Global("C#BE_WASYLAR_4","GLOBAL",1)
InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @27 /* ~What are you talking, man? Life for a life? Killing a beloved to restore a beloved? This is exactly what I feared when the other necromancer posed the request to bring him bodies for *his* resurrection studies! Who are you to decide which loved ones are to live and which should die?!~ */
== C#q11nec IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @28 /* ~But - but it doesn't necessarily have to be a *person*! The creature just needs to be... loved...~ */
END


/* @264  = ~You will not stay with me, will you? No, you will not. (sob) Beth, oh Beth...~ */
I_C_T ~C#q11nec~ %C#q11nec_264% C#BE_C#q11nec_264
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @25 /* ~She really was restored, but she couldn't bare the weight of how it was done. There is no easy way for us mortals to get what we want...~ */
END



/* Follow up */

CHAIN
IF WEIGHT #-1
~InParty(Myself)
CombatCounter(0) !See([ENEMY]) 
See(Player1)
!StateCheck(Player1,CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
Dead("C#q11nec")
!See("C#q11nec")
GlobalGT("C#BE_BrageTalks","GLOBAL",18) // after he went through most of his cycle
Global("C#BE_C#q11nec_78","GLOBAL",1)~ THEN C#BrageB necromancer_followup
@2 /* ~This necromancer, <CHARNAME> - the wish to bring the loved ones back to life, no matter the cost - I can relate to this man.~ */ DO ~SetGlobal("C#BE_C#q11nec_78","GLOBAL",2)~
== ~%IMOEN_BANTER%~ IF ~%BG1_BEFORE_TRANSITION% InParty("%IMOEN_DV%") See("%IMOEN_DV%")
!StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @3 /* ~[Imoen] I'm glad we are out of that hell hole. (shudders) True love is supposed to be romantic - and smell of fresh roses! Not... corpses and... yuck.~ */
== ~%AJANTIS_BANTER%~ IF ~%BG1_BEFORE_TRANSITION% InParty("Ajantis") See("Ajantis")
!StateCheck("Ajantis",CD_STATE_NOTVALID)~ THEN @4 /* ~[Ajantis] How much havoc this man created with bodies of loved ones stolen out of their graves! The rest of the dead should not be disturbed so. This man angered the natural order in more than one way.~ */
== C#BrageB @5 /* ~[Brage]His means were wrong, because you can't cheat the gods - his means were to sacrifice the exact thing he wanted to restore, move the pain to someone else... But I can relate.~ */
END
++ @6 /* ~His means were wrong, oh yes.~ */ + necromancer_followup_01
++ @7 /* ~I can relate, too. It was a harsh fate.~ */ + necromancer_followup_01
++ @8 /* ~It's unsettling how one can lose track of what one's doing the way that man did.~ */ + necromancer_followup_00
++ @9 /* ~All I saw was true devotion. A pity it wasn't meant to be.~ */ + necromancer_followup_00_1
++ @10 /* ~Well, it's over and there isn't much to say to it any more.~ */ EXIT

APPEND C#BrageB 
IF ~~ THEN necromancer_followup_00
SAY @11 /* ~Yes, it is, and it is always sad to witness.~ */
IF ~~ THEN + necromancer_followup_01
END

IF ~~ THEN necromancer_followup_00_1
SAY @24 /* ~Devotion? Yes, but it turned to madness...~ */
IF ~~ THEN + necromancer_followup_01
END

IF ~~ THEN necromancer_followup_01
SAY @12 /* ~[Brage] I... admit I hold my breath for a very little moment. Ah - the wish to have them back! Yes, I can relate to this man so much. Had I the means - had I the slightest chance of having the means to bring them back, I am not sure I wouldn't try as devastated to do so as he did.~ */
++ @13 /* ~And plaster your way with - in his case already dead but nevertheless - corpses?~ */ + necromancer_followup_03
++ @14 /* ~No, you wouldn't do it like this. You wouldn't lose sight of what is righteous like he did.~ */ + necromancer_followup_04
++ @15 /* ~Yes, it's a thin line between being ambitious and being obsessed, and you usually do not come back by yourself once you crossed it.~ */ + necromancer_followup_05
++ @16 /* ~Well, it's good you don't have the means then, isn't it.~ */ + necromancer_followup_03
++ @17 /* ~Well, there is a way using magic, and I don't see you pursue it.~ */ + necromancer_followup_02
END

IF ~~ THEN necromancer_followup_02
SAY @18 /* ~[Brage] What do you mean - collecting all the gold needed for such a resurrection instead of giving it to the living in need? If I'd do that I would be exactly how he was, <CHARNAME>!~ */
IF ~~ THEN + necromancer_followup_05
END

IF ~~ THEN necromancer_followup_03
SAY @19 /* ~[Brage] (moans) I hope by the might of the gods I will never turn into this. Not after what I did with my hands. I left a wake of corpses - and they weren't already dead.~ */
IF ~~ THEN + necromancer_followup_05
END

IF ~~ THEN necromancer_followup_04
SAY @20 /* ~[Brage] I thank you for your kind words. I surely hope so...~ */
IF ~~ THEN + necromancer_followup_05
END

IF ~~ THEN necromancer_followup_05
SAY @21 /* ~It's life's cruel irony - he wanted to give life to his love again - literally as well as figuratively, and yet all he did was surrounding himself by death and evil necromancy, hiding himself away in a cave, wasting the best years of his life...~ */
= @22 /* ~(sigh) Yes, it is easy to lose oneself if the goal is too high and the willpower to achieve it is too strong. I can relate in more than one way with this man, <CHARNAME>.~ */
= @23 /* ~I feel that this will also serve as a warning - to me. Nothing will be gained if I lose myself in my goal to compensate for the losses I created and turn to unproper means to do so... I beg the gods to help me to spend my vigor wisely so I will not do harm while trying to make up - so what I'll do will not be so *completely* for naught like what this man did.~ */
IF ~~ THEN EXIT
END
END //APPEND

