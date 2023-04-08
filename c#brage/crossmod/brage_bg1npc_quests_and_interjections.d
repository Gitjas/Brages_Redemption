/* Imoen created her tome while Brage was around */
CHAIN
IF WEIGHT #-1
~Global("C#Brage_ImoenBG1NPCTome","GLOBAL",1)~ THEN C#BrageJ imoen_tome
@0 /* ~[Brage]Imoen! That was a rather dangerous undertaking. Magic is not a toy! What were you thinking?~ */
DO ~SetGlobal("C#Brage_ImoenBG1NPCTome","GLOBAL",2)~
== ~%IMOEN_BANTER%~ @1 /* ~[Imoen]But... but I created this beautiful tome... Aw, your tone is killing the fun, Brage. Look at how shiny it looks!~ */
== C#BrageJ @2 /* ~[Brage]So you were considering nothing and just casting magic like you would throw a pepple into a pond? Just like a pepple stirs the waters, magic might stir *anything* - unwanted and dangerous - if you don't know what you are doing!~ */
== ~%IMOEN_BANTER%~ @3 /* ~[Imoen]Aw... Why are you so agitated? I just played a little... - Are you scared? You were scared!~ */
== C#BrageJ @4 /* ~[Brage]Magic is dangerous if not handled reasonably, Imoen. I - I'm fond of your joyfulness, but *magic* is not the right place to "play a little". I fear for your safety. And ours, if I'm honest.~ */
== ~%IMOEN_BANTER%~ @5 /* ~[Imoen]Alright, I won't be reckless with it. I promise! Yes, sir! Got 'cha. Little Imoen didn't plan on frightening anyone with her attempts in magic.~ */
== C#BrageJ @6 /* ~[Brage]I know you mean it - now, so I thank you. Please, stay away from it until you have a teacher who can restrain any unwanted effects in the future. Magic is *not* a toy... and it is never to be taken lightly.~ */
EXIT