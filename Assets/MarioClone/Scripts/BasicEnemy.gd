extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const UP = Vector2(0,-1)
const GRAV = 60
const SPEED = -50
const FALLSPEED = 1400
var motion = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(delta):
	pass
	
func _physics_process(delta):
	motion.x = SPEED
	motion.y += GRAV
	if(motion.y > FALLSPEED):
			motion.y = FALLSPEED
	var collision = move_and_collide(motion)
	
	#get_node("KillCollider").

