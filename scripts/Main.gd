extends Node2D

var enemy_selected = false # stub, change at enemy_id later
var card_id = ""

func _ready():
	pass 



func _on_Node2D_card_selected(id):
	card_id = id
	print(card_id)



func _on_Enemy_selected(index):
	if card_id != "":
		get_child(index).get_damage(3)


func _on_Enemy_killed(index):
	print("Enemy %d killed" % index)
