extends KinematicBody2D

export var speed =1000
var aim = Vector2()

func _ready():
	print(get_pos())
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	move(speed*delta*aim)
	pass