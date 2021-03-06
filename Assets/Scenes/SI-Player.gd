extends KinematicBody2D

var bullet = preload("res://Assets/Scenes/SI-Bullet.tscn")
var speed = 150

func _ready():
	set_process(true)
	set_physics_process(true)
	
func _process(delta):
	if Input.is_action_just_pressed("shoot"):
	# spawn bullet
		var bulletInstance = bullet.instance()
		bulletInstance.position = Vector2(position.x, position.y - 30)
		get_tree().get_root().add_child(bulletInstance)

func _physics_process(delta):
	if Input.is_action_pressed("left"):
		move_and_collide(Vector2(-speed * delta, 0))
	elif Input.is_action_pressed("right"):
		move_and_collide(Vector2(speed * delta, 0))
