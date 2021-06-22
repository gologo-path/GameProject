extends Node2D

var rng = RandomNumberGenerator.new()
var img = preload("res://assets/3.png")

signal card_selected(card)

func card_selected(card):
	emit_signal("card_selected",card)

func destroy_card(index):
	remove_child(get_child(index))

func rand_card():
	var my_random_number = rng.randi_range(0, 3)
	if(my_random_number == 1):
		var mysprite = get_node("Node2D/Sprite")
		mysprite.set_texture(img)
	if(my_random_number == 2):
		var mysprite = get_node("Node2D2/Sprite")
		mysprite.set_texture(img)
	if(my_random_number == 3):
		var mysprite = get_node("Node2D3/Sprite")
		mysprite.set_texture(img)
		

func _ready():
	rand_card()

func _process(delta):
	pass
