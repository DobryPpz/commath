extends Node2D

export var val = 1
onready var untouched = load("res://grafika/kwadracik.png")
onready var touched = load("res://grafika/wybor.png")
var symbol = val
var typ = "liczba"

func _ready():
	$Label.text = str(val)
	symbol = str(val)
	print(int($Label.text))
	$TouchScreenButton.set_passby_press(true)




func _on_TouchScreenButton_pressed():
	if(autoload.przesuwanie == false):
		$Sprite.texture = touched
		autoload.okienka.append(self)
		if(autoload.starter == null):
			autoload.starter = self
