/* crossmod Ajantis BGII */


I_C_T c#aja25j %ajantis_saradush_34% C#BragToB_c#aja25j_34
== C#BrageJ IF ~InParty("C#Brage")
Detect("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)
OR(3)
!InParty("sarevok") !InMyArea("sarevok") StateCheck("sarevok",CD_STATE_NOTVALID)~ THEN ~[Brage]We can't let this get to us. We did all we could!~
END

I_C_T SAREV25J %ajantis_saradush_35% C#BragToB_c#aja25j_35
== C#BrageJ IF ~InParty("C#Brage")
Detect("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN ~[Brage]We can't let this get to us. We did all we could!~
END
