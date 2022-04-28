extends KinematicBody2D


var speed = 15

var shootingcount = rand_range(0,50)

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
	
func _physics_process(delta):
	move_and_collide(Vector2(0, speed * delta))
	shootingcount +=delta
	if shootingcount >= 50:
		var bullet = preload("res://Assets/Scenes/SI-alienbullet.tscn")
		var firedbullet = bullet.instance()
		firedbullet.position = Vector2(position.x, position.y)
		get_parent().call_deferred("add_child", firedbullet)
	
	shootingcount = rand_range(0,50)
