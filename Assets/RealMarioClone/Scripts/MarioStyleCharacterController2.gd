extends KinematicBody2D

onready var animation_tree = $AnimationTree
onready var audio_stream_player = $AudioStreamPlayer
onready var death_sound = $DeathSound
onready var state_machine = animation_tree.get("parameters/playback")

onready var camera = get_parent().get_node("Camera2D")
onready var player = get_parent().get_node("Player")

# Used for cayote frames
var grace_frames = 7
var jump_buffer_frames = 4
var time_start = 0
var grounded_time = 0
var jump_buffer = 0

var camera_offset = -800
var has_jumped = false

var turned_right = true




const UP = Vector2(0,-1)
const GRAV = 60
const LGRAV = 30
const FALLSPEED = 1400
const LFALLSPEED = 600
const MAXSPEED = 500


var motion = Vector2()
func _ready():
	time_start = current_time()
	state_machine.start("Idle")


	
func _process(delta):
	
	
	if camera.position.x < player.position.x-1744/2:
		camera.position.x = player.position.x-1744/2

		
	
	elif motion.x > 0 && (camera.position.x-player.position.x) != 0 &&(camera.position.x-player.position.x) < camera_offset :
		camera.position.x += MAXSPEED*0.85/((camera.position.x-player.position.x))
var dead = false
var death_time = 0
signal death
func _on_Player_death():
	pass
	
func _physics_process(delta):
	if dead:
		if (current_time() - death_time) > 1000:
			var scene_path = get_tree().current_scene.filename
			get_tree().change_scene(scene_path)
	
	if self.position.y > 1056 && !dead:
		death_sound.play()
		dead = true
		death_time = current_time()
		
		
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
		if (!turned_right):
			self.scale.x = -1
			turned_right = true
		state_machine.travel("Run")

		motion.x = MAXSPEED
	elif Input.is_action_pressed("left"):
		if turned_right:
			self.scale.x = -1
			turned_right = false
		state_machine.travel("Run")
		motion.x = -MAXSPEED
	else:
		motion.x = 0
		state_machine.travel("Idle")
		
	if Input.is_action_just_pressed("jump"):
		jump_buffer = current_time() + delta*jump_buffer_frames*1000 
		
	if jump_buffer > current_time() && grounded_time > current_time() && !has_jumped:
		audio_stream_player.play()
		grounded_time += 0.1
		has_jumped = true
		motion.y = -MAXSPEED*2


	motion = move_and_slide(motion, UP)


func current_time():
	var temp_time = OS.get_system_time_msecs()
	return temp_time
