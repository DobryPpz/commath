extends Node

var path = "res://data.json"

var licza_prob = 2

var przesuwanie = false
var starter = null
var okienka = []

var level_icons = {
	1:"res://grafika/panele_leveli/level_1.png",
	2:"res://grafika/panele_leveli/level_2.png",
	3:"res://grafika/panele_leveli/level_3.png",
	4:"res://grafika/panele_leveli/level_4.png",
	5:"res://grafika/panele_leveli/level_5.png",
	6:"res://grafika/panele_leveli/level_6.png",
	7:"res://grafika/panele_leveli/level_7.png",
	8:"res://grafika/panele_leveli/level_8.png",
	9:"res://grafika/panele_leveli/level_9.png",
	10:"res://grafika/panele_leveli/level_10.png",
	11:"res://grafika/panele_leveli/level_11.png",
	12:"res://grafika/panele_leveli/level_12.png",
	13:"res://grafika/panele_leveli/level_13.png",
	14:"res://grafika/panele_leveli/level_14.png",
	15:"res://grafika/panele_leveli/level_15.png",
	16:"res://grafika/panele_leveli/level_16.png",
	17:"res://grafika/panele_leveli/level_17.png",
	18:"res://grafika/panele_leveli/level_18.png",
	19:"res://grafika/panele_leveli/level_19.png",
	20:"res://grafika/panele_leveli/level_20.png",
	21:"res://grafika/panele_leveli/level_21.png",
	22:"res://grafika/panele_leveli/level_22.png",
	23:"res://grafika/panele_leveli/level_23.png",
	24:"res://grafika/panele_leveli/level_24.png",
	25:"res://grafika/panele_leveli/level_25.png",
	26:"res://grafika/panele_leveli/level_26.png",
	27:"res://grafika/panele_leveli/level_27.png",
	28:"res://grafika/panele_leveli/level_28.png",
	29:"res://grafika/panele_leveli/level_29.png",
	30:"res://grafika/panele_leveli/level_30.png",
	31:"res://grafika/panele_leveli/level_31.png",
	32:"res://grafika/panele_leveli/level_32.png",
	33:"res://grafika/panele_leveli/level_33.png",
	34:"res://grafika/panele_leveli/level_34.png",
	35:"res://grafika/panele_leveli/level_35.png",
	36:"res://grafika/panele_leveli/level_36.png",
	37:"res://grafika/panele_leveli/level_37.png",
	38:"res://grafika/panele_leveli/level_38.png",
	39:"res://grafika/panele_leveli/level_39.png",
	40:"res://grafika/panele_leveli/level_40.png",
	41:"res://grafika/panele_leveli/level_41.png",
	42:"res://grafika/panele_leveli/level_42.png",
	43:"res://grafika/panele_leveli/level_43.png",
	44:"res://grafika/panele_leveli/level_44.png",
	45:"res://grafika/panele_leveli/level_45.png",
	46:"res://grafika/panele_leveli/level_46.png",
	47:"res://grafika/panele_leveli/level_47.png",
	48:"res://grafika/panele_leveli/level_48.png",
	49:"res://grafika/panele_leveli/level_49.png",
	50:"res://grafika/panele_leveli/level_50.png"
}

func _ready():
	pass 
	
func get_level():
	var file = File.new()
	file.open(path,file.READ)
	var text = file.get_as_text()
	var data = parse_json(text)
	file.close()
	return data["levels_unlocked"]

func update_level():
	var file = File.new()
	
	file.open(path,file.READ)
	var text = file.get_as_text()
	var data = parse_json(text)
	file.close()
	data["levels_unlocked"] += 1
	
	file.open(path,file.WRITE)
	file.store_line(to_json(data))
	file.close()
	
	
