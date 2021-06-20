class CardClass:
	var damage = 0
	var type = 0

	func init(type,damage):
		self.damage = damage
		self.type = type

	func get_damage():
		return damage
	
	func get_type():
		return type
