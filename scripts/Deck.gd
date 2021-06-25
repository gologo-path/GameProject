class DeckClass:
	var deck = []

	func _init(deck):
		self.deck = deck.duplicate(true)

	func get_card():
		randomize()
		self.deck.shuffle()
		if(deck.size() == 0):
			return null
		return deck.pop_back()

	func put_card(card):
		self.deck.append(card)
