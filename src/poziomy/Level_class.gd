extends Node2D


var przesuwanie
var pos_x
var pos_y
var pos_pointer
onready var tilmap = get_parent().get_node("TileMap")
onready var niepressed = load("res://grafika/move_off.png")
onready var takpressed = load("res://grafika/move_on.png")
#onready var pointer_scene = load("res://src/Pointer.tscn")
var pointer

func _ready():
	set_process(false)
	przesuwanie = false


func _process(delta):
	if(przesuwanie):
		tilmap.position.x += get_local_mouse_position().x - pos_x
		tilmap.position.y += get_local_mouse_position().y - pos_y
		pos_x = get_local_mouse_position().x
		pos_y = get_local_mouse_position().y
#	else:
#		pointer.position += get_local_mouse_position() - pos_pointer
#		pos_pointer = get_local_mouse_position()


func _on_back_pressed():
	AudioMenu.play()
	get_tree().change_scene("res://src/Levels.tscn")


func _on_move_pressed():
	AudioMenu.play()
	if(!przesuwanie):
		przesuwanie = true
		$move.normal = takpressed
		$move.pressed = takpressed
	else:
		przesuwanie = false
		$move.normal = niepressed
		$move.pressed = niepressed
	#tutaj włączamy przesuwanie po mapie


func _on_plak_pressed():
	if(przesuwanie):
		#tutaj aktywujemy przesuwanie
		pos_x = get_local_mouse_position().x
		pos_y = get_local_mouse_position().y
		set_process(true)
#	else:
#		pos_pointer = get_local_mouse_position()
#		pointer = pointer_scene.instance()
#		add_child(pointer)
#		pointer.position = get_local_mouse_position()


func _on_plak_released():
	set_process(false)
	pointer.free()
