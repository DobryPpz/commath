extends Node2D
class_name level_screen

var nr_screen

func _ready():
	pass
			
func rysuj(path_kontener):
	var lev = autoload.get_level()
	var locked = load("res://grafika/panele_leveli/locked.png")
	for i in range(0,25):
		if(i+1+25*nr_screen <= lev):
			var tex = load(autoload.level_icons[i+1+(25*nr_screen)])
			path_kontener.get_child(i).get_child(0).set_texture(tex)
		else:
			path_kontener.get_child(i).get_child(0).set_texture(locked)
	#problem jest ogólnie z tym, że w komputerze aktualnie zapisany level się zczytuje
	#bo jest ten plik data.json a na komórkę on się nie przenosi. problem jest ogólnie
	#z zapisem danych. chyba trzeba będzie użyć tej bazy danych castleDB
