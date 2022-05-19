extends KinematicBody2D
onready var audio_stream_player = $AudioStreamPlayer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const UP = Vector2(0,-1)
const GRAV =  60
const SPEED = -500
const FALLSPEED = 1400
var motion = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	audio_stream_player = get_node("AudioStreamPlayer")
	pass # Replace with function body.



func _physics_process(delta):
	motion.x = SPEED
	motion.y += GRAV
	if(motion.y > FALLSPEED):
			motion.y = FALLSPEED
	if is_on_floor():
		motion.y = 0
	var collision = move_and_collide(motion*delta)
	if collision:
		motion = motion.slide(collision.normal)
		if collision.normal == Vector2(0,1):
			emit_signal("death")
			queue_free()
		
signal death
	




func _on_KinematicBody2D_death():
	var death_sound_player = get_node("/root/World/EnemyDeathSound")
	death_sound_player.play()

