I_C_T L#KOBWMN 0 C#BE_L#KOBWMN_0
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @0 /* ~Your... your husband went missing after acquiring an unusual sword? This stirs unpleasant memories. We will have a look out for your husband, good woman.~ */
END

I_C_T L#KOBWMN 3 C#BE_L#KOBWMN_3
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @1 /* ~Your husband died in an attempt to save the mines? This cannot be, Emerson would not have let him pass! But... if this is his weapon, then there is no question that he died by the hands of those who had the mine in their clutches...~ */
== L#KOBWMN IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @2 /* ~You - it's you, isn't it? The former commander of this town. The one who went crazy and killed his family. You. You are a reason why he went down to the mine to free it. He wanted to be noble and free the mines from the ghosts, because the Guard was not able to. Now you are free and here, and my husband...~ */
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @3 /* ~I am so sorry, good woman. There is no words for it...~ */
== L#KOBWMN IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @4 /* ~Get out of my sight! Go! And that sword...~ */
END