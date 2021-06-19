extends Node2D

signal card_selected(id)

func card_selected(id):
	emit_signal("card_selected",id)

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
