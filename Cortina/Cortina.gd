extends StaticBody


var down_vel= 3
var up_vel = 7

var pos = 7

var state = 0

onready var cortina = get_node("Cort") 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	
	if state==-1:
		mover(-up_vel, delta)
	elif state == 0:
		pass #return
	elif state ==1:
		mover(down_vel,delta)
	
	if Input.is_action_pressed("ui_down"):
		state = 1
	elif Input.is_action_pressed("ui_up"):
		state = -1
	elif Input.is_action_just_pressed("ui_left"):
		state = 0
	



func mover(vel,delta):
	#Control para no subir más
	
	pos += vel*delta
	if pos>=7:
		pos=7
		return
	elif pos<0:
		pos=0
		return
	print(pos)
	trasladar(pos)
	
	


func trasladar(var size:float):
	var y_scale = float(size/7)
	self.scale = Vector3(1,y_scale,1)
	self.translation = Vector3(0,7-size,0)
	pass

func changeState (stat:int):
	state = stat
