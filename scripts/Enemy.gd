extends Sprite

func _ready():
	pass 

signal clicked

#func _process(delta):
#	pass

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			emit_signal("clicked") # signal on click
