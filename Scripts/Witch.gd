extends KinematicBody2D

var velocity = Vector2()
var connectPos
var connector
export var gravity = 300
export var jumpPower = 200
export var hoverMaxFallSpeed = 100
var bulletInstance = preload("res://Objects/Bullet.tscn")
var aim = Vector2()

func _ready():
	set_fixed_process(true)
	aim.x = 1
	pass

func _fixed_process(delta):
	if(Input.is_action_pressed("witch_action1")):
		FireBullet()
	
	
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
	
	if is_colliding():
		velocity.y = 0
		
	
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
	

func FireBullet():
	var bullet = bulletInstance.instance()
	bullet.set_pos(get_global_pos())
	
	var newAim = Vector2()
	
	if Input.is_action_pressed("witch_right"):
		newAim.x = 1
	elif Input.is_action_pressed("witch_left"):
		newAim.x = -1
	else:
		newAim.x = 0
	
	if Input.is_action_pressed("witch_down"):
		newAim.y = 1
	elif Input.is_action_pressed("witch_up"):
		newAim.y = -1
	else:
		newAim.y = 0
	
	newAim=newAim.normalized()
	
	if not (newAim.x == 0 and newAim.y == 0):
		aim= newAim
	
	
	bullet.aim =aim
	get_tree().get_root().add_child(bullet)
	pass
	