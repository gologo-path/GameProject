extends Node2D

var enemy_selected = false # stub, change at enemy_id later
var card_id = ""

func _ready():
	pass 



func _on_Node2D_card_selected(id):
	card_id = id
	print(card_id)


func _on_Sprite2_selected():
	enemy_selected = not enemy_selected
	print(enemy_selected)
