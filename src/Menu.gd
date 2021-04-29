extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print(autoload.get_level())
	print(autoload.level_icons[1])

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_exit_released():
	get_tree().quit()


func _on_play_released():
	AudioMenu.play()
	get_tree().change_scene("res://src/Tryb.tscn")

func _on_music_released():
	AudioMenu.play()

