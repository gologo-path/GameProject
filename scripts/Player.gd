extends Sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	pass 
	
signal killed(index)
signal selected(index)

var max_helth = 5
var helth = max_helth

func get_max_helth():
	return max_helth
func get_current_helth():
	return helth

func get_damage(damage):
	helth -= damage
	if helth <= 0:
		emit_signal("killed",get_index())
		get_parent().remove_child(self)

func selected():
	emit_signal("selected",get_index())
