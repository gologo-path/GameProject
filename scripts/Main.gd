extends Node2D

var enemy_selected = false # stub, change at enemy_id later
var card = null

func _ready():
	pass 

func _on_Node2D_card_selected(card):
	self.card = card


func _on_Enemy_selected(index):
	if card != null:
		# TODO switch by ENUM
		get_child(index).get_damage(3)


func _on_Enemy_killed(index):
	print("Enemy %d killed" % index)

