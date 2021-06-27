extends Node2D

var card = null
var used = false # bool flag to save state of selected card, if true then card removed from hand and flag turned to false
const enum_types = preload("res://scripts/TypeCardEnum.gd").TypeCard
const enum_discard = preload("res://scripts/TypeCardEnum.gd").TypeDiscard
var CardClass = preload("res://scripts/CardClass.gd").CardClass

var flag = false

var cards_collection = [
	CardClass.new(enum_types.ATTACK,2,"res://assets/священная заточка карточка.png",enum_discard.SAVE),
	CardClass.new(enum_types.ATTACK,2,"res://assets/священная заточка карточка.png",enum_discard.SAVE),
	CardClass.new(enum_types.ATTACK,2,"res://assets/священная заточка карточка.png",enum_discard.SAVE),
	CardClass.new(enum_types.DEFENS,-2,"res://assets/подорожник.png",enum_discard.SAVE),
	CardClass.new(enum_types.DEFENS,-2,"res://assets/подорожник.png",enum_discard.SAVE),
	CardClass.new(enum_types.ALL,2,"res://assets/1.png",enum_discard.BURN),
	CardClass.new(enum_types.ALL_ENEMIES,2,"res://assets/3.png",enum_discard.BURN)
]
var player = preload("res://scripts/PlayerClass.gd").PlayerClass.new(10,10,cards_collection)
var deck = preload("res://scripts/Deck.gd").DeckClass.new(cards_collection)
var discard_deck = []

func get_max_helth():
	return player.get_max_helth()
func get_current_helth():
	return player.get_current_helth()

func get_damage(damage):
	player.get_damage(damage)
	if damage > 0:
		$Sprite.texture = load("res://assets/animations/Player/Damaged.png")
		$Timer.start()

func _ready():
	player.connect("killed",self,"_on_Player_killed")
	_on_Button_pressed()
	

func _on_Player_killed():
	$Sprite.texture = load("res://assets/animations/Player/Dead.png")
	$Timer.stop()
	$Button.disabled = true
	
func _on_Node2D_card_selected(card):
	self.card = card


func _on_Enemy_selected(index):
	if card != null:
		if self.card.get_type() == enum_types.ATTACK:
			get_child(index).get_damage(self.card.get_damage())
			used = true
	if used:
		$Sprite.texture = load("res://assets/animations/Player/Attack.png")
		$Timer.start()
		get_node("Cards").destroy_card(card.get_child_index())
		if card.get_type_discard() == enum_discard.SAVE:
			discard_deck.append(card)
		card = null
		used = false


func _on_Enemy_killed(index):
	print("Enemy %d killed" % index)



func _on_ClickArea_clicked_in_area():
	if self.card != null:
		match self.card.get_type():
			enum_types.DEFENS:
				self.get_damage(card.get_damage())
				used = true
			enum_types.ALL:
				self.get_damage(card.get_damage())
				used = true
				get_tree().call_group("all_enemies","get_damage",self.card.get_damage())	
			enum_types.ALL_ENEMIES:
				used = true
				get_tree().call_group("all_enemies","get_damage",self.card.get_damage())
		
		if used:
			get_node("Cards").destroy_card(card.get_child_index())
			if card.get_type_discard() == enum_discard.SAVE:
				discard_deck.append(card)
			card = null
			used = false


func _on_Timer_timeout():
	$Sprite.texture = load("res://assets/animations/Player/Normal.png")
	$Timer.stop()
	if player.get_current_helth() <= 0:
		_on_Player_killed()


func _on_Button_pressed():
	card = null
	if flag:
		for enemy in get_tree().get_nodes_in_group("all_enemies"):
			if enemy != null:
				if enemy.get_current_helth() > 2:
					self.get_damage(enemy.get_strenght())
				else:
					enemy.get_damage(-enemy.get_strenght())
	else:
		flag = true
	var prev_hand = $Cards.clear_hand()
	for card in prev_hand:
		if card.get_type_discard() == enum_discard.SAVE:
			discard_deck.append(card)
	var count = 3
	var size = deck.size()
	for i in range(0,min(size,count)):
		$Cards.add_card(deck.get_card()) 
	if size < 3:
		deck.extend(discard_deck)
		discard_deck.clear()
		for i in range(0,count-size):
			$Cards.add_card(deck.get_card())
