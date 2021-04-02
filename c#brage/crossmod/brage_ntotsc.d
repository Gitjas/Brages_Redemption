/* ~Free? My mind is free! His blasted evil tentacles have been ripped out! Please, I have been under such a wicked spell! It was Krotan who made me... made me... Oh, by all the gods, what have I done?! Such things I could not have... such things I was made to do... I must tell you! There is a great evil at work amongst us, and it is an ogre mage of considerable power. The knowledge of the Keep is what he seeks, and he has been gathering forces these last weeks. I was his... pawn and have killed for him... killed friends for him! PLEASE! I can show you where he is hiding if you will but let me help in taking his head!~ */
I_C_T NTELDOD 6 C#BE_NTELDOD_6
== c#bragej IF ~InParty("C#Brage") InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @0 /* ~You - you would have been under mind control and forced to do the cruel deeds you did?! I can't tell you how much I feel with you if that is indeed the case - in more ways than you might think.~ */
END

/* ~No... the blood... the blood is on my hands...~ */
I_C_T NTELDOD 11 C#BE_NTELDOD_11
== c#bragej IF ~InParty("C#Brage") InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @1 /* ~I can see the shock of realization in your eyes, and the horror about what these hands of yours did. I... I went through the same as you. I remember when I was where you are now...~ */
= @2 /* ~Do not lose yourself in despair and hopelessness. You need to repent! Pray for your god's mercy and live the rest of your life to make up for what you did, so something good might come out of it in the end!~ */
== NTELDOD IF ~InParty("C#Brage") InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @3 /* ~I... I will try... but how I do not know.~ */
END

/* ~Free? My mind is free! His blasted evil tentacles have been ripped out! Please, I have been under such a wicked spell! It was Krotan who made me... made me... Oh, by all the gods, what have I done?! Such things I could not have... such things I was made to do...~ */
I_C_T NTELDOD 14 C#BE_NTELDOD_6 //same as above
== c#bragej IF ~InParty("C#Brage") InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @0 /* ~You - you would have been under mind control and forced to do the cruel deeds you did?! I can't tell you how much I feel with you if that is indeed the case - in more ways than you might think.~ */
END