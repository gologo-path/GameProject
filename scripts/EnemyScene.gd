extends Node2D

func _ready():
	pass # Replace with function body.

signal killed
signal selected

var max_helth = 5
var helth = max_helth



func get_damage(damage):
	helth -= damage
	if helth <= 0:
		emit_signal("killed")
		# TODO destoy self

func selected():
	emit_signal("selected")
