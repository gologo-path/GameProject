extends Node2D

signal card_selected(card)

onready var card_scene = preload("res://scenes/Card.tscn")

func card_selected(card):
	emit_signal("card_selected",card)

func destroy_card(index):
	remove_child(get_child(index))

func add_card(card):
	var new_card = card_scene.instance() 
	add_child(new_card)
	new_card.position = Vector2(200*get_child_count(),0)
	new_card.get_child(0).set_card(card)

func clear_hand():
	for child in get_children():
		remove_child(child)

func _ready():
	pass

func _process(delta):
	pass
