extends Spatial

onready var timer = $Timer
#export onready var waitTime = timer.wait_time

onready var label = $Viewport/Label
signal timeOut


func _ready():
	set_as_toplevel(true)
	timer.one_shot = true

 
func _process(delta):
	label.text = str(round(timer.time_left))


var timer_active = false
func start_timer():
	if timer_active == false:
		timer.start()
	
func stop_timer():
	timer.stop()



func _on_Timer_timeout():
	
	emit_signal("timeOut")
