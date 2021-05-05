extends Node2D

export var val = 1
onready var untouched = load("res://grafika/kwadracik.png")
onready var touched = load("res://grafika/wybor.png")

func _ready():
	$Label.text = str(val)
	print(int($Label.text))
	$TouchScreenButton.set_passby_press(true)




func _on_TouchScreenButton_pressed():
	$Sprite.texture = touched
