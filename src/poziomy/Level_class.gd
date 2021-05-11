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

var topmost
var downmost
var leftmost
var rightmost

#onready var warunek_1 = get_parent().topmost.position.y < get_viewport().size.y/2
#onready var warunek_2 = get_parent().downmost.position.y > get_viewport().size.y/2
#onready var warunek_3 = get_parent().leftmost.position.x < get_viewport().size.x/2
#onready var warunek_4 = get_parent().rightmost.position.x > get_viewport().size.x/2

var warunek_1_move
var warunek_2_move
var warunek_3_move
var warunek_4_move

func _ready():
	topmost = tilmap.get_child(0)
	leftmost = tilmap.get_child(0)
	downmost = tilmap.get_child(0)
	rightmost = tilmap.get_child(0)
	for i in tilmap.get_children():
		if(i.position.x < leftmost.position.x):
			leftmost = i
		if(i.position.x > rightmost.position.x):
			rightmost = i
		if(i.position.y < topmost.position.y):
			topmost = i
		if(i.position.y > downmost.position.y):
			downmost = i
	print("================")
	print(topmost.val)
	print(downmost.val)
	print(leftmost.val)
	print(rightmost.val)
	print("================")
	set_process(false)
	przesuwanie = false
	$Label.text = str(get_parent().goal)
	print(len(autoload.okienka))
	for i in tilmap.get_children():
			print(i.typ)


func _process(delta):
	warunek_1_move = topmost.position.y + get_local_mouse_position().y - pos_y < 650
	warunek_2_move = downmost.position.y + get_local_mouse_position().y - pos_y > 50
	warunek_3_move = leftmost.position.x + get_local_mouse_position().x - pos_x < 300
	warunek_4_move = rightmost.position.x + get_local_mouse_position().x - pos_x > 50
	if(przesuwanie):
		#problem był taki że przesuwałem cełe tilmap więc jego potomkowie nie zmieniali swojej pozycji
		if(warunek_1_move and warunek_2_move):
#			tilmap.position.y += get_local_mouse_position().y - pos_y
			for i in tilmap.get_children():
				i.position.y += get_local_mouse_position().y - pos_y
			pos_y = get_local_mouse_position().y
		if(warunek_3_move and warunek_4_move):
#			tilmap.position.x += get_local_mouse_position().x - pos_x
			for i in tilmap.get_children():
				i.position.x += get_local_mouse_position().x - pos_x
			pos_x = get_local_mouse_position().x


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
