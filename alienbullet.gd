extends Area2D

var speed = -300

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	var collidedObject = get_parent().move_and_collide(Vector2(0, -speed * delta))
	if (collidedObject):
		collidedObject.get_collider().queue_free()
		queue_free()
	

func _on_shot_body_entered(body):
	if body.name == "SI-Player":
		get_tree().reload_current_scene()
	if body.name =="Shot":
		queue_free()
		
