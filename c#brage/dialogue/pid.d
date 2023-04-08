/* PID */

APPEND c#brageJ

IF ~IsGabber(Player1)~ THEN pid
SAY @0
/* sod: how did you fare since we parted */
+ ~%IT_IS_SOD% Global("C#BE_SoDFarePID1","LOCALS",0)~ + @15 /* ~How did you fare since we parted?~ */ DO ~SetGlobal("C#BE_SoDFarePID1","LOCALS",1)~ + sod_how_fare
+ ~%IT_IS_SOD% Global("C#BE_SoDFarePID2","LOCALS",0)~ + @16 /* ~What brought you back to Baldur's Gate after travelling to Waterdeep?~ */ DO ~SetGlobal("C#BE_SoDFarePID2","LOCALS",1)~ + sod_back_baldurs_gate
+ ~%IT_IS_SOD% Global("C#BE_SoDFarePID3","LOCALS",0)~ + @17 /* ~What were you trying to achieve at the Sorcerous Sundries when we met?~ */ DO ~SetGlobal("C#BE_SoDFarePID3","LOCALS",1)~ + sod_back_sourcerous_sundries

+ ~%BG1_BEFORE_TRANSITION%
Global("C#BE_SwordPID","LOCALS",0)~ + @2 DO ~SetGlobal("C#BE_SwordPID","LOCALS",1)~ + sword
+ ~Global("C#BE_FamilyPID","LOCALS",0)~ + @3 DO ~SetGlobal("C#BE_FamilyPID","LOCALS",1)~ + family_01
+ ~Global("C#BE_YourselfPID","LOCALS",0)~ + @4 DO ~SetGlobal("C#BE_YourselfPID","LOCALS",1)~ + yourself
+ ~RandomNum(6,1)~ + @1 + how_01
+ ~RandomNum(6,2)~ + @1 + how_02
+ ~RandomNum(6,3)~ + @1 + how_03
+ ~RandomNum(6,4)~ + @1 + how_04
+ ~RandomNum(6,5)~ + @1 + how_05
+ ~RandomNum(6,6)~ + @1 + how_06
++ @5 EXIT 
END

IF ~~ THEN how_01
SAY @6 /* ~I feel devastated - like the weight of the world is on my shoulders, but there is only so little I can do to make up for my mistakes.~ */
IF ~~ THEN EXIT
END

IF ~~ THEN how_02
SAY @7 /* ~Hm? What? I am sorry, I was distracted by my thoughts.~ */
IF ~~ THEN EXIT
END

IF ~~ THEN how_03
SAY @8 /* ~I thank you for taking me along. I am eager to take those to justice who did this to my family.~ */
IF ~~ THEN EXIT
END

IF ~~ THEN how_04
SAY @9 /* ~I cannot stop thinking about my wife and daughters... Best not to dwell on this.~ */
IF ~~ THEN EXIT
END

IF ~~ THEN how_05
SAY @10 /* ~Thank you, I'll manage.~ */
IF ~~ THEN EXIT
END

IF ~~ THEN how_06
SAY @11 /* ~Thank you for asking. I am thinking a lot about my lost family, but these thoughts will not distract me from our task.~ */
IF ~~ THEN EXIT
END

IF ~~ THEN sword
SAY @12
IF ~~ THEN + pid
END

IF ~~ THEN family_01
SAY @13
IF ~~ THEN + pid
END

IF ~~ THEN yourself
SAY @14
IF ~~ THEN + pid
END

IF ~~ THEN sod_how_fare
SAY @18 /* ~[Brage]I focussed on finding the culprits behind the sword change. I went as far as Waterdeep where the original smith of my real sword resides to talk to him in person. One peculiar detail is that Borda had my original sword with him, so the real sword seems to have left the smithy as planned, but still the cursed one was in an original seal. The smith seemed quite shocked about this detail and an official investigation by the smithy's guild was started. They promised to let me know if they'll find anything out. I have no more information about it yet but hope to receive them at some point.~ */
= @19 /* ~You wouldn't believe who organized the transport of the sword, though - it was a retailer connected to the Iron Throne! No wonder they knew about it, I guess Sarevok had access to all these informations. They are destroyed since the Iron Throne came down, so there is not much I can do there any more.~ */
IF ~~ THEN + pid
END


IF ~~ THEN sod_back_baldurs_gate
SAY @20 /* ~[Brage]With no more clues what to do, I came back to Baldur's Gate where the Iron Throne headquarters are - I needed to do *something* until I'll hopefully hear back from the smith's investigations about a leak in his own ranks. My hope was that they had time to settle and reorganize after the chaos Sarevok caused. (scoffs) Asking about the trader who shipped the original sword did not bring any results, of course. Noone knows anything about the matter - they even refused to know the trader's name I got from the Waterdhavian smith - and were quite irritated by my questions. There is no will to help me there. Even if they knew something, I will not hear about it by asking them.~ */
IF ~~ THEN + pid
END

IF ~~ THEN sod_back_sourcerous_sundries
SAY @21 /* ~[Brage]The smith gave me detailed information about the magical ingredients of his seals. Turns out these seals aren't a trivial matter. <CHARNAME> - this means I was not all blind and dumb when taking on the cursed sword, but had a real reason to believe it to be the original one!~ */
= @22 /* The ingredients needed for it are not that common and there is only several places were they could have been bought, the Sorcerous Sundries being one of them. Surely, the Iron Throne had their own connections for these kind of ingredients, but it was worth a shot. With their headquarters here in the city, there were slim chances they did their ordering via Halbazzer. It was a fruitless endeveor, not only because of the city - and Halbazzer Drin - being swamped with refugess, but also because it would have meant persuading him to have me look into his accounting books and reveal customers' names to me.~ */
IF ~~ THEN + pid
END

END //APPEND