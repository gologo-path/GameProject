extends Sprite

func _ready():
	pass 

signal selected(index)
signal killed(index)

var helth = 5;

#func _process(delta):
#	pass

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			emit_signal("selected",get_index()) # signal on click

func get_damage(damage):
	helth -= damage
	if helth <= 0:
		emit_signal("killed",get_index())
		# TODO destoy self
