extends Node

var text_test: String = "Test for Database"

var A_level_01_01: Array[Tuple] = [	self.level_01_01, 
									self.level_01_02, 
									self.level_01_03]
var A_level_01_02: Array[Tuple] = [	self.level_01_04]
var A_level_01_03: Array[Tuple] = [	self.level_01_05]
var A_level_01_04: Array[Tuple] = [	self.level_01_06]
var A_level_01_05: Array[Tuple] = [	self.level_01_07]
var A_level_01_06: Array[Tuple] = [	self.level_01_08,
									self.level_01_09,
									self.level_01_10]
var A_level_01_07: Array[Tuple] = [	self.level_01_11,
									self.level_01_12,
									self.level_01_13]
var A_level_01_08: Array[Tuple] = [	self.level_01_14]
var A_level_01_09: Array[Tuple] = [	self.level_01_15]
var A_level_01_10: Array[Tuple] = [	self.level_01_16]

var level_01_01: Tuple = Tuple.new("Hallöchen und herzlich Willkommen in meinem kleinen Tutorial zu AVL-Bäumen.", preload("res://scenes/dialog_system/voicelines/level1/search/AlgoditVoice1_00000281.wav"))
var level_01_02: Tuple = Tuple.new("Ich erkläre dir heute alles, was du zu diesen wundersamen Bäumen wissen musst.", preload("res://scenes/dialog_system/voicelines/level1/search/AlgoditVoice2_00000439.wav"))
var level_01_03: Tuple = Tuple.new("Um das Tutorial zu starten, so klicke bitte einmal auf die LINKE TÜR.", preload("res://scenes/dialog_system/voicelines/level1/search/AlgoditVoice3_00000578.wav"))

var level_01_04: Tuple = Tuple.new("Nun bitte einmal auf die RECHTE TÜR - Jaaa, genau, die mit der 35, die sieht gut aus!", preload("res://scenes/dialog_system/voicelines/level1/search/AlgoditVoice4_00000765.wav"))

var level_01_05: Tuple = Tuple.new("Und nun wieder LINKS.", preload("res://scenes/dialog_system/voicelines/level1/search/AlgoditVoice5_00000947.wav"))

var level_01_06: Tuple = Tuple.new("Einen Moment...", preload("res://scenes/dialog_system/voicelines/level1/search/AlgoditVoice6_00001065.wav"))

var level_01_07: Tuple = Tuple.new("Hier Stimmt etwas nicht, nach meinem Script,… solltest du eigentlich erst in 5 Leveln hier sein… Mhmmm...", preload("res://scenes/dialog_system/voicelines/level1/search/AlgoditVoice7_00001111.wav"))

var level_01_08: Tuple = Tuple.new("Ahhhhh, ich habs!", preload("res://scenes/dialog_system/voicelines/level1/search/AlgoditVoice8_00001348.wav"))
var level_01_09: Tuple = Tuple.new("Drücke mal auf den Bilderrahmen in der Mitte, mit der 30. Der sollte uns wieder zurück zum Anfang bringen", preload("res://scenes/dialog_system/voicelines/level1/search/AlgoditVoice9_00001457.wav"))
var level_01_10: Tuple = Tuple.new("Und...", preload("res://scenes/dialog_system/voicelines/level1/search/AlgoditVoice10_00001812.wav"))

var level_01_11: Tuple = Tuple.new("Hier, ich habe dir eine Karte gebaut.", preload("res://scenes/dialog_system/voicelines/level1/search/AlgoditVoice11_00001879.wav"))
var level_01_12: Tuple = Tuple.new("Mit der sollten wir jetzt auch leichter unser Ziel finden.", preload("res://scenes/dialog_system/voicelines/level1/search/AlgoditVoice12_00001965.wav"))
var level_01_13: Tuple = Tuple.new("Wir gehen wieder nach Rechts, zu der 25", preload("res://scenes/dialog_system/voicelines/level1/search/AlgoditVoice13_00002066.wav"))

var level_01_14: Tuple = Tuple.new("Jetzt gehen wir zu der 15, danach runter in die 10.", preload("res://scenes/dialog_system/voicelines/level1/search/AlgoditVoice14_00002148.wav"))

var level_01_15: Tuple = Tuple.new("Ahhhh, da ist ja unser Ziel - die 12, wie sie im Zettel steht.", null)

var level_01_16: Tuple = Tuple.new("Nun nurnoch auf den Bilderrahmen klicken und dann haben wir das erste Level abgeschlossen.", preload("res://scenes/dialog_system/voicelines/level1/search/AlgoditVoice16_00002385.wav"))

var A_level_02_01: Array[Tuple] = [	self.level_02_01, 
									self.level_02_02, 
									self.level_02_03,
									self.level_02_04,
									self.level_01_05]
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

var level_02_01: Tuple = Tuple.new("Fantastisch! Du hast das erste Level gemeistert!", preload("res://scenes/dialog_system/voicelines/level2_1_prolog/build/AlgoditVoice17_00002726.wav"))
var level_02_02: Tuple = Tuple.new("Keine Sorge, ich habe nie an dir gezweifelt!", preload("res://scenes/dialog_system/voicelines/level2_1_prolog/build/AlgoditVoice18_00002827.wav"))
var level_02_03: Tuple = Tuple.new("Jetzt schauen wir uns einmal genauer an, wie so ein AVL-Baum eigentlich funktioniert.", preload("res://scenes/dialog_system/voicelines/level2_1_prolog/build/AlgoditVoice19_00003046.wav"))
var level_02_04: Tuple = Tuple.new("Du siehst da diese Zahlen?", preload("res://scenes/dialog_system/voicelines/level2_1_prolog/build/AlgoditVoice20_00003193.wav"))
var level_02_05: Tuple = Tuple.new("Genau, da unten...", preload("res://scenes/dialog_system/voicelines/level2_2/build/AlgoditVoice21_00003256.wav"))

var level_02_06: Tuple = Tuple.new("...die 39, 42, 58, 87 und 99", preload("res://scenes/dialog_system/voicelines/level2_2/build/AlgoditVoice22_00003468.wav"))
var level_02_07: Tuple = Tuple.new("Wir werden diese nun gemeinsam in unseren Baum einfügen.", preload("res://scenes/dialog_system/voicelines/level2_2/build/AlgoditVoice23_00003638.wav"))
var level_02_08: Tuple = Tuple.new("Keine Angst, ich helfe dir dabei!", preload("res://scenes/dialog_system/voicelines/level2_2/build/AlgoditVoice24_00003714.wav"))
var level_02_09: Tuple = Tuple.new("Also, der AVL-Baum hat eine spannende Eigenschaft:", preload("res://scenes/dialog_system/voicelines/level2_2/build/AlgoditVoice25_00003863.wav"))
var level_02_10: Tuple = Tuple.new("Er sorgt dafür, dass er immer gut ausbalanciert bleibt.", preload("res://scenes/dialog_system/voicelines/level2_2/build/AlgoditVoice26_00003952.wav"))
var level_02_11: Tuple = Tuple.new("Aber was bedeutet das eigentlich?", preload("res://scenes/dialog_system/voicelines/level2_2/build/AlgoditVoice27_00004035.wav"))
var level_02_12: Tuple = Tuple.new("Balance heißt, dass die Unterbäume eines Knotens nie einen zu großen (>1) Höhenunterschied haben.", preload("res://scenes/dialog_system/voicelines/level2_2/build/AlgoditVoice28.wav"))
var level_02_13: Tuple = Tuple.new("Unter anderem ist es auch wichtig, dass wir die Knoten von links (klein) nach rechts (groß) einnordnen.", preload("res://scenes/dialog_system/voicelines/level2_2/build/AlgoditVoice29_00004334.wav"))
var level_02_14: Tuple = Tuple.new("Deswegen würde ich die 39 links unter der 40 einordnen, da sie kleiner als die 40, aber größer als die 35 ist.", preload("res://scenes/dialog_system/voicelines/level2_2/build/AlgoditVoice30_00004506.wav"))
var level_02_15: Tuple = Tuple.new("Sobald du die Knoten eingefügt hast, zeige ich dir, wie wir prüfen können, ob unser Baum noch in Balance ist.", preload("res://scenes/dialog_system/voicelines/level2_2/build/AlgoditVoice31_00004808.wav"))

var level_02_16: Tuple = Tuple.new("Sieht gut aus!", preload("res://scenes/dialog_system/voicelines/level2_2/build/AlgoditVoice32_00005128.wav"))
var level_02_17: Tuple = Tuple.new("Unser Baum ist wie ein frisch geschmückter Weihnachtsbaum – naja, fast.", preload("res://scenes/dialog_system/voicelines/level2_2/build/AlgoditVoice33_00005165.wav"))
var level_02_18: Tuple = Tuple.new("Aber schau mal, was passiert, wenn wir in die Suchphase gehen und die 42 finden wollen.", preload("res://scenes/dialog_system/voicelines/level2_2/build/AlgoditVoice34_00005304.wav"))

var level_02_19: Tuple = Tuple.new("Die Zahlen über den Türen sind alle verschwunden.", preload("res://scenes/dialog_system/voicelines/level2_2/search/AlgoditVoice35_00005503.wav"))
var level_02_20: Tuple = Tuple.new("Aber immerhin wissen wir in welchem Raum wir uns befinden.", preload("res://scenes/dialog_system/voicelines/level2_2/search/AlgoditVoice36_00005560.wav"))
var level_02_21: Tuple = Tuple.new("Da die 42 kleiner als die 50 ist, in der wir uns befinden, würde ich durch die Linke Tür gehen", preload("res://scenes/dialog_system/voicelines/level2_2/search/AlgoditVoice37_00005638.wav"))
var level_02_22: Tuple = Tuple.new("Mit dieser Methode sollte es eine Leichtigkeit sein, die 42 zu finden.", preload("res://scenes/dialog_system/voicelines/level2_2/search/AlgoditVoice38_00005810.wav"))

var A_level_03_1_01: Array[Tuple] = [self.level_03_1_01, 
									self.level_03_1_02,  
									self.level_03_1_03, 
									self.level_03_1_04]

var level_03_1_01: Tuple = Tuple.new("Okay mein kluger Freund, willkommen im nächsten Kapitel unseres Baumabenteuers!", preload("res://scenes/dialog_system/voicelines/level3_1_prolog/build/AlgoditVoice39_00006127.wav"))
var level_03_1_02: Tuple = Tuple.new("Aber oh Nein – Das sollte so nicht sein!", preload("res://scenes/dialog_system/voicelines/level3_1_prolog/build/AlgoditVoice40_00006269.wav"))
var level_03_1_03: Tuple = Tuple.new("Es sieht so aus, als hätte hier ein wilder Sturm gewütet.", preload("res://scenes/dialog_system/voicelines/level3_1_prolog/build/AlgoditVoice41_00006340.wav"))
var level_03_1_04: Tuple = Tuple.new("Einige Knoten sind völlig durcheinander.", preload("res://scenes/dialog_system/voicelines/level3_1_prolog/build/AlgoditVoice42_00006412.wav"))

var A_level_03_2_01: Array[Tuple] = [self.level_03_2_01, 
									self.level_03_2_02,  
									self.level_03_1_03, 
									self.level_03_1_04]

var level_03_2_01: Tuple = Tuple.new("", null)
var level_03_2_02: Tuple = Tuple.new("", null)
