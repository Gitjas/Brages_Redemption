/* After Mourning cycle is complete, starting in BG1, SoD, or BGII depending on playing style */

APPEND ~C#BrageJ~



/* Brage's ponders about resurrecting his family - reality clashes with wishes */

/* 1. Dialog */

IF ~Global("C#BE_BrageTalksRes","GLOBAL",2)~ THEN resurrection_path_1
SAY @0 /* Meine Familie war bereits beerdigt, als ich wieder zu Sinnen kam. Sie waren... so schwer verletzt, dass eine normale Wiederbelebung nicht möglich war. Als Familie des Kommandanten hätte die Armee sie sicher sonst von Nalin wiederbeleben lassen... Ich glaubte kein recht zu haben, meine Familie herbeizuwünschen. Nun bin ich etwas zur Ruhe gekommen, und... ich vermisse sie so sehr. Die Sehnsucht nach ihnen zerreißt mir das Herz. Ach, <CHARNAME>, ich weiß nicht wohin mit dem Schmerz. Ich hätte... ich hätte sie so gerne wieder bei mir. */
++ @1 /* Das ist ein sehr verständlicher Wunsch. */ + resurrection_path_1_02
++ @2 /* Das wäre in der Tat eine ganz andere Situation gewesen. Es muss weh tun, sich das vorzustellen. */ + resurrection_path_1_02
++ @3 /* Es gibt immer noch die Möglichkeit, sie auferstehen lassen, wenn Ihr es wirklich wolltet. */ + resurrection_path_1_01
++ @4 /* Ich kann es nicht ändern, Brage. Lasst uns weitermachen. */ + resurrection_path_1_06
++ @5 /* Ich dachte, wir wären mit dem Thema durch. Muss ich mir das weiter anhören? */ + resurrection_path_1_07
END

IF ~~ THEN resurrection_path_1_01
SAY @6 /* Yes, I know! True Resurrection, or even a Wish. But it is no real choice for me in the current situation. Do not suggest it like it would be simple task! It is not, and it adds to my pain! */
IF ~~ THEN + resurrection_path_1_02
END

IF ~~ THEN resurrection_path_1_02
SAY @7 /* Als Kommandant hätte ich Mittel und Wege gefunden, meine Familie trotzdem wiederauferstehen zu lassen. Für eine Familie eines Kommandanten hätte Amn mir entsprechende Klerikale Unterstützung ermöglicht. Diese Möglichkeiten habe ich nun nicht mehr. Mit dem Verlust meines Kommandos habe ich nicht nur den Sold verloren, mit dem ich eine lebende Familie ernähren würde, sondern auch die nötige Unterstützung, ihnen wieder zu Leben verhelfen zu können. */
++ @8 /* That is harsh, knowing there would have been possibilities that now are closed off. */ + resurrection_path_1_05
++ @9 /* Also hat Ghastkill, als er Euch unehrenhaft entlassen hat, sozusagen Eure Familie zum Tode verdammt?! */ + resurrection_path_1_03
++ @10 /* Aber diese Verbindungen müsste es doch noch geben? Könnt Ihr nicht einfach nachfragen? */ + resurrection_path_1_04
++ @4 /* Ich kann es nicht ändern, Brage. Lasst uns weitermachen. */ + resurrection_path_1_06
++ @5 /* Ich dachte, wir wären mit dem Thema durch. Muss ich mir das weiter anhören? */ + resurrection_path_1_07
END

IF ~~ THEN resurrection_path_1_03
SAY @11 /* Nein, so sehe ich das nicht, <CHARNAME>. Tot waren sie bereits. Tot und begraben... */
IF ~~ THEN + resurrection_path_1_04
END

IF ~~ THEN resurrection_path_1_04
SAY @12 /* Es waren Möglichkeiten, die höheren Rängen der Armeeoffiziere und Kommandanten offen standen, keine persönlichen Bekanntschaften von mir. Diese Wege wurden mir verschlossen, als ich das verfluchte Schwert aufnahm und als Kommandant versagte. */
IF ~~ THEN + resurrection_path_1_05
END

IF ~~ THEN resurrection_path_1_05
SAY @13 /* Selbst mit den Möglichkeiten, sie Auferstehen zu lassen, hätte es mich eine Menge Gold gekostet, dies wahrzunehmen. Selbst, wenn ich die von mir zerrissenen Familien nicht unterstützen würde, hätte all mein Besitz nicht ausgreicht. Es hätte einen reichen Gönner gebraucht... Selbst wenn ich noch Soldat wäre - mit dem Makel, von böser Magie besessen gewesen zu sein, traut niemand in den höheren Rängen mehr meiner Integrität. */
IF ~~ THEN + resurrection_path_1_06
END

IF ~~ THEN resurrection_path_1_06
SAY @14 /* Wenn ich nie dieses Schwert genommen hätte - ich nicht meine Stellung als Kommandant verloren hätte. Wenn sie nicht so schwer verletzt gewesen wären... Was sage ich denn da. Wenn ich dieses verfluchte Schwert nicht aufgenommen hätte, dann wären sie ja noch am Leben! */
IF ~~ THEN DO ~IncrementGlobal("C#BE_BrageTalksRes","GLOBAL",1)~ EXIT
END

IF ~~ THEN resurrection_path_1_07
SAY @15 /* Nein, müsst Ihr nicht. */
IF ~~ THEN DO ~IncrementGlobal("C#BE_BrageTalksRes","GLOBAL",1)~ EXIT
END

/* 2. Dialog */
IF ~Global("C#BE_BrageTalksRes","GLOBAL",4)~ THEN resurrection_path_2
SAY @16 /* Ich bin wahrlich niemand, der einen Anspruch darauf hätte, dass meine Familie wieder zu mir zurückkommt. So überzeugt davon war ich, dass ich gar nicht auf die Idee kam, dass es nicht meine Entscheidung ist, ob sie wiedererweckt werden sollten oder nicht! Meine Frau hätte die Entscheidung treffen sollen - sie hätte zumindest die Möglichkeit haben sollen. */
++ @17 /* Ich verstehe den Gedanken, Brage. Es ist sehr ungerecht. */ + resurrection_path_2_01
++ @18 /* Sie ist aber nunmal tot, Brage. */ + resurrection_path_2_02
++ @19 /* Hätte, können, sollen. Es gab aber die Möglichkeit nicht, ihnen eine Auferstehung anzubieten. */ + resurrection_path_2_02
++ @20 /* Ihr verliert Euch in Wunschgedanken. Reißt Euch zusammen, das bringt Euch nicht weiter. */ + resurrection_path_2_02 
++ @21 /* Brage, ich will darüber nicht sprechen. Last uns weiterziehen. */ + resurrection_path_2_01
END

IF ~~ THEN resurrection_path_2_01
SAY @22 /* Ich bin noch nicht im entferntesten über ihren Verlust hinweg, <CHARNAME>. Falls ich das jemals sein werde... */
IF ~~ THEN DO ~IncrementGlobal("C#BE_BrageTalksRes","GLOBAL",1)~ EXIT
END

IF ~~ THEN resurrection_path_2_02
SAY @23 /* Ich weiß, dass die Möglichkeit nicht bestand. Ich... ich verarbeite den Schmerz, sie zu vermissen. */
IF ~~ THEN + resurrection_path_2_01
END


/* 3. Dialog */
IF ~Global("C#BE_BrageTalksRes","GLOBAL",6)~ THEN resurrection_path_3
SAY @24 /* <CHARNAME>, bitte helft mir. Ich bekomme einen Gedanken nicht mehr aus meinem Kopf. */
++ @25 /* Sprecht, Brage. */ + resurrection_path_3_01
++ @26 /* Ich habe wirklich keine Lust, mir das anzuhören. */ + resurrection_path_3_06
END

IF ~~ THEN resurrection_path_3_01
SAY @27 /* Da das Gold, das ich auftreiben kann, nicht für alles reicht, war ich überzeugt, dass es richtig ist, es für die Überlebenden auszugeben. Nun bekomme ich den Gedanken nicht mehr los - ist es nicht vielmehr meine Pflicht, meiner Familie eine Auferstehung zu ermöglichen? Wäre ich es ihnen nicht schuldig - werde ich meiner Familie gerecht, wenn ich es *nicht* tue? */
++ @28 /* Ich verstehe den Gedanken, aber Ihr müsst mit dem arbeiten, was möglich ist. Das Gold reicht lange nicht für eine Auferstehung, also macht Ihr genau das richtige. */ + resurrection_path_3_02
++ @29 /* Ihr sagtet, dass Eure Frau die Entscheidung treffen sollte. Was würde sie denn dazu sagen? */ + resurrection_path_3_04
++ @30 /* Ihr müsstet trotzdem sehr lange dafür sparen, auch wenn Ihr die anderen Familien nicht mehr unterstützt. Könntet Ihr das mit Eurem Gewissen vereinbaren? */ + resurrection_path_3_02
++ @31 /* Ihr seid vor allem Eurer Familie verpfichtet. Lasst das Verplempern des Goldes für die anderen Familien, und konzentriert Euch darauf, sie ins Leben zurück zu holen! */ + resurrection_path_3_05
++ @32 /* Sie sind tot, Brage. Lasst sie ruhen, sie sind ihren Weg gegangen. */ + resurrection_path_3_02
++ @33 /* Trying to get the easy way out? You resurrect your family will not make the deed undone. */ + resurrection_path_3_08
++ @26 /* Ich habe wirklich keine Lust, mir das anzuhören. */ + resurrection_path_3_06
END

IF ~~ THEN resurrection_path_3_02
SAY @34 /* I think so, too, but the nagging feeling remains... */
IF ~~ THEN + resurrection_path_3_03
END

IF ~~ THEN resurrection_path_3_03
SAY @35 /* I thank you for your councel. */
IF ~~ THEN + resurrection_path_3_06
END

IF ~~ THEN resurrection_path_3_04
SAY @36 /* My wife... (scoffs) She would give me a good piece of her mind for even considering not supporting the other families any more. */
++ @37 /* Then it is settled. You are doing the right thing. */ + resurrection_path_3_02
++ @31 /* Ihr seid vor allem Eurer Familie verpfichtet. Lasst das Verplempern des Goldes für die anderen Familien, und konzentriert Euch darauf, sie ins Leben zurück zu holen! */ + resurrection_path_3_05
++ @32 /* Sie sind tot, Brage. Lasst sie ruhen, sie sind ihren Weg gegangen. */ + resurrection_path_3_02
++ @33 /* Trying to get the easy way out? You resurrect your family will not make the deed undone. */ + resurrection_path_3_08
++ @26 /* Ich habe wirklich keine Lust, mir das anzuhören. */ + resurrection_path_3_06
END

IF ~~ THEN resurrection_path_3_05
SAY @38 /* There is a part in my heart that thinks exactly that... and yet, all my senses of justness tell me that it would be highly selfish of me to stop supporting the other families - and that I should be scared of what would become of me, would I walk this path. */
IF ~~ THEN + resurrection_path_3_07
END 

IF ~~ THEN resurrection_path_3_06
SAY @39 /* There is no easy reply to this, only the possibility to face reality, decide in the moment what we think is best - and live on with the pain and the thoughts of "what if" which will always remain no matter the path we chose. */
= @40 /* I am decided that I am doing the right thing. But the pain of not having the means to give my family the *choice* will always be with me. Not being able to give them the chance will torment me for the rest of my life. */
IF ~~ THEN DO ~IncrementGlobal("C#BE_BrageTalksRes","GLOBAL",1)~ EXIT
END

IF ~~ THEN resurrection_path_3_07
SAY @41 /* Your councel did not ease my mind, but I see now that I only asked to get reassurance for a decision I already made. (sigh) */
IF ~~ THEN + resurrection_path_3_06
END

IF ~~ THEN resurrection_path_3_08
SAY @42 /* No - of course not. That's not what I meant. Don't you agree that it should be their choice whether they want to come back? */
IF ~~ THEN + resurrection_path_3_06
END

END //APPEND