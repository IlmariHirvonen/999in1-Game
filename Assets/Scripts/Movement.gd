extends KinematicBody2D

onready var camera = get_parent().get_node("Camera2D")
onready var player = get_parent().get_node("Player")

# Used for cayote frames
var grace_frames = 7
var jump_buffer_frames = 4
var time_start = 0
var grounded_time = 0
var jump_buffer = 0

var camera_offset = 0
# Used to prevent camera from moving forwards when shuffeling
var frames_since_moving = 0 
# Used to set the amount of frames to wait
var frames_before_camera_movement = 30

var max_camera_offset = -150

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
		
	else:
		camera_offset = max(player.position.x - camera.position.x, max_camera_offset)

			
		if camera_offset < 0 && Input.is_action_pressed("right"):
			print(camera_offset)
			frames_since_moving += 1
			if frames_since_moving > frames_before_camera_movement:
				pass
			else:
				camera_offset += frames_since_moving/60
				camera.position.x = player.position.x - camera_offset
		else: 
			#camera.position.x = player.position.x + camera_offset
			frames_since_moving = 0
		# Wait some time bafore recentering the camera
			#Recenter the camera slowly
		
	"""if(camera.position.x < player.position.x + max_camera_offset):
		camera.position.x = player.position.x + camera_offset
	else:
		camera.position.x = player.position.x + camera_offset
	if frames_since_moving < frames_before_camera_movement:
			camera_offset = max_camera_offset
	elif camera_offset > 0:
		camera_offset -= 10"""
		
	
	#elif (camera.position.x-player.position.x) != 0:
	#	camera_offset -= MAXSPEED*0.9/((camera.position.x-player.position.x))

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
