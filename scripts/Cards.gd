extends Node2D

var rng = RandomNumberGenerator.new()
var img = preload("res://assets/3.png")
signal card_selected(id)

func card_selected(id):
	emit_signal("card_selected",id)

func rand_card():
	
	var my_random_number = rng.randi_range(0, 3)
	print(my_random_number)
	if(my_random_number == 1):
		var mysprite = get_node("Node2D/Sprite")
		mysprite.set_texture(img)
	if(my_random_number == 2):
		var mysprite = get_node("Node2D2/Sprite")
		mysprite.set_texture(img)
	if(my_random_number == 3):
		var mysprite = get_node("Node2D3/Sprite")
		mysprite.set_texture(img)
	pass

func _ready():

	rand_card()
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
