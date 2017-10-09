extends PathFollow2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var offset = 0
export var speed = 100

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	offset += delta*speed
	set_offset(offset)
	pass