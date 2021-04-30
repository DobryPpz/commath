extends Node2D


var przesuwanie
var pos_x
var pos_y
onready var tilmap = get_parent().get_node("TileMap")

func _ready():
	set_process(false)
	przesuwanie = false

func _process(delta):
	tilmap.position.x += get_local_mouse_position().x - pos_x
	tilmap.position.y += get_local_mouse_position().y - pos_y
	pos_x = get_local_mouse_position().x
	pos_y = get_local_mouse_position().y
	pass


func _on_back_pressed():
	AudioMenu.play()
	get_tree().change_scene("res://src/Levels.tscn")


func _on_move_pressed():
	AudioMenu.play()
	if(!przesuwanie):
		przesuwanie = true
	else:
		przesuwanie = false
	#tutaj włączamy przesuwanie po mapie


func _on_plak_pressed():
	if(przesuwanie):
		#tutaj aktywujemy przesuwanie
		pos_x = get_local_mouse_position().x
		pos_y = get_local_mouse_position().y
		set_process(true)


func _on_plak_released():
	set_process(false)
