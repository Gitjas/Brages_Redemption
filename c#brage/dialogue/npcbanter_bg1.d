/* BG1 NPC banter */


/* Brage - Minsc 1 */
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
Global("C#BrageMinsc_BG1","GLOBAL",0)~ THEN C#BrageB brageminsc1
@69 /* ~Minsc, I am glad you found help for the rescue of your witch. I still remember my men telling me of the Rashemen warrior searching for help - but we were flooded with reports of bandit sightings and missing persons, and I went to investigate the killed merchant on the roads...~ */ DO ~setGlobal("C#BrageMinsc_BG1","GLOBAL",1)~
== C#BrageB IF ~InParty("Dynaheir")
See("Dynaheir") !StateCheck("Dynaheir",CD_STATE_NOTVALID)~ THEN @73
DO ~SetGlobal("C#BrageDynaheir_BG1","GLOBAL",1)~
== %MINSC_BANTER% @70
== %DYNAHEIR_BANTER% IF ~InParty("Dynaheir")
See("Dynaheir") !StateCheck("Dynaheir",CD_STATE_NOTVALID)~ THEN @71
== C#BrageB @72
EXIT

/* Brage - Dynaheir 1 */
/* in case she wasn't in party when Brage bantered with Minsc */
CHAIN
IF 
~%BGT_VAR%
InParty(Myself)
CombatCounter(0) !See([ENEMY]) 
InParty("Dynaheir")
See("Dynaheir") See(Player1)
!StateCheck("Dynaheir",CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
Global("C#BrageMinsc_BG1","GLOBAL",1)
Global("C#BrageDynaheir_BG1","GLOBAL",0)~ THEN C#BrageB bragedynaheir1
@73 
DO ~SetGlobal("C#BrageDynaheir_BG1","GLOBAL",1)~
== %DYNAHEIR_BANTER% @71
== C#BrageB @74
EXIT



/* Brage - Imoen 1 */
CHAIN
IF 
~%BGT_VAR%
InParty(Myself)
CombatCounter(0) !See([ENEMY]) 
InParty("%IMOEN_DV%")
See("%IMOEN_DV%") See(Player1)
!StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
Global("C#BrageImoen_BG1","GLOBAL",0)~ THEN C#BrageB brageimoen1
@3
DO ~SetGlobal("C#BrageImoen_BG1","GLOBAL",1)~
== ~%IMOEN_BANTER%~ @4
== C#BrageB @5
== ~%IMOEN_BANTER%~ @6
= @7
= @8
== C#BrageB @9
EXIT

/* Brage - Eldoth */
CHAIN
IF WEIGHT #-1 
~%BGT_VAR%
InParty(Myself)
CombatCounter(0) !See([ENEMY]) 
InParty("C#Brage")
See("C#Brage") See(Player1)
!StateCheck("C#Brage",CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
Global("C#BrageEldoth_BG1","GLOBAL",0)~ THEN %ELDOTH_BANTER% brageeldoth1
@59 
DO ~SetGlobal("C#BrageEldoth_BG1","GLOBAL",1)~
== C#BrageB IF ~!Global("C#BrageAjantis_BG1","GLOBAL",0)~ THEN @57 
== C#BrageB @60
== %ELDOTH_BANTER% @61
== C#BrageB @62
== %ELDOTH_BANTER% @63
EXIT


/* Eldoth continues his teasing, Brage is annoyed */
CHAIN
IF 
~%BGT_VAR%
InParty(Myself)
CombatCounter(0) !See([ENEMY]) 
InParty("Eldoth")
See("Eldoth") See(Player1)
!StateCheck("Eldoth",CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
Global("C#BE_EldothAnnoyed","GLOBAL",0)
GlobalGT("C#BE_EldothTeased","GLOBAL",1)~ THEN C#BrageB brageeldoth2
@94
DO ~SetGlobal("C#BE_EldothAnnoyed","GLOBAL",1)~
== %ELDOTH_BANTER% @95
== C#BrageB @96
== %ELDOTH_BANTER% @97
== C#BrageB @98
EXIT


/* Brage - Garrick 1 */
CHAIN
IF WEIGHT #-1 
~%BGT_VAR%
InParty(Myself)
CombatCounter(0) !See([ENEMY]) 
InParty("C#Brage")
See("C#Brage") See(Player1)
!StateCheck("C#Brage",CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
Global("C#BrageGarrick_BG1","GLOBAL",0)~ THEN %GARRICK_BANTER% bragegarrick1
@99 
DO ~SetGlobal("C#BrageGarrick_BG1","GLOBAL",1)~
== C#BrageB @100
== %GARRICK_BANTER% @101
= @102
== %ELDOTH_BANTER% IF ~InParty("Eldoth")
See("Eldoth") See(Player1)
!StateCheck("Eldoth",CD_STATE_NOTVALID)~ THEN @103
== %GARRICK_BANTER% IF ~InParty("Eldoth")
See("Eldoth") See(Player1)
!StateCheck("Eldoth",CD_STATE_NOTVALID)~ THEN @104
== C#BrageB @105
== %GARRICK_BANTER% @106
== C#BrageB @107
EXIT



/* Brage - Ajantis 1 */
CHAIN
IF WEIGHT #-1 
~%BGT_VAR%
InParty(Myself)
CombatCounter(0) !See([ENEMY]) 
InParty("C#Brage")
See("C#Brage") See(Player1)
!StateCheck("C#Brage",CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
Global("C#BrageAjantis_BG1","GLOBAL",0)~ THEN %AJANTIS_BANTER% brageajantis1
@10 
DO ~SetGlobal("C#BrageAjantis_BG1","GLOBAL",1)~
== C#BrageB @11
== %AJANTIS_BANTER% @12
== C#BrageB @13
== %AJANTIS_BANTER% @14
== C#BrageB @15
== %AJANTIS_BANTER% @56
== C#BrageB IF ~!Global("C#BrageEldoth_BG1","GLOBAL",0)~ THEN @57
== C#BrageB @58
EXIT

/* Brage - Montaron 1 */
CHAIN
IF WEIGHT #-1 
~%BGT_VAR%
InParty(Myself)
CombatCounter(0) !See([ENEMY]) 
InParty("C#Brage")
See("C#Brage") See(Player1)
!StateCheck("C#Brage",CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
Global("C#BrageMontaron_BG1","GLOBAL",0)~ THEN %MONTARON_BANTER% bragemontaron1
@64 
DO ~SetGlobal("C#BrageMontaron_BG1","GLOBAL",1)~
== C#BrageB @65
== %MONTARON_BANTER% @66
= @67
== C#BrageB @68
EXIT


/* Brage - Xzar 1 */
CHAIN
IF WEIGHT #-1 
~%BGT_VAR%
InParty(Myself)
CombatCounter(0) !See([ENEMY]) 
InParty("C#Brage")
See("C#Brage") See(Player1)
!StateCheck("C#Brage",CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
Global("C#BrageXzar_BG1","GLOBAL",0)~ THEN %XZAR_BANTER% bragexzar1
@75 
DO ~SetGlobal("C#BrageXzar_BG1","GLOBAL",1)~
== C#BrageB @76
== %XZAR_BANTER% @77
== C#BrageB @78
EXIT


/* Brage - Xzar - Zombie ring (in case Xzar wasn't present when Brage started his dialogue) */
CHAIN
IF WEIGHT #-1 
~%BGT_VAR%
InParty(Myself)
CombatCounter(0) !See([ENEMY]) 
InParty("C#Brage")
See("C#Brage") See(Player1)
!StateCheck("C#Brage",CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
Global("C#BrageXzar_BG1","GLOBAL",1)
PartyHasItemIdentified("RING47")
Global("C#BE_XzarZombieRing","GLOBAL",0)~ THEN %XZAR_BANTER% bragexzarzombiering
@79 DO ~SetGlobal("C#BE_XzarZombieRing","GLOBAL",1)~
== C#BrageB @80
== %XZAR_BANTER% @81
== C#BrageB @82
EXIT

/* Brage - Xzar 2 */
CHAIN
IF 
~%BGT_VAR%
InParty(Myself)
CombatCounter(0) !See([ENEMY]) 
InParty("C#Brage")
See("C#Brage") See(Player1)
!StateCheck("C#Brage",CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
Global("C#BrageXzar_BG1","GLOBAL",1)~ THEN %XZAR_BANTER% bragexzar2
@83 
DO ~SetGlobal("C#BrageXzar_BG1","GLOBAL",2)~
== C#BrageB @84
== %XZAR_BANTER% @85
== C#BrageB @86
== %XZAR_BANTER% @87
= @88
== C#BrageB @89
== %XZAR_BANTER% @90
== %XZAR_BANTER% IF ~PartyHasItem("X#XZDRIA")~ THEN @91
== %XZAR_BANTER% @92
== C#BrageB @93
EXIT


/* Brage - Yeslick 1 */
CHAIN
IF WEIGHT #-1 
~%BGT_VAR%
InParty(Myself)
CombatCounter(0) !See([ENEMY]) 
InParty("C#Brage")
See("C#Brage") See(Player1)
!StateCheck("C#Brage",CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
Global("C#BrageYeslick_BG1","GLOBAL",0)~ THEN %YESLICK_BANTER% brageyeslickk1
@108 
DO ~SetGlobal("C#BrageYeslick_BG1","GLOBAL",1)~
== C#BrageB @109
== %YESLICK_BANTER% @110
= @111
== C#BrageB @112
EXIT


/* Brage - Ajantis 2 */
CHAIN
IF 
~%BGT_VAR%
InParty(Myself)
CombatCounter(0) !See([ENEMY]) 
InParty("Ajantis")
See("Ajantis") See(Player1)
!StateCheck("Ajantis",CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
Global("C#BrageAjantis_BG1","GLOBAL",1)~ THEN C#BrageB brageajantis2
@16 
DO ~SetGlobal("C#BrageAjantis_BG1","GLOBAL",2)~
== %AJANTIS_BANTER% @17
== C#BrageB @18
== %AJANTIS_BANTER% @19
== C#BrageB @20
== %AJANTIS_BANTER% @21
== C#BrageB @22
EXIT

/* Brage - Minsc 2 */
CHAIN
IF 
~%BGT_VAR%
InParty(Myself)
CombatCounter(0) !See([ENEMY]) 
InParty("Minsc")
See("Minsc") See(Player1)
!StateCheck("Minsc",CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
Global("C#BrageMinsc_BG1","GLOBAL",1)~ THEN C#BrageB brageminsc2
@0 
DO ~SetGlobal("C#BrageMinsc_BG1","GLOBAL",2)~
== %MINSC_BANTER% @1
== C#BrageB @2
EXIT


/* Brage - Imoen 2 */
CHAIN
IF 
~%BGT_VAR%
InParty(Myself)
CombatCounter(0) !See([ENEMY]) 
InParty("%IMOEN_DV%")
See("%IMOEN_DV%") See(Player1)
!StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
Global("C#BrageImoen_BG1","GLOBAL",1)~ THEN C#BrageB brageimoen2
@23
DO ~SetGlobal("C#BrageImoen_BG1","GLOBAL",2)~
== %IMOEN_BANTER% @24
== C#BrageB @25
== %IMOEN_BANTER% @26
== C#BrageB @27
EXIT






/* Brage - Ajantis 3 */
CHAIN
IF  
~InParty(Myself)
CombatCounter(0) !See([ENEMY]) 
InParty("C#Brage")
See("C#Brage") See(Player1)
!StateCheck("C#Brage",CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
Global("C#BrageAjantis_BG1","GLOBAL",2)~ THEN %AJANTIS_BANTER% brageajantis3
@37
DO ~SetGlobal("C#BrageAjantis_BG1","GLOBAL",3)~
== C#BrageB @38
== %AJANTIS_BANTER% @39
== C#BrageB @40
EXIT


/* Brage - Ajantis 4 */
CHAIN
IF 
~InParty(Myself)
CombatCounter(0) !See([ENEMY]) 
InParty("Ajantis")
See("Ajantis") See(Player1)
!StateCheck("Ajantis",CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
Global("C#BrageAjantis_BG1","GLOBAL",3)~ THEN C#BrageB brageajantis4
@41 
DO ~SetGlobal("C#BrageAjantis_BG1","GLOBAL",4)~
== %AJANTIS_BANTER% @42
== C#BrageB @43
== %AJANTIS_BANTER% @44
== C#BrageB @45
= @46
EXIT



/* Brage - Minsc 3 */
CHAIN
IF 
~%BGT_VAR%
InParty(Myself)
CombatCounter(0) !See([ENEMY]) 
InParty("Minsc")
See("Minsc") See(Player1)
!StateCheck("Minsc",CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
Global("C#BrageMinsc_BG1","GLOBAL",2)~ THEN C#BrageB brageminsc3
@113 
DO ~SetGlobal("C#BrageMinsc_BG1","GLOBAL",3)~
== %MINSC_BANTER% @114
== C#BrageB @115
EXIT


/* Brage - Ajantis 3 */
CHAIN
IF WEIGHT #-1
~InParty(Myself)
CombatCounter(0) !See([ENEMY]) 
InParty("C#Brage")
See("C#Brage") See(Player1)
!StateCheck("C#Brage",CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
Global("C#BrageMinsc_BG1","GLOBAL",3)~ THEN %MINSC_BANTER% brageminsc4
@116
DO ~SetGlobal("C#BrageMinsc_BG1","GLOBAL",4)~
== C#BrageB @117
== %MINSC_BANTER% @118
== C#BrageB @119
EXIT





/* Brage - Imoen 3 */
CHAIN
IF 
~%BGT_VAR%
InParty(Myself)
CombatCounter(0) !See([ENEMY])
InParty("%IMOEN_DV%")
See("%IMOEN_DV%") See(Player1)
!StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
Global("C#BrageImoen_BG1","GLOBAL",2)~ THEN C#BrageB brageimoen3
@28
DO ~SetGlobal("C#BrageImoen_BG1","GLOBAL",3)~
== %IMOEN_BANTER% @29
== C#BrageB @30
== %IMOEN_BANTER% @31
== C#BrageB @32
== %IMOEN_BANTER% @33
== C#BrageB @34
== %IMOEN_BANTER% @35
== C#BrageB @36
EXIT




/* Brage - Imoen 4 */
CHAIN
IF 
~InParty(Myself)
CombatCounter(0) !See([ENEMY]) 
InParty("%IMOEN_DV%")
See("%IMOEN_DV%") See(Player1)
!StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)
!StateCheck(Myself,CD_STATE_NOTVALID)
Global("C#BrageImoen_BG1","GLOBAL",3)~ THEN C#BrageB brageimoen4
@47
DO ~SetGlobal("C#BrageImoen_BG1","GLOBAL",4)~
== %IMOEN_BANTER% @48
== C#BrageB @49
== %IMOEN_BANTER% @50
== C#BrageB @51
== %IMOEN_BANTER% @52
== C#BrageB @53
== %IMOEN_BANTER% @54
== C#BrageB @55
EXIT



