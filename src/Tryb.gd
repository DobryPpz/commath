extends Node2D

func _ready():
	pass
	
	

func _on_normal_pressed():
	AudioMenu.play()
	get_tree().change_scene("res://src/Levels.tscn")




func _on_auto_pressed():
	AudioMenu.play()


func _on_back_pressed():
	AudioMenu.play()
	get_tree().change_scene("res://src/Menu.tscn")
