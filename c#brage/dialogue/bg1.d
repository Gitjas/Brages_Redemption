/* BG1 */



/* reactions of Nashkel towns folk */

/* Bardolan - only if he is still there because of JAP or bg1re */

CHAIN
IF WEIGHT #-1
~NumTimesTalkedToGT(0)
InParty("C#Brage") InMyArea("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)
Global("C#BE_GreetBardolan","LOCALS",0)~ THEN %tutu_var%BARDOL bardolan
@0
== C#BrageJ @1
== %tutu_var%BARDOL @2
END
IF ~~ THEN DO ~SetGlobal("C#BE_GreetBardolan","LOCALS",1)~ EXIT



/* Nashkel Inn */
CHAIN 
IF WEIGHT #-1
~Global("C#BE_INNKN2","LOCALS",0)
InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN INNKN2 innkn2_brage
@3
== C#BrageJ @4
== INNKN2 @5
== C#BrageJ @6
== INNKN2 @7
END
IF ~~ THEN DO ~SetGlobal("C#BE_INNKN2","LOCALS",1)~ EXTERN INNKN2 0

/* Nashkel shop */
CHAIN 
IF WEIGHT #-1
~Global("C#BE_SHOPKN","LOCALS",0)
InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN SHOPKN shop_brage
@8
END
IF ~~ THEN DO ~SetGlobal("C#BE_SHOPKN","LOCALS",1)~ EXTERN SHOPKN 0

/* inside the Nashkel menor house */
APPEND C#BrageJ
IF ~Global("C#BE_NashkelManorHouse","GLOBAL",1)~ THEN mension
SAY @9
IF ~~ THEN DO ~SetGlobal("C#BE_NashkelManorHouse","GLOBAL",2)~ EXIT
END
END //APPEND

/* noble woman in menor house */
I_C_T NOBW2 0 C#BE_NOBW2_0
== NOBW2 IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @10
END


/* Joseph's widow */
I_C_T %tutu_scriptbg%FTOWN2%eet_var% 1 C#BE_BGFTOWN2_1
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @11
END

/* Beggar in front of Belching Dragon */
CHAIN 
IF WEIGHT #-1
~Global("C#BE_BEGGNA","LOCALS",0)
InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN BEGGNA brage
@12 DO ~SetGlobal("C#BE_BEGGNA","LOCALS",1)~
== C#BrageJ @13
EXIT

/* Volo */
CHAIN 
IF WEIGHT #-1
~Global("C#BE_Volo","LOCALS",0)
InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN VOLO brage
@14 DO ~SetGlobal("C#BE_Volo","LOCALS",1)~
== C#BrageJ @15
EXIT


/* Belching dragon */
CHAIN 
IF WEIGHT #-1
~Global("C#BE_BART2","LOCALS",0)
InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN BART2 BART2_brage
@16 DO ~SetGlobal("C#BE_BART2","LOCALS",1)~
== C#BrageJ @17
END
IF ~~ THEN EXTERN BART2 0

/* some lines from Amnish soldiers */

CHAIN 
IF WEIGHT #-1
~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)
Global("C#BE_BrageGreatsSoldiers","GLOBAL",0)
Global("C#BE_ITalked","LOCALS",0)~ THEN AMNIS greeting
@18 DO ~SetGlobal("C#BE_ITalked","LOCALS",1) IncrementGlobal("C#BE_BrageGreatsSoldiers","GLOBAL",1)~
== C#BrageJ @19
== AMNIS @20
== C#BrageJ @21
EXIT


CHAIN 
IF WEIGHT #-1
~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)
Global("C#BE_BrageGreatsSoldiers","GLOBAL",1)
Global("C#BE_ITalked","LOCALS",0)~ THEN AMNIS greeting_2
@22 DO ~SetGlobal("C#BE_ITalked","LOCALS",1) IncrementGlobal("C#BE_BrageGreatsSoldiers","GLOBAL",1)~
== C#BrageJ @23
== AMNIS @24
== C#BrageJ @25
EXIT

CHAIN 
IF WEIGHT #-1
~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)
Global("C#BE_BrageGreatsSoldiers","GLOBAL",2)
Global("C#BE_ITalked","LOCALS",0)~ THEN AMNIS greeting_3
@26 DO ~SetGlobal("C#BE_ITalked","LOCALS",1) IncrementGlobal("C#BE_BrageGreatsSoldiers","GLOBAL",1)~
== C#BrageJ @27
== AMNIS @28
EXIT

CHAIN 
IF WEIGHT #-1
~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)
Global("C#BE_BrageGreatsSoldiers","GLOBAL",3)
Global("C#BE_ITalked","LOCALS",0)~ THEN AMNIS greeting_4
@29 DO ~SetGlobal("C#BE_ITalked","LOCALS",1) IncrementGlobal("C#BE_BrageGreatsSoldiers","GLOBAL",1)~
== C#BrageJ @30
EXIT

/* Tessa's friend */
BEGIN c#be1grl
CHAIN
IF ~Global("C#BE_NashkelGirl","GLOBAL",1)~ THEN c#be1grl girl
@31 DO ~SetGlobal("C#BE_NashkelGirl","GLOBAL",2)~
== C#BrageJ @32
== c#be1grl @33
== C#BrageJ @34
EXIT


/* inside the barracks */

CHAIN
IF ~Global("C#BE_InsideNashkelBarracks","GLOBAL",1)~ THEN C#BrageJ inside_barracks
@35
== C#BrageJ IF ~GlobalGT("C#LC_BardolanMoves","GLOBAL",0)~ THEN @36
END
IF ~~ THEN DO ~SetGlobal("C#BE_InsideNashkelBarracks","GLOBAL",2)~ EXIT


/* Nashkel Carnival */
CHAIN
IF ~Global("C#BE_NashkelCarnival","GLOBAL",1)~ THEN C#BrageJ nashkel_carnival
@37 DO ~SetGlobal("C#BE_NashkelCarnival","GLOBAL",2)~
== %JAHEIRA_JOINED% IF ~InParty("Jaheira") See("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @38
== C#BrageJ IF ~InParty("Jaheira") See("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @39
== %JAHEIRA_JOINED% IF ~InParty("Jaheira") See("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @40
== %AJANTIS_JOINED% IF ~InParty("Ajantis") See("Ajantis") !StateCheck("Ajantis",CD_STATE_NOTVALID)~ THEN @41
== C#BrageJ IF ~InParty("Ajantis") See("Ajantis") !StateCheck("Ajantis",CD_STATE_NOTVALID)~ THEN @42
== %IMOEN_JOINED% IF ~InParty("%IMOEN_DV%") See("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @43
== C#BrageJ IF ~InParty("%IMOEN_DV%") See("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @44
== %IMOEN_JOINED% IF ~InParty("%IMOEN_DV%") See("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @45
== C#BrageJ IF ~InParty("%IMOEN_DV%") See("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @46
== %IMOEN_JOINED% IF ~InParty("%IMOEN_DV%") See("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @47
== C#BrageJ IF ~InParty("%IMOEN_DV%") See("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @48
EXIT

/* Lotus tent */

CHAIN
IF ~Global("C#BE_NashkelCarnivalLotus","GLOBAL",1)~ THEN C#BrageJ nashkel_carnival_lotus
@49 DO ~SetGlobal("C#BE_NashkelCarnivalLotus","GLOBAL",2)~
== %IMOEN_JOINED% IF ~InParty("%IMOEN_DV%") See("%IMOEN_DV%") !StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @50
== %AJANTIS_JOINED% IF ~InParty("Ajantis") See("Ajantis") !StateCheck("Ajantis",CD_STATE_NOTVALID)~ THEN @51
== C#BrageJ @52
= @53
EXIT

/* war dogs in mine cabin */

APPEND C#BrageJ

IF ~GlobalGT("C#BE_TameDogsNashkel","GLOBAL",0)
!Global("C#BE_TameDogsNashkel","GLOBAL",7)~ THEN wardogs
SAY @54
IF ~~ THEN DO ~ClearAllActions() SetGlobal("C#BE_TameDogsNashkel","GLOBAL",7)~ EXIT
END

END //APPEND

/* Amnish guards Nashkel mine entrance */
I_C_T AMNIS3 0 C#BE_AMNIS3_0
== AMNIS3 IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @55
END

/* level 1 */
I_C_T AMNIS3 1 C#BE_AMNIS3_1
== AMNIS3 IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @56
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @57
END

/* level 2 */
CHAIN 
IF WEIGHT #-1
~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)
Global("C#BE_AMNIS4","GLOBAL",0)~ THEN AMNIS4 greeting
@58 DO ~SetGlobal("C#BE_AMNIS4","GLOBAL",1)~
== C#BrageJ @59
EXIT



/* Mulahey */
I_C_T2 MULAHE 1 C#BE_MULAHE_1
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @270 /* ~<CHARNAME>... my heart bleeds by the thought of this monster going unpunished, but I see he is but a minion in what seems to be a deep levelled conspiracy. I bow to your decision how to deal with this culprit.~ */
END

I_C_T2 MULAHE 2 C#BE_MULAHE_2
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @271 /* ~You... you detestable scoundrel! So this Tazok is not here to find? You are but another minion in this cascade of horror? We will bring you to justice, and we will find your master, and we will find this "D." who sent the cursed sword my way!~ */
END

I_C_T2 MULAHE 6 C#BE_MULAHE_2 //will only play if it didn't before
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @271 /* ~You... you detestable scoundrel! So this Tazok is not here to find? You are but another minion in this cascade of horror? We will bring you to justice, and we will find your master, and we will find this "D." who sent the cursed sword my way!~ */
END


 
APPEND C#BrageJ



/* reactions and interjections */
/* special talks */


/* AR4100 Archaeological Site - reaction to the Caravan site */

IF ~Global("C#BE_BrageCaravan","GLOBAL",1)~ THEN caravan
SAY @60
++ @61 + caravan_01
++ @62 + caravan_01
++ @63 + caravan_01
END

IF ~~ THEN caravan_01
SAY @64
IF ~~ THEN DO ~SetGlobal("C#BE_BrageCaravan","GLOBAL",2)~ EXIT
END

/* inside the mines (chapter < 3 ) */

IF ~Global("C#BE_InsideNashkelMines","GLOBAL",1)~ THEN inside_mines
SAY @65
IF ~~ THEN DO ~SetGlobal("C#BE_InsideNashkelMines","GLOBAL",2)~ EXIT
END




/* Mulahey defeated with Brage */

IF ~Global("C#BE_BrageNashkelMines","GLOBAL",1)~ THEN cleared_nashkelmines
SAY @66
= @67
IF ~~ THEN DO ~SetGlobal("C#BE_BrageNashkelMines","GLOBAL",2)~ EXIT
END


/* Tazok... */
/* bandit camp cleared */

IF ~Global("C#BE_BrageClearedBanditCamp","GLOBAL",1)~ THEN cleared_nashkelmines
SAY @68 /* ~Ah, this does not feel like a victory. I kept my mouth shut and followed your lead in confronting this Tazok because I am well aware that he is but another minion and not the one who initiated the sword to be sent to me. Yet, his escape leaves a foul taste in the mouth nontheless.~ */
= @69 /* ~Or maybe it is a chance - a chance to pursue him and catch him at the side of his masters. New names we learned today - "Davaeorn", is he the "D." Tazok mentioned in the letter you found with the vendor of cursed items? And who is "Sarevok"?~ */
= @269 /* ~We destroyed the bandits' hideout... Only to learn that there is even more to do before we stop the threat and find the ones behind the cursed sword. Still, we did good, <CHARNAME>. We helped a lot of people by removing most of the bandit activities from the roads. We're just not done yet, is all.~ */
IF ~~ THEN DO ~SetGlobal("C#BE_BrageClearedBanditCamp","GLOBAL",2) SetGlobal("C#BE_KnowsDavaeornsName","GLOBAL",1)~ EXIT
END


/* inside Baldur's Gate */
IF ~Global("C#BE_InsideBaldursGate","GLOBAL",1)~ THEN inside_bg
SAY @272 /* ~Never would I have imagined to come to Baldur's Gate as a civilian... I dreaded to come here as a military force not so long ago.~ */
= @273 /* ~It is interesting to meet the Second-in-Command Scar in person. I know his name well from his military achievements in Maztica, but I am very sure he doesn't know me as the Amnian Captain I was. I suggest we leave it at that, no need to raise suspicion.~ */
++ @274 /* ~Scar was in Maztica?~ */ + inside_bg_01
++ @275 /* ~Sure, let's get on moving.~ */ + inside_bg_02
END

IF ~~ THEN inside_bg_01
SAY @276 /* ~Yes, Baldur's Gate and Amn both fought for influence there then. The Flaming Fist is not only active in Baldur's Gate and surrounding lands. They also have bases in Chult and Anchorome, as well as far as Tethyr.~ */
IF ~~ THEN + inside_bg_02
END

IF ~~ THEN inside_bg_02
SAY @277 /* ~Scar seems like a respectable, honorable man. I am glad I do not have to meet him as a member of another land's military force, and I hope we won't ever have to confront him as an enemy.~ */
IF ~~ THEN DO ~SetGlobal("C#BE_InsideBaldursGate","GLOBAL",2)~ EXIT
END

END //APPEND


/* Davaeorn */
/* upon learning the name inside the mine */
I_C_T CANTIC 0 C#BE_KnowsDavaeornsName
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @278 /* ~Davaeorn! Would he be the mysterious "D." behind all this?!~ */
END

I_C_T FABER 0 C#BE_KnowsDavaeornsName
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @278 /* ~Davaeorn! Would he be the mysterious "D." behind all this?!~ */
== FABER IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN 
@279 /* ~No, you are no guards at all! Aaaaaaaahh!~ */
END

I_C_T IRON5 1 C#BE_KnowsDavaeornsName
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @278 /* ~Davaeorn! Would he be the mysterious "D." behind all this?!~ */
== IRON5 IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN 
@280 /* ~Well, I'll make sure you will not find out!~ */
END

I_C_T IRON5 2 C#BE_KnowsDavaeornsName
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @278 /* ~Davaeorn! Would he be the mysterious "D." behind all this?!~ */
== IRON5 IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN 
@280 /* ~Well, I'll make sure you will not find out!~ */
END

I_C_T IRON5 3 C#BE_KnowsDavaeornsName
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @278 /* ~Davaeorn! Would he be the mysterious "D." behind all this?!~ */
END

I_C_T IRON9 2 C#BE_KnowsDavaeornsName
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @278 /* ~Davaeorn! Would he be the mysterious "D." behind all this?!~ */
END

I_C_T IRON9 3 C#BE_KnowsDavaeornsName
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @278 /* ~Davaeorn! Would he be the mysterious "D." behind all this?!~ */
END

I_C_T MINEC3 0 C#BE_KnowsDavaeornsName
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @278 /* ~Davaeorn! Would he be the mysterious "D." behind all this?!~ */
END

I_C_T MINEC4 2 C#BE_KnowsDavaeornsName
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @278 /* ~Davaeorn! Would he be the mysterious "D." behind all this?!~ */
END

I_C_T PHAERS 1 C#BE_KnowsDavaeornsName
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @278 /* ~Davaeorn! Would he be the mysterious "D." behind all this?!~ */
== PHAERS IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN 
@281 /* ~No idea who you are looking for! I'll be on my way!~ */
END

I_C_T TIPIAN 2 C#BE_KnowsDavaeornsName
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @278 /* ~Davaeorn! Would he be the mysterious "D." behind all this?!~ */
== TIPIAN IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN 
@282 /* ~Probably. Make sure you give him my "greetings" when you meet him, will you?~ */
END

/* Davaeorn confronting */
I_C_T DAVAEO 0 C#BE_DAVAEO_0
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @283 /* ~Davaeorn! Long have we searched for you! in the name of my beloved wife and children, it was your doing it came to this! You will pay for what you did!~ */
== DAVAEO IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN 
@284 /* ~And who would be you? It matters not. You will die today!~ */
END

APPEND C#BrageJ

/* Davaeorn defeated */
IF ~Global("C#BE_DefeatedDavaeorn","GLOBAL",1)~ THEN davaeorn_dead
SAY @285 /* ~Dead! He is dead! The man who sent the cursed sword to me as a "diversion" for the Nashkel Guard! The man who regarded my life, and with it my family, my comrades, innocents as disposable pawns in his game for power and riches.~ */
= @286 /* ~I will cherish this moment, <CHARNAME>. Just for a short moment... And then we will march on, to the next level of this conspiracy.~ */
IF ~~ THEN DO ~SetGlobal("C#BE_DefeatedDavaeorn","GLOBAL",2)~ EXIT
END


/* learning the name Rieltar from various letters */
/* "SCRLDRA" "SCRL2S" "SCRL2T" "SCRL2U" */

IF ~Global("C#BE_KnowRieltarsName","GLOBAL",1)~ THEN rieltars_name
SAY @287 /* ~Mulahey, Tazok, Davaeorn, Sarevok - and now Rieltar... More names on our list, <CHARNAME>. (clenches his teeth) Let us continue on our pursuit!~ */
IF ~~ THEN DO ~SetGlobal("C#BE_KnowRieltarsName","GLOBAL",2)~ EXIT
END

END //APPEND


/* Scar is murdered */

ADD_TRANS_ACTION ~DELTHY~ BEGIN 5 END BEGIN END
~SetGlobal("C#BE_KnowScarMurder","GLOBAL",1)~

ADD_TRANS_ACTION ~HUSAM~ BEGIN 20 END BEGIN END
~SetGlobal("C#BE_KnowScarMurder","GLOBAL",1)~

ADD_TRANS_ACTION ~HUSAM2~ BEGIN 6 END BEGIN END
~SetGlobal("C#BE_KnowScarMurder","GLOBAL",1)~

ADD_TRANS_ACTION ~JHASSO~ BEGIN 11 END BEGIN END
~SetGlobal("C#BE_KnowScarMurder","GLOBAL",1)~

ADD_TRANS_ACTION ~KOLVAR~ BEGIN 6 10 END BEGIN END
~SetGlobal("C#BE_KnowScarMurder","GLOBAL",1)~

ADD_TRANS_ACTION ~NEB~ BEGIN 3 END BEGIN END
~SetGlobal("C#BE_KnowScarMurder","GLOBAL",1)~

ADD_TRANS_ACTION ~TAMOKO~ BEGIN 3 6 7 END BEGIN END
~SetGlobal("C#BE_KnowScarMurder","GLOBAL",1)~

CHAIN
IF ~Global("C#BE_ScarMurderTalk","GLOBAL",1)~ THEN C#BrageJ scar_murder
@288 /* ~Scar is... is murdered?~ */
== C#BrageJ IF ~Global("RescuedEltan","GLOBAL",0)~ THEN @289 /* ~And Lord Eltan is dying? This reaks of conspiracy, <CHARNAME>.~ */
== C#BrageJ @290 /* ~For the sake of preventing the upcoming war with my home land! We need to clear our name and prove it is not Amn's doing!~ */
END
++ @291 /* ~I totally agree with you, Brage. I could rage and wail about Scar's death, he was such a good man!~ */ + scar_murder_01
++ @292 /* ~We'll see what we can do.~ */ + scar_murder_02
++ @293 /* ~Whatever. I really wished people could deal with their own problems for once.~ */ + scar_murder_02

APPEND C#BrageJ

IF ~~ THEN scar_murder_01
SAY @294 /* ~That he was indeed...~ */
IF ~~ THEN + scar_murder_02
END

IF ~~ THEN scar_murder_02
SAY @295 /* ~Let's go and prevent this war - never would I have thought it would come this close.~ */
IF ~~ THEN DO ~SetGlobal("C#BE_ScarMurderTalk","GLOBAL",2)~ EXIT
END

END //APPEND


/* working with Husam */

I_C_T HUSAM2 6 C#BE_HUSAM2_6
== C#BrageJ IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN @296 /* ~<CHARNAME>, I must warn you - the Shadow Thieves are a powerful organisation who spread their poisonous influence all over Amn. The members are shady as they are evil, I would not trust this man, regardless of how much it aches me that this crime is blamed upon Amn.~ */
== HUSAM2 IF ~InParty("C#Brage") See("C#Brage") !StateCheck("C#Brage",CD_STATE_NOTVALID)~ THEN 
@297 /* ~Well, now I do feel offended. We Shadow Thieves are shady and evil, but we do have a code of honor. I told you what I know, and it is the truth.~ */
END


/* Bhaal heritage: detection after Tamoko's dialogue */

ADD_TRANS_ACTION ~TAMOKO~ BEGIN 14 15 16 17 18 END BEGIN END
~SetGlobal("C#BE_KnowOfBhaalTamoko","GLOBAL",1)~


APPEND C#BrageJ

/* Reaction to Bhaal heritage */

IF ~Global("C#BE_KnowOfBhaal","GLOBAL",2)~ THEN bhaalchild
SAY @70
++ @71 + bhaalchild_01
++ @72 + bhaalchild_01
++ @73 + bhaalchild_02
++ @74 + bhaalchild_03
END

IF ~~ THEN bhaalchild_01
SAY @75
IF ~~ THEN + bhaalchild_03
END

IF ~~ THEN bhaalchild_02
SAY @76
IF ~~ THEN + bhaalchild_03
END

END //APPEND

CHAIN
IF ~~ THEN C#BrageJ bhaalchild_03
@77
== C#BrageJ IF ~OR(2)
ReputationLT(Player1,10)
Alignment(Player1,MASK_EVIL)~ THEN @251
== C#BrageJ @268
END
++ @78 + bhaalchild_04
++ @79 + bhaalchild_04
++ @80 + bhaalchild_04


APPEND C#BrageJ

IF ~~ THEN bhaalchild_04
SAY @81
IF ~~ THEN DO ~SetGlobal("C#BE_KnowOfBhaal","GLOBAL",3)~ EXIT
END


//* after the scene in the Ducal Palace */

IF ~Global("C#BE_DukesSaved","GLOBAL",1)~ THEN dukes_saved
SAY @82  
IF ~~ THEN DO ~SetGlobal("C#BE_DukesSaved","GLOBAL",2)~ EXIT
END



/* Final Dialoge BG1 */

/* BGT, SoD: after Sarevok is defeated (for BG:EE with EBG1 this dialogue will trigger after Sarevok is dead). */
IF ~Global("C#BE_LastBG1Dialogue","GLOBAL",1)
Dead("Sarevok")~ THEN final
SAY @83
IF ~~ THEN + final_01
END

/* BG:EE without EBG1: in the Undercity before confronting Sarevok */
IF ~Global("C#BE_LastBG1Dialogue","GLOBAL",1)
!Dead("Sarevok")~ THEN final_bgee
SAY @84
IF ~~ THEN + final_01
END

IF ~~ THEN final_01
SAY @85
++ @86 + final_03
++ @87 + final_02
END

IF ~~ THEN final_02
SAY @88
IF ~~ THEN + final_03
END

IF ~~ THEN final_03
SAY @89
IF ~~ THEN DO ~SetGlobal("C#BE_LastBG1Dialogue","GLOBAL",2)~ EXIT
END




/* crossmod with Grey the Dog: Brage's Gauntlets of Weapon Skill */

IF ~Global("C#BE_GreyCrossmodGauntlets","GLOBAL",1)~ THEN gauntlets_greythedog
SAY @91
IF ~~ THEN DO ~SetGlobal("C#BE_GreyCrossmodGauntlets","GLOBAL",2)~ EXIT
END


/* bad rep comment */

IF ~Global("C#BE_BadRepWarning","GLOBAL",1)~ THEN bad_rep
SAY @92
IF ~~ THEN DO ~SetGlobal("C#BE_BadRepWarning","GLOBAL",2)~ EXIT
END 


/* Brage - PC dialogues */

/* Poppies... */
IF ~Global("C#BE_BrageTalkPoppies","GLOBAL",1)~ THEN poppies
SAY @93
= @94
= @95
= @96
IF ~~ THEN DO ~SetGlobal("C#BE_BrageTalkPoppies","GLOBAL",2)~ EXIT
END



/* rest talk: pictures of his family */
IF ~Global("C#BE_BrageTalksBrooch","GLOBAL",1)~ THEN brooch
SAY @97
++ @98 + brooch_01
++ @99 + brooch_02
++ @100 + brooch_02
++ @101 + brooch_01
END

IF ~~ THEN brooch_01
SAY @102
IF ~~ THEN DO ~SetGlobal("C#BE_BrageTalksBrooch","GLOBAL",2) RestParty()~ EXIT
END

IF ~~ THEN brooch_02
SAY @103
= @104
= @105
IF ~~ THEN + brooch_01
END


/* timered talks */
IF ~Global("C#BE_BrageTalks","GLOBAL",2)~ THEN reflection
SAY @106
= @107
++ @108 + reflection_02
++ @109 + reflection_03
++ @110 + reflection_01
END

END //APPEND

CHAIN
IF ~~ THEN C#BrageJ reflection_01
@111

/* in case HC killed Laryssa */
== C#BrageJ IF ~Dead("Laryssa")~ THEN @112
END
IF ~~ THEN DO ~SetGlobal("C#BE_BrageTalks","GLOBAL",3)~ EXIT


APPEND C#BrageJ

IF ~~ THEN reflection_02
SAY @113
IF ~~ THEN + reflection_01
END

IF ~~ THEN reflection_03
SAY @114
IF ~~ THEN + reflection_02
END


/* 2nd friendtalk */

IF ~Global("C#BE_BrageTalks","GLOBAL",4)~ THEN cursed_sword 
SAY @115
++ @116 + cursed_sword_01
++ @117 + cursed_sword_01
++ @118 + cursed_sword_02
END

IF ~~ THEN cursed_sword_01
SAY @119
= @120
= @121
IF ~~ THEN DO ~IncrementGlobal("C#BE_BrageTalks","GLOBAL",1)~ EXIT
END

IF ~~ THEN cursed_sword_02
SAY @122
IF ~~ THEN DO ~IncrementGlobal("C#BE_BrageTalks","GLOBAL",1)~ EXIT
END



/* 3rd friendtalk */

IF ~Global("C#BE_BrageTalks","GLOBAL",6)~ THEN abouthc 
SAY @123
++ @124 + abouthc_01
++ @125 + abouthc_02
END

IF ~~ THEN abouthc_01
SAY @126
++ @127 + abouthc_04
++ @128 + abouthc_04
++ @129 + abouthc_03
++ @125 + abouthc_02
END

IF ~~ THEN abouthc_02
SAY @130
IF ~~ THEN DO ~IncrementGlobal("C#BE_BrageTalks","GLOBAL",1)~ EXIT
END

IF ~~ THEN abouthc_03
SAY @131
IF ~~ THEN + abouthc_04
END

IF ~~ THEN abouthc_04
SAY @132
IF ~~ THEN + abouthc_05
END

IF ~~ THEN abouthc_05
SAY @133
IF ~~ THEN DO ~IncrementGlobal("C#BE_BrageTalks","GLOBAL",1)~ EXIT
END



/* 4th friendship talk */
IF ~Global("C#BE_BrageTalks","GLOBAL",8)~ THEN friendtalk3 //is now no. 4
SAY @134
= @135
++ @136 + friendtalk3_01
++ @137 + friendtalk3_01
++ @138 + friendtalk3_01
++ @139 + friendtalk3_02
END

IF ~~ THEN friendtalk3_01
SAY @140
IF ~~ THEN DO ~IncrementGlobal("C#BE_BrageTalks","GLOBAL",1)~ EXIT
END

IF ~~ THEN friendtalk3_02
SAY @141
IF ~~ THEN DO ~IncrementGlobal("C#BE_BrageTalks","GLOBAL",1)~ EXIT
END


/* 5th friendtalk */
IF ~Global("C#BE_BrageTalks","GLOBAL",10)~ THEN friendtalk4 //is now no.5
SAY @142
++ @143 + friendtalk4_02
++ @144 + friendtalk4_01
END

IF ~~ THEN friendtalk4_01
SAY @145
IF ~~ THEN DO ~IncrementGlobal("C#BE_BrageTalks","GLOBAL",1)~ EXIT
END

IF ~~ THEN friendtalk4_02
SAY @146
= @147
++ @148 + friendtalk4_04
++ @149 + friendtalk4_03
++ @150 + friendtalk4_05
++ @151 + friendtalk4_01
END

IF ~~ THEN friendtalk4_03
SAY @152
IF ~~ THEN + friendtalk4_04
END

IF ~~ THEN friendtalk4_04
SAY @153
= @154
= @155
IF ~~ THEN DO ~IncrementGlobal("C#BE_BrageTalks","GLOBAL",1)~ EXIT
END

IF ~~ THEN friendtalk4_05
SAY @156
IF ~~ THEN + friendtalk4_04
END


/* 6th friendtalk */
IF ~Global("C#BE_BrageTalks","GLOBAL",12)~ THEN friendtalk2 //is now no.6
SAY @157
++ @158 + friendtalk2_03
++ @159 + friendtalk2_02
++ @160 + friendtalk2_05
++ @161 + friendtalk2_01
END


IF ~~ THEN friendtalk2_01
SAY @162
IF ~~ THEN DO ~IncrementGlobal("C#BE_BrageTalks","GLOBAL",1)~ EXIT
END

IF ~~ THEN friendtalk2_02
SAY @163
IF ~~ THEN + friendtalk2_03
END

IF ~~ THEN friendtalk2_03
SAY @164 
IF ~~ THEN + friendtalk2_04
END

IF ~~ THEN friendtalk2_04
SAY @165
= @166
++ @167 + friendtalk2_06
++ @168 + friendtalk2_07
++ @169 + friendtalk2_06
++ @170 + friendtalk2_06
++ @171 + friendtalk2_08
++ @172 + friendtalk2_01
END

IF ~~ THEN friendtalk2_05
SAY @173
IF ~~ THEN + friendtalk2_04
END

IF ~~ THEN friendtalk2_06
SAY @174
= @175
IF ~~ THEN DO ~IncrementGlobal("C#BE_BrageTalks","GLOBAL",1)~ EXIT
END

IF ~~ THEN friendtalk2_07
SAY @176
IF ~~ THEN + friendtalk2_06
END

IF ~~ THEN friendtalk2_08
SAY @177
IF ~~ THEN + friendtalk2_06
END


/* 7th friendtalk */
IF ~Global("C#BE_BrageTalks","GLOBAL",14)~ THEN friendtalk5 //is no no. 7
SAY @178
++ @179 + friendtalk5_01
++ @180 + friendtalk5_02
++ @181 + friendtalk5_03
END

IF ~~ THEN friendtalk5_01
SAY @182
IF ~~ THEN + friendtalk5_02
END

IF ~~ THEN friendtalk5_02
SAY @183
= @184
++ @185 + friendtalk5_04
++ @186 + friendtalk5_05
++ @187 + friendtalk5_05
++ @188 + friendtalk5_06 
++ @189 + friendtalk5_03
END

IF ~~ THEN friendtalk5_03
SAY @190
IF ~~ THEN DO ~SetGlobal("C#BE_BrageTalks","GLOBAL",99)~ EXIT
END

IF ~~ THEN friendtalk5_04
SAY @191
IF ~~ THEN + friendtalk5_07
END 

IF ~~ THEN friendtalk5_05
SAY @192
IF ~~ THEN + friendtalk5_07
END 

IF ~~ THEN friendtalk5_06
SAY @193
IF ~~ THEN DO ~IncrementGlobal("C#BE_BrageTalks","GLOBAL",1)~ EXIT
END

IF ~~ THEN friendtalk5_07
SAY @194
++ @195 + friendtalk5_08
++ @196 + friendtalk5_10
++ @197 + friendtalk5_06
END

IF ~~ THEN friendtalk5_08
SAY @198
++ @199 + friendtalk5_09
++ @200 + friendtalk5_06
END

IF ~~ THEN friendtalk5_09
SAY @201
IF ~~ THEN + friendtalk5_06
END

IF ~~ THEN friendtalk5_10
SAY @202
++ @203 + friendtalk5_09
++ @204 + friendtalk5_11
++ @197 + friendtalk5_06
END

IF ~~ THEN friendtalk5_11
SAY @205
IF ~~ THEN + friendtalk5_06
END



/* 8th friendtalk */
IF ~Global("C#BE_BrageTalks","GLOBAL",16)~ THEN friendtalk6  //is now no. 8
SAY @206
++ @207 + friendtalk6_01
++ @208 + friendtalk6_01
++ @209 + friendtalk6_01
++ @210 + friendtalk6_02
++ @211 + friendtalk5_03
END

IF ~~ THEN friendtalk6_01
SAY @212
++ @213 +friendtalk6_03
++ @214 + friendtalk6_03
++ @215 + friendtalk6_03
++ @216 + friendtalk5_03 //ends friendship talks
END

IF ~~ THEN friendtalk6_02
SAY @217
= @218
= @219
= @220
IF ~~ THEN DO ~IncrementGlobal("C#BE_BrageTalks","GLOBAL",1)~ EXIT
END

IF ~~ THEN friendtalk6_03
SAY @221
IF ~~ THEN + friendtalk6_02
END



/* now happens graveyard incident */



/* 9th friendtalk */
IF ~Global("C#BE_BrageTalks","GLOBAL",18)~ THEN howareyou
SAY @237 
= @238
+ ~GlobalGT("C#BE_KnowOfBhaal","GLOBAL",0)~ + @239 + howareyou_01
++ @240 + howareyou_02
++ @241 + howareyou_03
++ @242 + howareyou_02
++ @243 + howareyou_05
END

IF ~~ THEN howareyou_01
SAY @244
++ @240 + howareyou_02
++ @241 + howareyou_03
++ @242 + howareyou_03
++ @243 + howareyou_05
END

IF ~~ THEN howareyou_02
SAY @245
++ @241 + howareyou_03
++ @246 + howareyou_05
++ @243 + howareyou_05
END

IF ~~ THEN howareyou_03
SAY @247
++ @248 + howareyou_04
++ @249 + howareyou_04
++ @250 + howareyou_06
END

IF ~~ THEN howareyou_04
SAY @254
IF ~~ THEN + howareyou_05
END

IF ~~ THEN howareyou_05
SAY @252
IF ~~ THEN DO ~IncrementGlobal("C#BE_BrageTalks","GLOBAL",1)~ EXIT
END

IF ~~ THEN howareyou_06
SAY @253
IF ~~ THEN DO ~IncrementGlobal("C#BE_BrageTalks","GLOBAL",1)~ EXIT
END



/* 10th friendship talk */
IF ~Global("C#BE_BrageTalks","GLOBAL",20)~ THEN friendtalk7 // is now number 10
SAY @222
= @223
= @224
= @225
++ @226 + friendtalk7_02
++ @227 + friendtalk7_05
++ @228 + friendtalk7_02
++ @229 + friendtalk7_04
++ @230 + friendtalk7_01
++ @231 + friendtalk7_05
END

IF ~~ THEN friendtalk7_01
SAY @232
IF ~~ THEN + friendtalk7_03
END

IF ~~ THEN friendtalk7_02
SAY @233
IF ~~ THEN + friendtalk7_01
END

IF ~~ THEN friendtalk7_03
SAY @234
IF ~~ THEN DO ~IncrementGlobal("C#BE_BrageTalks","GLOBAL",1)
RealSetGlobalTimer("C#BE_BrageDialogueTimer","GLOBAL",800)~ EXIT //shorter timer
END

IF ~~ THEN friendtalk7_04
SAY @235
IF ~~ THEN + friendtalk7_01
END

IF ~~ THEN friendtalk7_05
SAY @236
IF ~~ THEN + friendtalk7_03
END  


/* 11th friendship talk */
IF ~Global("C#BE_BrageTalks","GLOBAL",22)~ THEN bettysface
SAY @255
++ @256 + bettysface_07
++ @257 + bettysface_01
++ @258 + bettysface_02
++ @259 + bettysface_05
++ @260 + bettysface_06
END

IF ~~ THEN bettysface_01
SAY @261
IF ~~ THEN + bettysface_02
END

IF ~~ THEN bettysface_02
SAY @262
IF ~~ THEN + bettysface_03
END

IF ~~ THEN bettysface_03
SAY @263
IF ~~ THEN + bettysface_04
END

IF ~~ THEN bettysface_04
SAY @264
IF ~~ THEN DO ~IncrementGlobal("C#BE_BrageTalks","GLOBAL",1)~ EXIT
END

IF ~~ THEN bettysface_05
SAY @265
IF ~~ THEN + bettysface_02
END

IF ~~ THEN bettysface_06
SAY @266
IF ~~ THEN DO ~IncrementGlobal("C#BE_BrageTalks","GLOBAL",1)~ EXIT
END 

IF ~~ THEN bettysface_07
SAY @267
++ @257 + bettysface_01
++ @258 + bettysface_02
++ @259 + bettysface_05
++ @260 + bettysface_06
END





END //APPEND

