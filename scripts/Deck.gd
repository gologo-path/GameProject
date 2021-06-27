class DeckClass:
	var deck = []

	func _init(deck):
		self.deck = deck.duplicate(true)
		randomize()
		self.deck.shuffle()

	func get_card():
		if(deck.size() == 0):
			return null
		return deck.pop_back()

	func put_card(card):
		self.deck.append(card)
	
	func size():
		return deck.size()
	
	func extend(arr):
		deck.append_array(arr)
		randomize()
		self.deck.shuffle()
