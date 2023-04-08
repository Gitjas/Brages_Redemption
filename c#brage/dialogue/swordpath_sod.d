BEGIN C#BESMES

/* Messenger with letter from Waterdhavian Smith */

CHAIN
IF ~Global("C#Brage_SoDSwordPathMess","GLOBAL",1)~ THEN c#besmes letter
@400 /* Mister Brage? I have a letter for you, sir - from the Most Careful Order of Skilled Smiths and Metalforgers. */
== C#BrageJ @401 /* From the Most Careful Order of... Good man, this is brilliant news. I thank you for delivering this to me. */
== C#BrageJ @402 /* <CHARNAME>, this is a note about my search about the cursed sword in Waterdeep. The investigations brought some results, apparently. */
END
++ @403 /* Read it now, Brage. I know you waited for this. */ EXTERN C#BrageJ sword_letter_01
++ @404 /* I need you here and focussed, Brage. There is a crusade to be stopped, it's not over yet. */ EXTERN C#BrageJ sword_letter_04

APPEND C#BrageJ

IF ~~ THEN sword_letter_01
SAY @405 /* ... - Alright, it says they could find irregularities in the smithy's books and know who did it, but the culprit could flee. They could follow his trail but lost it in - Amn! */
++ @406 /* Is it helpful information for your search? */ + sword_letter_02
++ @404 /* I need you here and focussed, Brage. There is a crusade to be stopped, it's not over yet. */ + sword_letter_04
END

IF ~~ THEN sword_letter_02
SAY @407 /* It definitely is. With this, I will be able to search for the person who verified the false sword! */
++ @408 /* You'll have to go to Amn for this, though. */ + sword_letter_03
++ @404 /* I need you here and focussed, Brage. There is a crusade to be stopped, it's not over yet. */ + sword_letter_04
END

IF ~~ THEN sword_letter_03
SAY @409 /* Yes, I will. My home land - it seems I will have to return there, to make an end to all this. Ah, this is good news, this is progress! I can feel urge and motivation to pursue this matter returning to me, and with it, the hope to succeed in confronting the ones responsible! */
IF ~~ THEN + sword_letter_04
END

IF ~~ THEN sword_letter_04
SAY @410 /* Do not worry, my search about the cursed sword was on hold for so long, it can wait some more weeks. I will not abandon our task here over some uncertain hunt related to a crime that happened so long in the past - I would be an irresponsible fool if I did. I will, however, leave in pursuit of this as soon as possible after Caelar is defeated. */
IF ~~ THEN DO ~EraseJournalEntry(@100016)
EraseJournalEntry(@100017)
EraseJournalEntry(@100018)
EraseJournalEntry(@100019)
EraseJournalEntry(@100020)
EraseJournalEntry(@100021)
EraseJournalEntry(@100022)
EraseJournalEntry(@100023)
SetGlobal("C#Brage_SoDSwordPathMess","GLOBAL",2) 
SetGlobal("C#BE_BG1SwordPath","GLOBAL",40) ActionOverride("c#besmes",EscapeAreaDestroy(5))~ SOLVED_JOURNAL @100024 EXIT
END
END //APPEND