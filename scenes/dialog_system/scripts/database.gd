extends Node

var special_interaction_positive_01: Tuple = Tuple.new("Ja, genau so!", preload("res://scenes/dialog_system/voicelines/level3_2/build/AlgoditVoice46.wav"))
var special_interaction_positive_02: Tuple = Tuple.new("Perfekt!", preload("res://scenes/dialog_system/voicelines/level3_2/build/AlgoditVoice48_00007116.wav"))
var special_interaction_negative: Tuple = Tuple.new("Moment mal, bist du dir da sicher?", preload("res://scenes/dialog_system/voicelines/misc/negative2.wav"))



var level_01_01: Tuple = Tuple.new("Hallöchen und herzlich willkommen in meinem kleinen Tutorial zu AVL-Bäumen.", preload("res://scenes/dialog_system/voicelines/level1/search/AlgoditVoice1_00000281.wav"))
var level_01_02: Tuple = Tuple.new("Ich erkläre dir heute alles, was du zu diesen wundersamen Bäumen wissen musst.", preload("res://scenes/dialog_system/voicelines/level1/search/AlgoditVoice2_00000439.wav"))
var level_01_03: Tuple = Tuple.new("Um das Tutorial zu starten, so klicke bitte einmal auf die LINKE TÜR.", preload("res://scenes/dialog_system/voicelines/level1/search/AlgoditVoice3_00000578.wav"))

var level_01_04: Tuple = Tuple.new("Nun bitte einmal auf die RECHTE TÜR - Jaaa, genau, die mit der 35, die sieht gut aus!", preload("res://scenes/dialog_system/voicelines/level1/search/AlgoditVoice4_00000765.wav"))

var level_01_05: Tuple = Tuple.new("Und nun wieder LINKS.", preload("res://scenes/dialog_system/voicelines/level1/search/AlgoditVoice5_00000947.wav"))

var level_01_06: Tuple = Tuple.new("Einen Moment...", preload("res://scenes/dialog_system/voicelines/level1/search/AlgoditVoice6_00001065.wav"))

var level_01_07: Tuple = Tuple.new("Hier Stimmt irgendetwas nicht. Nach meinem Skript... solltest du eigentlich erst in 5 Leveln hier sein... Hmm...", preload("res://scenes/dialog_system/voicelines/level1/search/AlgoditVoice7_00001111.wav"))

var level_01_08: Tuple = Tuple.new("Ahhhhh, ich hab's!", preload("res://scenes/dialog_system/voicelines/level1/search/AlgoditVoice8_00001348.wav"))
var level_01_09: Tuple = Tuple.new("Drücke mal auf den Bilderrahmen in der Mitte, mit der 30. Das sollte uns wieder zurück an den Anfang bringen.", preload("res://scenes/dialog_system/voicelines/level1/search/AlgoditVoice9_00001457.wav"))
var level_01_10: Tuple = Tuple.new("Und...", preload("res://scenes/dialog_system/voicelines/level1/search/AlgoditVoice10_00001812.wav"))

var level_01_11: Tuple = Tuple.new("Hier, ich habe dir eine Karte gebaut.", preload("res://scenes/dialog_system/voicelines/level1/search/AlgoditVoice11_00001879.wav"))
var level_01_12: Tuple = Tuple.new("Mit der sollten wir jetzt auch leichter unser Ziel finden.", preload("res://scenes/dialog_system/voicelines/level1/search/AlgoditVoice12_00001965.wav"))
var level_01_13: Tuple = Tuple.new("Wir gehen wieder nach LINKS, zu der 25.", preload("res://scenes/dialog_system/voicelines/level1/search/AlgoditVoice13_00002066.wav"))

var level_01_14: Tuple = Tuple.new("Jetzt gehen wir zu der 15, danach runter in die 10.", preload("res://scenes/dialog_system/voicelines/level1/search/AlgoditVoice14_00002148.wav"))

var level_01_15: Tuple = Tuple.new("Ahhhh, da ist ja unser Ziel - die 12, wie sie im Zettel steht.", preload("res://scenes/dialog_system/voicelines/level1/search/AlgoditVoice15_00002268.wav"))

var level_01_16: Tuple = Tuple.new("Und nurnoch auf den Bilderrahmen klicken und dann haben wir das erste Level abgeschlossen.", preload("res://scenes/dialog_system/voicelines/level1/search/AlgoditVoice16_00002385.wav"))

var A_level_01_01: Array[Tuple] = [	self.level_01_01, 
									self.level_01_02, 
									self.level_01_03]
var A_level_01_02: Array[Tuple] = [	self.level_01_04]
var A_level_01_03: Array[Tuple] = [	self.level_01_05]
var A_level_01_04: Array[Tuple] = [	self.level_01_06,
#									]
#var A_level_01_05: Array[Tuple] = [	
									self.level_01_07,
#									]
#var A_level_01_06: Array[Tuple] = [	
									self.level_01_08,
									self.level_01_09,
									self.level_01_10]
var A_level_01_07: Array[Tuple] = [	self.level_01_11,
									self.level_01_12,
									self.level_01_13]
var A_level_01_08: Array[Tuple] = [	self.level_01_14]
var A_level_01_09: Array[Tuple] = [	self.level_01_15]
var A_level_01_10: Array[Tuple] = [	self.level_01_16]

var level_02_01: Tuple = Tuple.new("Fantastisch! Du hast das erste Level gemeistert!", preload("res://scenes/dialog_system/voicelines/level2_1_prolog/build/AlgoditVoice17_00002726.wav"))
var level_02_02: Tuple = Tuple.new("Keine Sorge, ich habe nie an dir gezweifelt!", preload("res://scenes/dialog_system/voicelines/level2_1_prolog/build/AlgoditVoice18_00002827.wav"))
var level_02_03: Tuple = Tuple.new("Jetzt schauen wir uns einmal genauer an, wie so ein AVL-Baum eigentlich funktioniert.", preload("res://scenes/dialog_system/voicelines/level2_1_prolog/build/AlgoditVoice19_00003046.wav"))
var level_02_04: Tuple = Tuple.new("Du siehst da diese Zahlen?", preload("res://scenes/dialog_system/voicelines/level2_1_prolog/build/AlgoditVoice20_00003193.wav"))
var level_02_05: Tuple = Tuple.new("Genau, da unten...", preload("res://scenes/dialog_system/voicelines/level2_2/build/AlgoditVoice21_00003256.wav"))

var level_02_06: Tuple = Tuple.new("...die 39, 42, 58, 87 und 99.", preload("res://scenes/dialog_system/voicelines/level2_2/build/AlgoditVoice22_00003468.wav"))
var level_02_07: Tuple = Tuple.new("Wir werden diese nun gemeinsam in unseren Baum einfügen.", preload("res://scenes/dialog_system/voicelines/level2_2/build/AlgoditVoice23_00003638.wav"))
var level_02_08: Tuple = Tuple.new("Keine Angst, ich helfe dir dabei!", preload("res://scenes/dialog_system/voicelines/level2_2/build/AlgoditVoice24_00003714.wav"))
var level_02_09: Tuple = Tuple.new("Also, der AVL-Baum hat eine spannende Eigenschaft:", preload("res://scenes/dialog_system/voicelines/level2_2/build/AlgoditVoice25_00003863.wav"))
var level_02_10: Tuple = Tuple.new("Er sorgt dafür, dass er immer gut ausbalanciert bleibt.", preload("res://scenes/dialog_system/voicelines/level2_2/build/AlgoditVoice26_00003952.wav"))
var level_02_11: Tuple = Tuple.new("Aber was bedeutet das eigentlich?", preload("res://scenes/dialog_system/voicelines/level2_2/build/AlgoditVoice27_00004035.wav"))
var level_02_12: Tuple = Tuple.new("Balance heißt, dass die Unterbäume eines Knotens nie einen Höhenunterschied von mehr als 1 haben.", preload("res://scenes/dialog_system/voicelines/level2_2/build/AlgoditVoice28.wav"))
var level_02_13: Tuple = Tuple.new("Unter anderem ist es auch wichtig, dass wir die Knoten von links (klein) nach rechts (groß) einordnen.", preload("res://scenes/dialog_system/voicelines/level2_2/build/AlgoditVoice29_00004334.wav"))
var level_02_14: Tuple = Tuple.new("Deswegen würde ich die 39 links unter der 40 einordnen, da sie kleiner als die 40, aber größer als die 35 ist.", preload("res://scenes/dialog_system/voicelines/level2_2/build/AlgoditVoice30_00004506.wav"))
var level_02_15: Tuple = Tuple.new("Sobald du die Knoten eingefügt hast, zeige ich dir, wie wir prüfen können, ob unser Baum noch in Balance ist.", preload("res://scenes/dialog_system/voicelines/level2_2/build/AlgoditVoice31_00004808.wav"))

var level_02_16: Tuple = Tuple.new("Sieht gut aus!", preload("res://scenes/dialog_system/voicelines/level2_2/build/AlgoditVoice32_00005128.wav"))
var level_02_17: Tuple = Tuple.new("Unser Baum ist wie ein frisch geschmückter Weihnachtsbaum – naja, fast.", preload("res://scenes/dialog_system/voicelines/level2_2/build/AlgoditVoice33_00005165.wav"))
var level_02_18: Tuple = Tuple.new("Aber schau mal, was passiert, wenn wir in die Suchphase gehen und die 42 finden wollen.", preload("res://scenes/dialog_system/voicelines/level2_2/build/AlgoditVoice34_00005304.wav"))

var level_02_19: Tuple = Tuple.new("Die Zahlen über den Türen sind alle verschwunden.", preload("res://scenes/dialog_system/voicelines/level2_2/search/AlgoditVoice35_00005503.wav"))
var level_02_20: Tuple = Tuple.new("Aber immerhin wissen wir in welchem Raum wir uns befinden.", preload("res://scenes/dialog_system/voicelines/level2_2/search/AlgoditVoice36_00005560.wav"))
var level_02_21: Tuple = Tuple.new("Da die 42 kleiner als die 50 ist, in der wir uns befinden, würde ich... durch die Linke Tür gehen.", preload("res://scenes/dialog_system/voicelines/level2_2/search/AlgoditVoice37_00005638.wav"))
var level_02_22: Tuple = Tuple.new("Mit dieser Methode sollte es eine Leichtigkeit sein, die 42 zu finden.", preload("res://scenes/dialog_system/voicelines/level2_2/search/AlgoditVoice38_00005810.wav"))

var A_level_02_01: Array[Tuple] = [	self.level_02_01, 
									self.level_02_02, 
									self.level_02_03,
									self.level_02_04,
									self.level_02_05]
var A_level_02_02: Array[Tuple] = [	self.level_02_06, 
									self.level_02_07, 
									self.level_02_08,
									self.level_02_09,
									self.level_02_10,
									self.level_02_11,
									self.level_02_12,
									self.level_02_13,
									self.level_02_14,
									self.level_02_15]
var A_level_02_03: Array[Tuple] = [	self.level_02_16, 
									self.level_02_17,
									self.level_02_18]
var A_level_02_04: Array[Tuple] = [	self.level_02_19, 
									self.level_02_20,
									self.level_02_21,
									self.level_02_22]

var level_03_1_01: Tuple = Tuple.new("Okay mein kluger Freund, willkommen im nächsten Kapitel unseres Baumabenteuers!", preload("res://scenes/dialog_system/voicelines/level3_1_prolog/build/AlgoditVoice39_00006127.wav"))
var level_03_1_02: Tuple = Tuple.new("Aber oh nein – Das sollte so nicht sein!", preload("res://scenes/dialog_system/voicelines/level3_1_prolog/build/AlgoditVoice40_00006269.wav"))
var level_03_1_03: Tuple = Tuple.new("Es sieht so aus, als hätte hier ein wilder Sturm gewütet.", preload("res://scenes/dialog_system/voicelines/level3_1_prolog/build/AlgoditVoice41_00006340.wav"))
var level_03_1_04: Tuple = Tuple.new("Einige Knoten sind völlig durcheinander! Einen Moment.", preload("res://scenes/dialog_system/voicelines/level3_1_prolog/build/AlgoditVoice42_00006412.wav"))

var A_level_03_1_01: Array[Tuple] = [self.level_03_1_01, 
									self.level_03_1_02,  
									self.level_03_1_03, 
									self.level_03_1_04]

var level_03_2_01: Tuple = Tuple.new("Ich habe die schlimmsten Übeltäter mal in dein Inventar gepackt.", preload("res://scenes/dialog_system/voicelines/level3_2/build/AlgoditVoice43_00006571.wav"))
var level_03_2_02: Tuple = Tuple.new("Dein Job ist es jetzt, den Baum so zu sortieren, dass er wieder seine wunderschöne Ordnung zurückbekommt.", preload("res://scenes/dialog_system/voicelines/level3_2/build/AlgoditVoice44_00006644.wav"))
var level_03_2_03: Tuple = Tuple.new("Denk daran: Links kommen die kleineren Zahlen, rechts die größeren.", preload("res://scenes/dialog_system/voicelines/level3_2/build/AlgoditVoice45_00006780.wav"))

var level_03_2_04: Tuple = Tuple.new("Die 25 gehört nach links...", preload("res://scenes/dialog_system/voicelines/level3_2/build/AlgoditVoice47_00007056.wav"))

var level_03_2_05: Tuple = Tuple.new("Und jetzt die 80… ohh, ich sollte dich einstellen!", preload("res://scenes/dialog_system/voicelines/level3_2/build/AlgoditVoice49_00007157.wav"))

var level_03_2_06: Tuple = Tuple.new("Schau dir das an!", preload("res://scenes/dialog_system/voicelines/level3_2/build/AlgoditVoice51_00007480.wav"))
var level_03_2_07: Tuple = Tuple.new("Alles an seinem Platz – ein wahres Kunstwerk!", preload("res://scenes/dialog_system/voicelines/level3_2/build/AlgoditVoice52_00007527.wav"))
var level_03_2_08: Tuple = Tuple.new("Aber warte… ich hab gerade gemerkt, dass wir einen letzten Test machen müssen, um sicherzustellen, dass alles wirklich korrekt ist.", preload("res://scenes/dialog_system/voicelines/level3_2/build/AlgoditVoice53_00007649.wav"))

var level_03_2_09: Tuple = Tuple.new("Deine letzte Aufgabe für dieses Level: Finde die 95!", preload("res://scenes/dialog_system/voicelines/level3_2/search/AlgoditVoice54_00007876.wav"))

var A_level_03_2_01: Array[Tuple] = [self.level_03_2_01, 
									self.level_03_2_02,  
									self.level_03_2_03]
var A_level_03_2_02: Array[Tuple] = [self.special_interaction_positive_01, 
									self.level_03_2_04]
var A_level_03_2_03: Array[Tuple] = [self.level_03_2_05, 
									self.special_interaction_positive_02]
var A_level_03_2_04: Array[Tuple] = [self.level_03_2_06, 
									self.level_03_2_07,
									self.level_03_2_08]
var A_level_03_2_05: Array[Tuple] = [self.level_03_2_09]

var level_04_1_01: Tuple = Tuple.new("Sieh dir die 60 an.", preload("res://scenes/dialog_system/voicelines/level4/build/AlgoditVoice55_00008161.wav"))
var level_04_1_02: Tuple = Tuple.new("Die ist der Übeltäter hier!", preload("res://scenes/dialog_system/voicelines/level4/build/AlgoditVoice56_00008223.wav"))
var level_04_1_03: Tuple = Tuple.new("Sie sorgt dafür, dass ihr rechter Teilbaum viel tiefer ist als ihr linker.", preload("res://scenes/dialog_system/voicelines/level4/build/AlgoditVoice57_00008288.wav"))
var level_04_1_04: Tuple = Tuple.new("Was wir hier brauchen, ist eine sogenannte LINKS-ROTATION.", preload("res://scenes/dialog_system/voicelines/level4/build/AlgoditVoice58_00008389.wav"))
var level_04_1_05: Tuple = Tuple.new("Eine Links-Rotation führst du aus, indem du:", preload("res://scenes/dialog_system/voicelines/level4/build/AlgoditVoice59_00008495.wav"))
var level_04_1_06: Tuple = Tuple.new("- mit deiner Maus über die 60 hoverst und auf den linken Pfeil klickst, welcher erscheint.", preload("res://scenes/dialog_system/voicelines/level4/build/AlgoditVoice60_00008580.wav"))
#Angepasst, da Johanna in der Voiceline Mist erzählt. Die besagte 70 ist eine 82 und sie bleibt auch nicht an ihrem Platz
var level_04_1_07: Tuple = Tuple.new("Eine linke Rotation bedeutet, dass die 80 die neue Wurzel wird, die 60 ihr linkes Kind, und die 82 rutscht einfach nach oben nach.", null)
var level_04_1_08: Tuple = Tuple.new("Dadurch gelangt unser Baum ins Gleichgewicht.", preload("res://scenes/dialog_system/voicelines/level4/build/AlgoditVoice62_00009135.wav"))

var level_04_1_09: Tuple = Tuple.new("So – Unser Baum ist jetzt balanciert.", preload("res://scenes/dialog_system/voicelines/level4/build/AlgoditVoice63_00009254.wav"))
var level_04_1_10: Tuple = Tuple.new("Zum Abschluss will ich sicherstellen, dass du die 60 findest.", preload("res://scenes/dialog_system/voicelines/level4/search/AlgoditVoice64_00009413.wav"))

var A_level_04_1_01: Array[Tuple] = [self.level_04_1_01,
									self.level_04_1_02,
									self.level_04_1_03,
									self.level_04_1_04,
									self.level_04_1_05,
									self.level_04_1_06,
									self.level_04_1_07,
									self.level_04_1_08]
var A_level_04_1_02: Array[Tuple] = [self.level_04_1_09,
									self.level_04_1_10]

var level_04_2_01: Tuple = Tuple.new("Ahhh ein Wundervoller Baum.", preload("res://scenes/dialog_system/voicelines/level4_2/build/AlgoditVoice65_00009728.wav"))
var level_04_2_02: Tuple = Tuple.new("Ach, nein warte, warum ist die 1 denn da unten?", preload("res://scenes/dialog_system/voicelines/level4_2/build/AlgoditVoice66_00009803.wav"))
var level_04_2_03: Tuple = Tuple.new("Zieh sie mal in den Baum, du wirst sehen, sie sortiert sich von ganz alleine ein...", preload("res://scenes/dialog_system/voicelines/level4_2/build/AlgoditVoice67_00009906.wav"))
var level_04_2_04: Tuple = Tuple.new("... wir müssen ihn dann zwar balancieren, aber wir als Team kriegen das hin!", preload("res://scenes/dialog_system/voicelines/level4_2/build/AlgoditVoice68_00009961.wav"))

var level_04_2_05: Tuple = Tuple.new("Wir müssen hier nun eine Rechts-Rotation der 30 durchführen, da ihr linkes Kind 2 Ebenen tiefer reicht, als ihr rechtes Kind.", preload("res://scenes/dialog_system/voicelines/level4_2/build/AlgoditVoice69_00010181.wav"))
var level_04_2_06: Tuple = Tuple.new("Das Prinzip ist genau das gleiche, nur spiegelverkehrt.", preload("res://scenes/dialog_system/voicelines/level4_2/build/AlgoditVoice70_00010449.wav"))
var level_04_2_07: Tuple = Tuple.new("Bei einer rechten Rotation wird der linke Knoten zur neuen Wurzel. Die 20 wird also die neue Wurzel, die 30 wird ihr rechtes Kind, und die 27 wird nun linkes Kind der 30.", preload("res://scenes/dialog_system/voicelines/level4_2/build/AlgoditVoice71_00010555.wav"))

var level_04_2_08: Tuple = Tuple.new("Perfekt! Der Baum ist jetzt wunderschön ausgeglichen.", preload("res://scenes/dialog_system/voicelines/level4_2/build/AlgoditVoice72_00010870.wav"))
var level_04_2_09: Tuple = Tuple.new("Kannst du die Harmonie spüren?", preload("res://scenes/dialog_system/voicelines/level4_2/build/AlgoditVoice73_00010987.wav"))
var level_04_2_10: Tuple = Tuple.new("Und jetzt einmal in die Suchphase!", preload("res://scenes/dialog_system/voicelines/level4_2/build/AlgoditVoice74_00011088.wav"))

var level_04_2_11: Tuple = Tuple.new("Sooo und jetzt nurnoch die 27 finden.", preload("res://scenes/dialog_system/voicelines/level4_2/search/AlgoditVoice75_00011179.wav"))

var A_level_04_2_01: Array[Tuple] = [self.level_04_2_01,
									self.level_04_2_02,
									self.level_04_2_03,
									self.level_04_2_04]
var A_level_04_2_02: Array[Tuple] = [self.level_04_2_05,
									self.level_04_2_06,
									self.level_04_2_07]
var A_level_04_2_03: Array[Tuple] = [self.level_04_2_08,
									self.level_04_2_09,
									self.level_04_2_10]
var A_level_04_2_04: Array[Tuple] = [self.level_04_2_11]

var level_05_1_01: Tuple = Tuple.new("Willkommen im letzten Bereich unseres Tutorials.", preload("res://scenes/dialog_system/voicelines/level5/build/AlgoditVoice76_00011399.wav"))
var level_05_1_02: Tuple = Tuple.new("Siehst du die 4?", preload("res://scenes/dialog_system/voicelines/level5/build/AlgoditVoice77_00011484.wav"))
var level_05_1_03: Tuple = Tuple.new("Ihr rechter Teilbaum ist deutlich tiefer als ihr linker.", preload("res://scenes/dialog_system/voicelines/level5/build/AlgoditVoice78_00011527.wav"))
var level_05_1_04: Tuple = Tuple.new("Auf den ersten Blick würde man denken eine einfache Links-Rotation würde vollkommen ausreichen, um den Baum wieder zu balancieren.", preload("res://scenes/dialog_system/voicelines/level5/build/AlgoditVoice79_00011627.wav"))
var level_05_1_05: Tuple = Tuple.new("Das täuscht aber!", preload("res://scenes/dialog_system/voicelines/level5/build/AlgoditVoice80_00011834.wav"))
var level_05_1_06: Tuple = Tuple.new("Zuerst müssen wir eine Rechts-Rotation auf der 6 durchführen, um den Überhang nach rechts zu bringen.", preload("res://scenes/dialog_system/voicelines/level5/build/AlgoditVoice81_00011901.wav"))

var level_05_1_07: Tuple = Tuple.new("Und jetzt nur noch eine einfach Links-Rotation, du weißt ja wie das geht.", preload("res://scenes/dialog_system/voicelines/level5/build/AlgoditVoice82_00012105.wav"))

var level_05_1_08: Tuple = Tuple.new("Einmal die 6 zum Mitnehmen bitte.", preload("res://scenes/dialog_system/voicelines/level5/search/AlgoditVoice83_00012375.wav"))

var A_level_05_1_01: Array[Tuple] = [self.level_05_1_01,
									self.level_05_1_02,
									self.level_05_1_03,
									self.level_05_1_04,
									self.level_05_1_05,
									self.level_05_1_06]
var A_level_05_1_02: Array[Tuple] = [self.level_05_1_07]
var A_level_05_1_03: Array[Tuple] = [self.level_05_1_08]

var level_05_2_01: Tuple = Tuple.new("So, bist du bereit für die letzte Herausforderung?", preload("res://scenes/dialog_system/voicelines/level5_2_prolog/build/AlgoditVoice84_00012513.wav"))
var level_05_2_02: Tuple = Tuple.new("Moment... warte, die 15 gehört da gar nicht hin, du sollst ja auch was zu tun haben.", preload("res://scenes/dialog_system/voicelines/level5_2_prolog/build/AlgoditVoice85_00012627.wav"))

var A_level_05_2_01: Array[Tuple] = [self.level_05_2_01,
									self.level_05_2_02]

var level_05_3_01: Tuple = Tuple.new("Was du hier machen musst ist eine Links-Rechts-Rotation.", preload("res://scenes/dialog_system/voicelines/level5_3/build/AlgoditVoice86_00012904.wav"))
var level_05_3_02: Tuple = Tuple.new("Quasi wie gerade eben, nur einmal umgedreht.", preload("res://scenes/dialog_system/voicelines/level5_3/build/AlgoditVoice87_00013011.wav"))
var level_05_3_03: Tuple = Tuple.new("Das bekommst du auch ohne mich hin!", preload("res://scenes/dialog_system/voicelines/level5_3/build/AlgoditVoice88_00013121.wav"))

var level_05_3_04: Tuple = Tuple.new("Ach du bist schon fertig?", preload("res://scenes/dialog_system/voicelines/level5_3/search/AlgoditVoice89_00013248.wav"))
var level_05_3_05: Tuple = Tuple.new("Ich habe mir gerade noch Kaffee geholt!", preload("res://scenes/dialog_system/voicelines/level5_3/search/AlgoditVoice90_00013311.wav"))

var A_level_05_3_01: Array[Tuple] = [self.level_05_3_01,
									self.level_05_3_02,
									self.level_05_3_03]
var A_level_05_3_02: Array[Tuple] = [self.level_05_3_04,
									self.level_05_3_05]


var endscreen_01: Tuple = Tuple.new("Ich hoffe dir hat das Tutorial gefallen.", preload("res://scenes/dialog_system/voicelines/level_endscreen/AlgoditVoice91_00013382.wav"))
var endscreen_02: Tuple = Tuple.new("Hier ist ein Keks für deine Mühen.", preload("res://scenes/dialog_system/voicelines/level_endscreen/AlgoditVoice92_00013438.wav"))

var A_endscreen: Array[Tuple] = 	[self.endscreen_01,
									self.endscreen_02]
