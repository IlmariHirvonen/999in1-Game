extends KinematicBody2D


const UP = Vector2(0,-1)
const GRAV = 40
const FALLSPEED = 800
const MAXSPEED = 300

var motion = Vector2()
func _ready():
	pass 

func _physics_process(delta):
	motion.y += GRAV
	if(motion.y > FALLSPEED):
		motion.y = FALLSPEED
		
	
	if Input.is_action_pressed("right"):
		motion.x = MAXSPEED
	elif Input.is_action_pressed("left"):
		motion.x = -MAXSPEED
	
	else:
		motion.x = 0
		
	if Input.is_action_just_pressed("jump"):
		motion.y = -MAXSPEED*3
		motion.y = -MAXSPEED*3

	motion = move_and_slide(motion, UP)
