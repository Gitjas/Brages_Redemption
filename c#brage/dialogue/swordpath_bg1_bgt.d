/* Thalantyr , extra dialogue state for BGT */
EXTEND_BOTTOM THALAN 35
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathThalantyr","GLOBAL",0)
PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200000 /* My comrade Brage here has a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
+ ~GlobalGT("C#BE_BG1SwordPath","GLOBAL",0) GlobalLT("C#BE_BG1SwordPath","GLOBAL",30)
Global("C#BE_BG1SwordPathThalantyr","GLOBAL",0)
PartyHasItem("c#be1sp1") !PartyHasItem("SW2H03")
InParty("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID) Detect("C#Brage")~ + @200001 /* My comrade Brage here has information about a cursed sword he would like to show you. Would you have a look at it and tell us anything you would know about it? */ + sword_evaluation
END