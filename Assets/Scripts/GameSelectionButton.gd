extends Button

export(bool) var isMain

func _ready():
	if(isMain):
		grab_focus() #grabs focus so menu can be interacted with using arrow keys
#grabs focus so menu can be interacted with using arrow keys
	
func _pressed():
	get_tree().change_scene("res://Assets/RealMarioClone/PlumberBoys.tscn")
