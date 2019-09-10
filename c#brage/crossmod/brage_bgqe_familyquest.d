/* Family Quest */

/* Folow up: family needs to leave the house */
I_C_T C#Q02005 26 C#BE_C#Q02005_26
== c#bragej IF ~InParty("C#Brage") InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @0 
END

/* Mr Dudlay comes back because PC gave too much gold */
I_C_T C#Q02006 38 C#BE_C#Q02006_38
== c#bragej IF ~InParty("C#Brage") InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @1
END


/* PC gave necklace to Annie after buying it */
I_C_T C#Q02007 23 C#BE_C#Q02007_23
== c#bragej IF ~InParty("C#Brage") InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @2
END

/* PC took necklace from Annie */
I_C_T3 C#Q02007 24 C#BE_C#Q02007_24
== c#bragej IF ~Alignment(Player1,MASK_EVIL)
InParty("C#Brage") InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @3
== c#bragej IF ~!Alignment(Player1,MASK_EVIL)
InParty("C#Brage") InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @4
END