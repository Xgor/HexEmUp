extends Node2D
var connected = true
var broom
var witch
var this
export var connectDist = 32

func _ready():
	this = get_node(".")
	broom = get_node("Broom")
	witch = get_node("Broom/Witch")
	broom.connector = this
	witch.connector = this
	
	set_process(true)
	set_process_input(true)
	pass

	
func _input(event):
	if event.is_action_pressed("broom_action2") or event.is_action_pressed("witch_action2"):
		if connected:
			disconnect()
		#else:
		#	connect()
	pass
	
func _process(delta):
	if not connected:
		if witch.get_pos().distance_squared_to(broom.get_pos()) < connectDist*connectDist:
			connect()
	pass

func isConnected():
	return witch.get_parent() == broom
	
func disconnect():
	connected = false
	witch.set_pos(broom.get_pos()+witch.get_pos())
	broom.remove_child(witch)
	this.add_child(witch)
	witch.Disconnect()
	broom.Disconnect()
	pass
	
func connect():
	connected = true
	this.remove_child(witch)
	broom.add_child(witch)
	witch.Connect()
	broom.Connect()
	pass