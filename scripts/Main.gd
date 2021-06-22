extends Node2D

var enemy_selected = false # stub, change at enemy_id later
var card = null
var used = false # bool flag to save state of selected card, if true then card removed from hand and flag turned to false
const enum_types = preload("res://scripts/TypeCardEnum.gd").TypeCard

var max_helth = 5
var helth = max_helth

func get_max_helth():
	return max_helth
func get_current_helth():
	return helth

func get_damage(damage):
	helth -= damage
	print ("geted %d damage" % damage)
	if helth <= 0:
		print("killed")

func _ready():
	pass 

func _on_Node2D_card_selected(card):
	self.card = card


func _on_Enemy_selected(index):
	if card != null:
		match self.card.get_type():
			enum_types.ATTACK:
				get_child(index).get_damage(self.card.get_damage())
				used = true
			enum_types.DEFENS:
				self.get_damage(self.card.get_damage())
				used = true
	
	if used:
		get_node("Cards").destroy_card(card.get_child_index())
		card = null
		used = false


func _on_Enemy_killed(index):
	print("Enemy %d killed" % index)

