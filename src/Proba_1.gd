extends level_screen



func _ready():
	nr_screen = 0
	rysuj(get_child(0))


func _on_TouchScreenButton_pressed():
	pass # Replace with function body.


func _on_touch_level_1_pressed():
	get_tree().change_scene("res://src/poziomy/Level_1.tscn")
