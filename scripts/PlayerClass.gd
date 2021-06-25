class PlayerClass:
	var max_helth = 0
	var helth = 0
	var deck = deck
	signal killed
	
	func _init(helth,max_helth,deck):
		self.max_helth = max_helth
		self.helth = helth
		self.deck = deck
		
	func get_max_helth():
		return max_helth
	func get_current_helth():
		return helth
	func get_deck():
		return deck
	
	func set_max_helth(max_helth):
		self.max_helth = max_helth
	func set_current_helth(helth):
		self.helth = helth
	func set_deck(deck):
		self.deck = deck
	
	
	func get_damage(damage):
		helth -= damage
		if helth <= 0:
			emit_signal("killed")
