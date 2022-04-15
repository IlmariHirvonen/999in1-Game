extends KinematicBody2D

onready var camera = get_parent().get_node("Camera2D")
onready var player = get_parent().get_node("Player")

var grace_frames = 7
var jump_buffer_frames = 4
var time_start = 0
var grounded_time = 0
var jump_buffer = 0

var has_jumped = false

const UP = Vector2(0,-1)
const GRAV = 40
const LGRAV = 20
const FALLSPEED = 800
const LFALLSPEED = 400
const MAXSPEED = 300

var motion = Vector2()
func _ready():
	time_start = current_time()

	
func _process(delta):
	if camera.position.x < player.position.x:
		camera.position.x = player.position.x
	elif motion.x > 0 && (camera.position.x-player.position.x) != 0 &&(camera.position.x-player.position.x) < 150 :
		camera.position.x += MAXSPEED*0.9/((camera.position.x-player.position.x))

func _physics_process(delta):

	if is_on_floor():
		has_jumped = false
		grounded_time = current_time() + delta * grace_frames * 1000
	
	if Input.is_action_pressed("jump"):
		motion.y += LGRAV
		if(motion.y > FALLSPEED):
			motion.y = FALLSPEED
	else:
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
		jump_buffer = current_time() + delta*jump_buffer_frames*1000 
		
	if jump_buffer > current_time() && grounded_time > current_time() && !has_jumped:
		grounded_time += 0.1
		has_jumped = true
		motion.y = -MAXSPEED*2


	motion = move_and_slide(motion, UP)


func current_time():
	var temp_time = OS.get_system_time_msecs()
	return temp_time
