class CardClass:
	var damage = 0
	var type = 0
	var child_index = 0

	func init(type,damage):
		self.damage = damage
		self.type = type
		self.child_index = child_index

	func get_damage():
		return damage
	
	func get_type():
		return type
	
	func set_child_index(childe_index):
		self.child_index = childe_index
	
	func get_child_index():
		return child_index
