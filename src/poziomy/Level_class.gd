extends Node2D


var przesuwanie
var pos_x
var pos_y
onready var tilmap = get_parent().get_node("TileMap")
onready var niepressed = load("res://grafika/move_off.png")
onready var takpressed = load("res://grafika/move_on.png")
onready var win_scene = load("res://src/Win.tscn")
onready var loss_scene = load("res://src/Loss.tscn")
var liczba = load("res://src/Liczba.tscn")

func _ready():
	set_process(false)
	przesuwanie = false
	$Label.text = str(get_parent().goal)
	print(len(autoload.okienka))
	for i in tilmap.get_children():
			print(i.typ)


func _process(delta):
	if(przesuwanie):
		tilmap.position.x += get_local_mouse_position().x - pos_x
		tilmap.position.y += get_local_mouse_position().y - pos_y
		pos_x = get_local_mouse_position().x
		pos_y = get_local_mouse_position().y


func _on_back_pressed():
	AudioMenu.play()
	get_tree().change_scene("res://src/Levels.tscn")


func _on_move_pressed():
	AudioMenu.play()
	if(!przesuwanie):
		przesuwanie = true
		autoload.przesuwanie = true
		$move.normal = takpressed
		$move.pressed = takpressed
	else:
		przesuwanie = false
		autoload.przesuwanie = false
		$move.normal = niepressed
		$move.pressed = niepressed
	#tutaj włączamy przesuwanie po mapie


func _on_plak_pressed():
	if(przesuwanie):
		#tutaj aktywujemy przesuwanie
		pos_x = get_local_mouse_position().x
		pos_y = get_local_mouse_position().y
		set_process(true)


func _on_plak_released():
	set_process(false)
	var nowa = false
	if(len(autoload.okienka) == 3):
		var warunek_1 = autoload.okienka[0].typ == "liczba"
		var warunek_2 = autoload.okienka[1].typ == "dzialanie"
		var warunek_3 = autoload.okienka[2].typ == "liczba"
		var warunek_4 = autoload.okienka[0] != autoload.okienka[2]
		if(warunek_1 and warunek_2 and warunek_3 and warunek_4):
			nowa = true
	
	if(!nowa):
		autoload.starter = null
		for i in autoload.okienka:
			i.get_node("Sprite").texture = i.untouched
		autoload.okienka = []
	else:
		var node = liczba.instance()
		node.val = autoload.okienka[0].val + autoload.okienka[2].val
		tilmap.add_child(node)
		node.position = autoload.starter.position
		autoload.starter = null
		for i in autoload.okienka:
			i.free()
		autoload.okienka = []
		get_parent().liczba_liczb -= 1
	
	if(get_parent().liczba_liczb == 1):
		var ostatnia
		#tutaj sprawdzamy czy osiągnięty został cel
		for i in tilmap.get_children():
			if(i.typ == "liczba"):
				ostatnia = i
		if(ostatnia.val == get_parent().goal):
			var node = win_scene.instance()
			add_child(node)
		else:
			var node = loss_scene.instance()
			add_child(node)


func _on_restart_pressed():
	AudioMenu.play()
	get_tree().reload_current_scene()
