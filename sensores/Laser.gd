 extends Spatial

onready var raycast = $RayCast
onready var laser_mask = $CSGCombiner/CSGBox
onready var cylinder = $CSGCombiner/CSGCylinder

#export var lenght = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#cylinder.height = lenght
	#cylinder.translation = Vector3(0,lenght/2+0.5,0)
	#laser_mask.translation = Vector3(0,lenght,0)
	#raycast.cast_to = Vector3(0,lenght,0)



func _process(delta):
	
	var object = raycast.get_collider()
	var hitpoint = raycast.get_collision_point()
	
	if object != null:
		laser_mask.height = hitpoint.distance_to(laser_mask.global_transform.origin) *2
	else:
		laser_mask.height = 0.01
