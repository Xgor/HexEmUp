extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
const FLOOR_NORMAL = Vector2(0,-1)
const SLOPE_SLIDE_STOP = 25.0

export var speed = 400
export var drag = 11
export var spinSpeed = 20
var movVec = Vector2()
var velocity = Vector2() 
var connector
var broomSprite

func GetFriction():
	return drag
	pass

func GetAcceleration():
	return speed* drag
	pass

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	broomSprite = get_node("BroomSpr")
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
	
	var motion = velocity * delta
	motion = move(motion)
	
	if (is_colliding()):
		var n = get_collision_normal()
		motion = n.slide(motion)
		velocity = n.slide(velocity)
		move(motion)
	
	
	if not connector.connected:
		OffBroomProcess(delta)
	
	pass

func OffBroomProcess(delta):
	#if Input.is_action_pressed("broom_action2"):
#		broomSprite.rotate(delta*spinSpeed)
#	else:
#		broomSprite.set_rot(0)
	
	
	pass

func Connect():
	broomSprite.set_rot(0)
	pass
func Disconnect():
	velocity.y += 400
	pass