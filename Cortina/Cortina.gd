extends Spatial


var down_vel= 3
var up_vel = 4
var bajar = false
var pos = 7

onready var cortina = get_node("Cort") 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	#cortina.scale= Vector3(1,0.5,1)
	#for i in range(700):
	#	trasladar((i/10)*delta)
	#	pass
	if Input.is_action_pressed("ui_down"):
		mover(down_vel,delta)
	elif Input.is_action_pressed("ui_up"):
		mover(-up_vel,delta)
	elif Input.is_action_just_pressed("ui_left"):
		bajar = false
		trasladar(3.5)
		
	elif Input.is_action_just_pressed("ui_down"):
		bajar = true
	if bajar==true:
		mover(down_vel,delta)
	

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
	cortina.scale = Vector3(1,y_scale,1)
	cortina.translation = Vector3(0,7-size/2,0)
	pass
