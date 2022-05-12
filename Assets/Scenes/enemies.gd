extends Node2D

func _process(delta):
	var enemies = get_child_count()
	if enemies == 0:
		get_tree().change_scene("res://Assets/Scenes/endstate.tscn")
		
