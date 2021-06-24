extends Sprite

const enum_types = preload("res://scripts/TypeCardEnum.gd").TypeCard
var card = preload("res://scripts/CardClass.gd").CardClass.new()


func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			get_parent().get_parent().card_selected(card)
			card.set_child_index(get_parent().get_index())

func _ready():
	card.init(enum_types.ATTACK,3)
