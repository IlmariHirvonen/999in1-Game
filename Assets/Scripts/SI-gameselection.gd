extends Button

#func _ready():
#	grab_focus() #grabs focus so menu can be interacted with using arrow keys
	
func _pressed():
	get_tree().change_scene("res://Assets/Scenes/spaceInvaiders.tscn")

