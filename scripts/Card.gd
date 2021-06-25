extends Sprite

const enum_types = preload("res://scripts/TypeCardEnum.gd").TypeCard
var card

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			get_parent().get_parent().card_selected(card)
			card.set_child_index(get_parent().get_index())

func _ready():
	pass

func set_card(card):
	self.card = card
	scale = Vector2(0.31,0.25)
	self.texture = load(card.get_texture_path())
