CHAIN
IF WEIGHT #-1
~Global("C#BE_SoDleavingcomment","global",1)~ THEN C#BrageJ leaving_comment
@3 /* ~When we are done and part ways, I will go in search of the maker of the cursed sword. I will travel to Waterdeep and begin my investigation at the smith of the actual sword - the forgery bore their seal, after all. Not that I really expect to find anything there, but I need to follow up on this lead.~ */
DO ~SetGlobal("C#BE_SoDleavingcomment","global",3)~
== C#BrageJ IF ~InParty("Ajantis") See("Ajantis") !StateCheck("Ajantis",CD_STATE_NOTVALID)
Global("X#AjantisRomanceActive","GLOBAL",2)~ THEN @4 /* ~Ajantis, if your steps guide you back to Waterdeep, we could travel together.~ */
== %AJANTIS_JOINED% IF ~InParty("Ajantis") See("Ajantis") !StateCheck("Ajantis",CD_STATE_NOTVALID)
Global("X#AjantisRomanceActive","GLOBAL",2)~ THEN @5 /* ~That is an excellent idea, Brage. I would appreciate your company on the travels.~ */
EXIT