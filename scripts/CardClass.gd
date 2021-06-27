class CardClass:
	var damage = 0
	var type = 0
	var child_index = 0
	var type_discard = 0
	var texture_path = ""

	func _init(type,damage,texture_path,type_discard):
		self.damage = damage
		self.type = type
		self.texture_path = texture_path
		self.type_discard = type_discard

	func get_damage():
		return damage
	
	func get_type():
		return type
		
	func get_texture_path():
		return texture_path
	
	func set_child_index(childe_index):
		self.child_index = childe_index
	
	func get_child_index():
		return child_index
	
	func get_type_discard():
		return type_discard
