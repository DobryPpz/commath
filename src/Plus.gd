extends Node2D

onready var untouched = load("res://grafika/kwadracik.png")
onready var touched = load("res://grafika/wybor.png")

func _ready():
	$TouchScreenButton.set_passby_press(true)






func _on_TouchScreenButton_pressed():
	$Sprite.texture = touched
