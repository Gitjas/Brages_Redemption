/*bg1ub vial:
 TAEROM
@23   = ~Ah, excellent. But it is beyond my abilities to examine this. Take it to Thalantyr; he should have no trouble in discerning its properties. In the meantime, I will see what I can do to counteract the properties of this ore. I should be able to reduce the effects of the compound.~

@26   = ~There is only so much I can do. If you are able to find a sample of the poison, take it to Thalantyr; he should have no trouble in discerning its properties. In the meantime, I will see what I can do to counteract the properties of this ore. I should be able to reduce the effects of the compound.~
*/


I_C_T TAEROM %taerom_bg1ub_vial_23% C#BE_TAEROM_bg1ub
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @0 /* ~Nashkel is in your debt, Master Taerom. Although the ore is needed everywhere, it *is* a mine on Amnish soil. I cannot thank you enough for looking into solving this and giving no heed to the tension between Amn and the Sword Coast.~ */
== TAEROM IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @1 /* This problem goes far beyond national borders. The brittle ore also affects my profession to a not insignificant degree.~ */
END

I_C_T TAEROM %taerom_bg1ub_vial_26% C#BE_TAEROM_bg1ub
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @0 /* ~Nashkel is in your debt, Master Taerom. Although the ore is needed everywhere, it *is* a mine on Amnish soil. I cannot thank you enough for looking into solving this and giving no heed to the tension between Amn and the Sword Coast.~ */
== TAEROM IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @1 /* This problem goes far beyond national borders. The brittle ore also affects my profession to a not insignificant degree.~ */
END


/* THALAN
@30   = ~A remarkable compound. It must have taken a skilled alchemist to concoct this. I may be able to formulate an antidote to salvage some of the current iron stocks, although I doubt it will be sufficient to resolve the crisis. Leave it with me, and I will contact Taerom if I have any success.~
*/

I_C_T THALAN %thalan_bg1ub_vial_30% C#BE_THALAN_bg1ub
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @2 /* ~As the former commander of Nashkel I thank you deeply for looking into this, Master Thalantyr.~ */
== THALAN IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @3 /* ~I have some interest in seeing this problem solved myself. If only to stop the increase in not only adventurers but also ordinary people looking for magic-enhanced equipment on my doorstep.~ */
END
