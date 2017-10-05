extends KinematicBody2D

var velocity = Vector2()
var connectPos
var connector
export var gravity = 300
export var jumpPower = 200
export var hoverMaxFallSpeed = 100

func _ready():
	set_fixed_process(true)
	pass

func _fixed_process(delta):

	
	
	if not connector.connected:
		OffBroomProcess(delta)
	pass


func OffBroomProcess(delta):
	if Input.is_action_pressed("witch_right"):
		velocity.x = 100
	elif Input.is_action_pressed("witch_left"):
		velocity.x = -100
	else:
		velocity.x = 0
	
	velocity.y += gravity*delta
	if velocity.y > hoverMaxFallSpeed:
		velocity.y = hoverMaxFallSpeed
	move(velocity*delta)
	pass
	
func Connect():
	set_pos(Vector2(0,-36))
	velocity.x= 0
	velocity.y = 0
	pass
func Disconnect():
	velocity.y = -jumpPower
	pass