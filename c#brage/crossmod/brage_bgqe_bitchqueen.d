/* @3    = ~Indeed, we are convinced that it is the Lady's will for this child to suffer the consequences of his actions. He tested his luck and lost. We thank you for bringing the corpse here, preventing our brother to commit an affront to his church. He will understand with time that there is no other will than the will of the gods.~ */
I_C_T CHANTH %chanth_3% C#BE_TREMAI_bgqe_3
== c#bragej IF ~InParty("C#Brage") InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @0 /* ~<CHARNAME>, as much as I would enforce a church's law upon their followers - as a father my heart bleeds upon your decision.~ */
END