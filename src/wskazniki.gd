extends Node2D

onready var czarny = load("res://grafika/pointer_black.png")
onready var szary = load("res://grafika/pointer_grey.png")
onready var wskaznik = load("res://src/Wskaznik.tscn")

var pozycja

func _ready():
	pozycja = 1
	for i in range(0,autoload.licza_prob):
		var node = wskaznik.instance()
		if(i==0):
			node.get_child(0).set_texture(czarny)
		else:
			node.get_child(0).set_texture(szary)
			node.position.x += 10*i
		add_child(node)
			

func move_left():
	if(pozycja-1 >= 1):
		pozycja -= 1
		for i in range(1,autoload.licza_prob+1):
			if(i == pozycja):
				get_child(i-1).set_texture(czarny)
			else:
				get_child(i-1).set_texture(szary)
			
func move_right():
	if(pozycja+1 <= autoload.licza_prob):
		pozycja += 1
		for i in range(1,autoload.licza_prob+1):
			if(i == pozycja):
				get_child(i-1).set_texture(czarny)
			else:
				get_child(i-1).set_texture(szary)
