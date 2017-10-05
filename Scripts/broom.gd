extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var speed = 400
export var drag = 11
var movVec = Vector2()
var velocity = Vector2() 
var connector


func GetFriction():
	return drag
	pass

func GetAcceleration():
	return speed* drag
	pass

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	
	pass

func _fixed_process(delta):
	if(Input.get_joy_axis (1,0)> 0.5):
		movVec.x = Input.get_joy_axis (1,0)
	elif(Input.is_action_pressed("broom_right")):
		movVec.x = 1
	elif(Input.is_action_pressed("broom_left")):
		movVec.x = -1
	else:
		movVec.x = 0
	
	if(Input.get_joy_axis (1,1)> 0.5):
		movVec.y = Input.get_joy_axis (1,1)
	elif(Input.is_action_pressed("broom_up")):
		movVec.y = -1
	elif(Input.is_action_pressed("broom_down")):
		movVec.y = 1
	else:
		movVec.y = 0
	
	movVec = movVec.normalized()
	
	velocity -= GetFriction() * delta * velocity
	velocity += GetAcceleration() * delta*movVec
	
	move(velocity*delta)
	
	
	
	pass
	
func Connect():
	
	pass
func Disconnect():
	velocity.y += 400
	pass