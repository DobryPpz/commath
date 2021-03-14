extends Node2D


var pos
var pos_1
var pos_2

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)
	$Proba_1.position.x = 0
	$Proba_2.position.x = 400
	pos_1 = 0
	pos_2 = 400
	print(get_tree().get_root().get_node("Levels/Proba_1/kontener").name)


func _on_TouchScreenButton_pressed():
	set_process(true)
	pos = get_local_mouse_position().x

func _on_TouchScreenButton_released():
	set_process(false)
	$Proba_1.position.x = pos_1
	$Proba_2.position.x = pos_2
	if(pos-get_local_mouse_position().x >= 100 and pos_2 >= 400):
		pos_1 -= 400
		pos_2 -= 400
	elif(get_local_mouse_position().x - pos >= 100 and pos_1 < 0):
		pos_1 += 400
		pos_2 += 400
	$Proba_1.position.x = pos_1
	$Proba_2.position.x = pos_2
	
func _process(delta):
	$Proba_1.position.x = pos_1 + (get_local_mouse_position().x-pos)
	$Proba_2.position.x = pos_2 + (get_local_mouse_position().x-pos)


func _on_back_released():
	get_tree().change_scene("res://src/Menu.tscn")
