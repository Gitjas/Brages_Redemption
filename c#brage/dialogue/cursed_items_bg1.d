/* cursed items Brage reactions and NPC teasings */




/* cursed sword in inventory - Brage will comment */ 

CHAIN
IF ~Global("C#BE_CursedSword","GLOBAL",1)~ THEN c#bragej carry_cursed_sword
@0 DO ~SetGlobal("C#BE_CursedSword","GLOBAL",2)~ 
EXIT

/* cursed items - triggers randomly */
CHAIN
IF 
~%BGT_VAR%
InParty(Myself)
CombatCounter(0) !See([ENEMY]) 
InParty("Minsc")
!Dead("Dynaheir")
See("Minsc") See(Player1)
!StateCheck("Minsc",CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
OR(24)
PartyHasItem("SW2H03")
PartyHasItemIdentified("HELM02")
PartyHasItemIdentified("BELT05")
PartyHasItemIdentified("BELT15")
PartyHasItemIdentified("BRAC08")
PartyHasItemIdentified("BLUN09")
PartyHasItemIdentified("BRAC11")
PartyHasItemIdentified("LEAT06")
PartyHasItemIdentified("MISC72")
PartyHasItemIdentified("RING04")
PartyHasItemIdentified("RING23")
PartyHasItemIdentified("RING47")
PartyHasItemIdentified("SPER03")
PartyHasItemIdentified("BOOT08")
PartyHasItemIdentified("STAF25")
PartyHasItemIdentified("SW1H19")
PartyHasItemIdentified("SW1P01")
PartyHasItemIdentified("SCRL10")
PartyHasItemIdentified("SCRL11")
PartyHasItemIdentified("SCRL12")
PartyHasItemIdentified("SCRL13")
PartyHasItemIdentified("SCRL14")
PartyHasItemIdentified("SCRL16")
PartyHasItemIdentified("SCRL17")
PartyHasItemIdentified("SCRL18")
Global("C#BE_CursedItems","GLOBAL",0)~ THEN C#BrageB cursed_items
@1 DO ~SetGlobal("C#BE_CursedItems","GLOBAL",1)~
== C#BrageB IF ~PartyHasItem("SW2H03")~ THEN @2
== C#BrageB IF ~PartyHasItemIdentified("HELM02")~ THEN @3
== C#BrageB IF ~PartyHasItemIdentified("BELT05")~ THEN @4
== C#BrageB IF ~PartyHasItemIdentified("BELT15")~ THEN @106
== C#BrageB IF ~PartyHasItemIdentified("BRAC08")~ THEN @5
== C#BrageB IF ~PartyHasItemIdentified("BLUN09")~ THEN @6
== C#BrageB IF ~PartyHasItemIdentified("BRAC11")~ THEN @7
== C#BrageB IF ~PartyHasItemIdentified("LEAT06")~ THEN @8
== C#BrageB IF ~PartyHasItemIdentified("MISC72")~ THEN @9
== C#BrageB IF ~PartyHasItemIdentified("RING04")~ THEN @10
== C#BrageB IF ~PartyHasItemIdentified("RING23")~ THEN @11
== C#BrageB IF ~PartyHasItemIdentified("RING47")~ THEN @12
== C#BrageB IF ~PartyHasItemIdentified("SPER03")~ THEN @13
== C#BrageB IF ~PartyHasItemIdentified("BOOT08")~ THEN @14
== C#BrageB IF ~PartyHasItemIdentified("STAF25")~ THEN @15
== C#BrageB IF ~PartyHasItemIdentified("SW1H19")~ THEN @16
== C#BrageB IF ~PartyHasItemIdentified("SW1P01")~ THEN @17
== C#BrageB IF ~OR(8) 
PartyHasItemIdentified("SCRL10")
PartyHasItemIdentified("SCRL11")
PartyHasItemIdentified("SCRL12")
PartyHasItemIdentified("SCRL13")
PartyHasItemIdentified("SCRL14")
PartyHasItemIdentified("SCRL16")
PartyHasItemIdentified("SCRL17")
PartyHasItemIdentified("SCRL18")~ THEN @18

== ~%KHALID_BANTER%~ IF ~InParty("Khalid")
See("Khalid") !StateCheck("Khalid",CD_STATE_NOTVALID)~ THEN @19
== ~%AJANTIS_BANTER%~ IF ~InParty("Ajantis")
See("Ajantis") !StateCheck("Ajantis",CD_STATE_NOTVALID)~ THEN @20
== ~%ELDOTH_BANTER%~ IF ~InParty("Eldoth")
See("Eldoth") !StateCheck("Eldoth",CD_STATE_NOTVALID)~ THEN @21
== ~%ELDOTH_BANTER%~ IF ~InParty("Eldoth")
See("Eldoth") !StateCheck("Eldoth",CD_STATE_NOTVALID)~ THEN @22 DO ~IncrementGlobal("C#BE_EldothTeased","GLOBAL",1)~
== C#BrageB IF ~InParty("Eldoth")
See("Eldoth") !StateCheck("Eldoth",CD_STATE_NOTVALID)~ THEN @23
== ~%XZAR_BANTER%~ IF ~InParty("Xzar")
See("Xzar") !StateCheck("Xzar",CD_STATE_NOTVALID)~ THEN @24
== ~%MONTARON_BANTER%~ IF ~InParty("Montaron")
See("Montaron") !StateCheck("Montaron",CD_STATE_NOTVALID)~ THEN @25
== ~%IMOEN_BANTER%~ IF ~InParty("%IMOEN_DV%")
See("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @26
== ~%XZAR_BANTER%~ IF ~InParty("Xzar")
See("Xzar") !StateCheck("Xzar",CD_STATE_NOTVALID) InParty("Montaron")
See("Montaron") !StateCheck("Montaron",CD_STATE_NOTVALID)~ THEN @27
== ~%MONTARON_BANTER%~ IF ~InParty("Montaron")
See("Montaron") !StateCheck("Montaron",CD_STATE_NOTVALID) InParty("Xzar")
See("Xzar") !StateCheck("Xzar",CD_STATE_NOTVALID)~ THEN @28
== ~%EDWIN_BANTER%~ IF ~InParty("Edwin")
See("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @29
== ~%DYNAHEIR_BANTER%~ IF ~InParty("Dynaheir")
See("Dynaheir") !StateCheck("Dynaheir",CD_STATE_NOTVALID)~ THEN @30
== C#BrageB @31
== ~%ELDOTH_BANTER%~ IF ~InParty("Eldoth")
See("Eldoth") !StateCheck("Eldoth",CD_STATE_NOTVALID)~ THEN @32
== C#BrageB IF ~InParty("Eldoth")
See("Eldoth") !StateCheck("Eldoth",CD_STATE_NOTVALID) GlobalLT("C#BE_EldothTeased","GLOBAL",2)~ THEN @33
== C#BrageB IF ~InParty("Eldoth")
See("Eldoth") !StateCheck("Eldoth",CD_STATE_NOTVALID) GlobalGT("C#BE_EldothTeased","GLOBAL",1)~ THEN @34

END
++ @35 + cursed_items_01
++ @36 + cursed_items_02
++ @37 + cursed_items_05
++ @38 + cursed_items_06
++ @39 + cursed_items_03
++ @40 + cursed_items_04

APPEND C#BrageB 
IF ~~ THEN cursed_items_01
SAY @41
IF ~~ THEN + cursed_items_05
END

IF ~~ THEN cursed_items_02
SAY @42
IF ~~ THEN + cursed_items_05
END

IF ~~ THEN cursed_items_03
SAY @43
IF ~~ THEN + cursed_items_05
END

IF ~~ THEN cursed_items_04
SAY @44
IF ~~ THEN + cursed_items_05
END

IF ~~ THEN cursed_items_05
SAY @45
IF ~~ THEN EXIT
END

IF ~~ THEN cursed_items_06
SAY @46
IF ~~ THEN + cursed_items_05
END
END //APPEND


APPEND c#bragej

/* Brage wears the helmet of alignment change */
IF ~Global("C#BE_HELM02","GLOBAL",1)~ THEN helm_alignment
SAY @47
IF ~~ THEN DO ~SetGlobal("C#BE_HELM02","GLOBAL",2)~ EXIT
END

/* Brage wears girdle of gender change */
IF ~Global("C#BE_BELT05","GLOBAL",1)~ THEN helm_alignment
SAY @48
IF ~~ THEN DO ~SetGlobal("C#BE_BELT05","GLOBAL",2)~ EXIT
END

END //APPEND


CHAIN
IF WEIGHT #-1
~Global("C#BE_BrageEldothTeaseHELM02","GLOBAL",1)~ THEN ~%ELDOTH_JOINED%~ tease_helmet
@49 DO ~SetGlobal("C#BE_BrageEldothTeaseHELM02","GLOBAL",2) IncrementGlobal("C#BE_EldothTeased","GLOBAL",1)~
== C#BrageJ @50
EXIT

/* girdle of gender change */
CHAIN
IF WEIGHT #-1
~Global("C#BE_BrageEldothTeaseBELT05","GLOBAL",1)~ THEN ~%ELDOTH_JOINED%~ tease_helmet
@51 DO ~SetGlobal("C#BE_BrageEldothTeaseBELT05","GLOBAL",2) IncrementGlobal("C#BE_EldothTeased","GLOBAL",1)~
== C#BrageJ @52
== ~%ELDOTH_JOINED%~ @53
== C#BrageJ @54
EXIT

/* (SoD) Cursed Girdle of Hill Giant Strength */
CHAIN
IF WEIGHT #-1
~Global("C#BE_BrageEldothTeaseBELT15","GLOBAL",1)~ THEN ~%ELDOTH_JOINED%~ tease_cursedgirldehillgiant
@55 DO ~SetGlobal("C#BE_BrageEldothTeaseBELT15","GLOBAL",2) IncrementGlobal("C#BE_EldothTeased","GLOBAL",1)~
== C#BrageJ @56
== ~%ELDOTH_JOINED%~ @57
EXIT

/* Boots of Phasing */
CHAIN
IF WEIGHT #-1
~Global("C#BE_BrageEldothTeaseBOOT08","GLOBAL",1)~ THEN ~%ELDOTH_JOINED%~ tease_bootsphasing
@58 DO ~SetGlobal("C#BE_BrageEldothTeaseBOOT08","GLOBAL",2) IncrementGlobal("C#BE_EldothTeased","GLOBAL",1)~
== C#BrageJ @59
== ~%ELDOTH_JOINED%~ @60
EXIT

/* Gloves of Misplacement */
CHAIN
IF WEIGHT #-1
~Global("C#BE_BrageEldothTeaseBRAC08","GLOBAL",1)~ THEN ~%ELDOTH_JOINED%~ tease_glovesmisplacement
@61 DO ~SetGlobal("C#BE_BrageEldothTeaseBRAC08","GLOBAL",2) IncrementGlobal("C#BE_EldothTeased","GLOBAL",1)~
== C#BrageJ @62
== ~%ELDOTH_JOINED%~ @63
EXIT

/* Kiel's Morning Star +3, Causes the wielder to go berserk */
CHAIN
IF WEIGHT #-1
~Global("C#BE_BLUN09","GLOBAL",1)~ THEN C#BrageJ tease_kiels
@64 DO ~SetGlobal("C#BE_BLUN09","GLOBAL",2)~
== ~%EDWIN_JOINED%~ IF ~InParty("Edwin")
See("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @65
== C#BrageJ IF ~InParty("Edwin")
See("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @66
EXIT

/* Bracers of Binding */
CHAIN
IF WEIGHT #-1
~Global("C#BE_BrageViciTeaseBRAC11","GLOBAL",1)~ THEN %VICONIA_JOINED% tease_bracersbinding
@67 DO ~SetGlobal("C#BE_BrageViciTeaseBRAC11","GLOBAL",2)~
== C#BrageJ @68
== ~%VICONIA_JOINED%~ @69
== C#BrageJ IF ~GlobalGT("C#BE_EldothTeased","GLOBAL",0)~ THEN @70
== ~%VICONIA_JOINED%~ IF ~GlobalGT("C#BE_EldothTeased","GLOBAL",0)~ THEN @71
== C#BrageJ @72
EXIT

/* Ring of Folly: Discipliner */
CHAIN
IF WEIGHT #-1
~Global("C#BE_BrageEldothTeaseRING23","GLOBAL",1)~ THEN ~%ELDOTH_JOINED%~ tease_follyring
@73 DO ~SetGlobal("C#BE_BrageEldothTeaseRING23","GLOBAL",2) IncrementGlobal("C#BE_EldothTeased","GLOBAL",1)~
== ~%IMOEN_BANTER%~ IF ~InParty("%IMOEN_DV%")
See("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @74
== C#BrageJ IF ~InParty("%IMOEN_DV%")
See("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @75
== C#BrageJ @76
EXIT


/* (SoD) Cursed Ring of Slight Monsterism: The Iron Thorn */
CHAIN
IF WEIGHT #-1
~Global("C#BE_RING47","GLOBAL",1)~ THEN C#BrageJ tease_zombiering
@77 DO ~SetGlobal("C#BE_RING47","GLOBAL",2)~
== ~%JAHEIRA_JOINED%~ IF ~InParty("Jaheira")
See("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @78
== C#BrageJ IF ~InParty("Jaheira")
See("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @79
== ~%MONTARON_BANTER%~ IF ~InParty("Montaron")
See("Montaron") !StateCheck("Montaron",CD_STATE_NOTVALID)~ THEN @80
== ~%IMOEN_BANTER%~ IF ~InParty("%IMOEN_DV%")
See("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)
InParty("Montaron")
See("Montaron") !StateCheck("Montaron",CD_STATE_NOTVALID)~ THEN @81
== ~%MONTARON_BANTER%~ IF ~InParty("%IMOEN_DV%")
See("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)
InParty("Montaron")
See("Montaron") !StateCheck("Montaron",CD_STATE_NOTVALID)~ THEN @82
== C#BrageJ IF ~InParty("Montaron")
See("Montaron") !StateCheck("Montaron",CD_STATE_NOTVALID)~ THEN @83
== C#BrageJ @84
== ~%KAGAIN_BANTER%~ IF ~InParty("Kagain")
See("Kagain") !StateCheck("Kagain",CD_STATE_NOTVALID)~ THEN @85
== C#BrageJ IF ~InParty("Kagain")
See("Kagain") !StateCheck("Kagain",CD_STATE_NOTVALID)~ THEN @86
== ~%KAGAIN_BANTER%~ IF ~InParty("Kagain")
See("Kagain") !StateCheck("Kagain",CD_STATE_NOTVALID)~ THEN @87
== C#BrageJ IF ~InParty("Kagain")
See("Kagain") !StateCheck("Kagain",CD_STATE_NOTVALID)~ THEN @88
== ~%XZAR_BANTER%~ IF ~InParty("Xzar")
See("Xzar") !StateCheck("Xzar",CD_STATE_NOTVALID)
Global("C#BE_XzarZombieRing","GLOBAL",1)~ THEN @89 
== C#BrageJ IF ~InParty("Xzar")
See("Xzar") !StateCheck("Xzar",CD_STATE_NOTVALID)
Global("C#BE_XzarZombieRing","GLOBAL",1)~ THEN @90 DO ~SetGlobal("C#BE_XzarZombieRing","GLOBAL",1)~
== ~%XZAR_BANTER%~ IF ~InParty("Xzar")
See("Xzar") !StateCheck("Xzar",CD_STATE_NOTVALID)
Global("C#BE_XzarZombieRing","GLOBAL",1)~ THEN @91
== C#BrageJ IF ~InParty("Xzar")
See("Xzar") !StateCheck("Xzar",CD_STATE_NOTVALID)
Global("C#BE_XzarZombieRing","GLOBAL",1)~ THEN @92
EXIT


/* Vampiric Sword */
CHAIN
IF WEIGHT #-1
~Global("C#BE_SW1H19","GLOBAL",1) 
GlobalGT("C#BE_EldothTeased","GLOBAL",0)
InParty("Eldoth")
See("Eldoth") !StateCheck("Eldoth",CD_STATE_NOTVALID)~ THEN C#BrageJ vampiricsword
@93 
== ~%ELDOTH_JOINED%~ IF ~InParty("Eldoth")
See("Eldoth") !StateCheck("Eldoth",CD_STATE_NOTVALID)~ THEN @94
END
IF ~~ THEN EXTERN C#BrageJ vampiricsword_01

CHAIN
IF WEIGHT #-1
~Global("C#BE_SW1H19","GLOBAL",1) 
OR(4)
Global("C#BE_EldothTeased","GLOBAL",0)
!InParty("Eldoth")
!See("Eldoth") StateCheck("Eldoth",CD_STATE_NOTVALID)~ THEN C#BrageJ vampiricsword_01
@95 DO ~SetGlobal("C#BE_SW1H19","GLOBAL",2)~
END
++ @96 + vampiricsword_02
++ @97 + vampiricsword_03
++ @98 + vampiricsword_04

APPEND C#BrageJ 
IF ~~ THEN vampiricsword_02
SAY @99
IF ~~ THEN + vampiricsword_03
END

IF ~~ THEN vampiricsword_03
SAY @100
IF ~~ THEN EXIT
END

IF ~~ THEN vampiricsword_04
SAY @101
IF ~~ THEN + vampiricsword_03
END

END //APPEND


/* (SoD) Long Sword Viper's Edge +2 */
CHAIN
IF WEIGHT #-1
~Global("C#BE_BrageEldothTeaseSW1P01","GLOBAL",1)~ THEN ~%ELDOTH_JOINED%~ tease_viper
@102 DO ~SetGlobal("C#BE_BrageEldothTeaseSW1P01","GLOBAL",2) IncrementGlobal("C#BE_EldothTeased","GLOBAL",1)~
== C#BrageJ @103
== ~%ELDOTH_JOINED%~ @104
== C#BrageJ @105
EXIT
