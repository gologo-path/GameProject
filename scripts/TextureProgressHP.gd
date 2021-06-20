extends TextureProgress


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.max_value = get_parent().get_parent().get_max_helth()
	self.value = get_parent().get_parent().get_current_helth()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.max_value = get_parent().get_parent().get_max_helth()
	self.value = get_parent().get_parent().get_current_helth()

