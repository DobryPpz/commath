extends Node2D

onready var untouched = load("res://grafika/kwadracik.png")
onready var touched = load("res://grafika/wybor.png")
var symbol = "-"
var typ = "dzialanie"


func _ready():
	$TouchScreenButton.set_passby_press(true)






func _on_TouchScreenButton_pressed():
	if(autoload.przesuwanie == false):
		$Sprite.texture = touched
		autoload.okienka.append(self)
		if(autoload.starter == null):
			autoload.starter = self
