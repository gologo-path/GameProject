extends Node
var deck = []
var hend = []

func _init(deck):
	self.deck = deck.duplicate(true)

func get_card():
	randomize()
	self.deck.shuffle()
	hend.append(self.deck[0])
	self.deck.remove(0)
	return hend

func put_card():
	for i in hend.size():
		self.deck.append(hend[i])
	hend.clear()
