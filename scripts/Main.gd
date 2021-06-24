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
	$Sprite.texture = load("res://assets/animations/Player/Damaged.png")
	$Timer.start()
	if helth <= 0:
		$Sprite.texture = load("res://assets/animations/Player/Dead.png")
		$Timer.stop()
		print("killed")

func _ready():
	pass 

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
			card = null
			used = false


func _on_Timer_timeout():
	$Sprite.texture = load("res://assets/animations/Player/Normal.png")
	$Timer.stop()


func _on_Button_pressed():
	if $Enemy != null:
		if $Enemy.get_current_helth() > 2:
			self.get_damage($Enemy.get_strenght())
		else:
			$Enemy.get_damage(-$Enemy.get_strenght())
