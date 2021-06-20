extends Node2D

var rng = RandomNumberGenerator.new()
var img = preload("res://assets/3.png")
signal card_selected(card)
const enum_types = preload("res://scripts/TypeCardEnum.gd").TypeCard
var card = preload("res://scripts/CardClass.gd").CardClass.new()
#var card = class_card.instance()


func card_selected():
	emit_signal("card_selected",card)

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
	card.init(enum_types.ATTACK,3)
	rand_card()
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
