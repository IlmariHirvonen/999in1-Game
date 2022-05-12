extends Control

func _ready():
	
	visible = false
	get_parent().get_parent().layer = 1

var is_paused = false setget set_is_paused


func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		self.is_paused = !is_paused

func set_is_paused(value):
	get_node("PlaceholderBackground/CenterContainer/VBoxContainer/ResumeBtn").grab_focus()
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused
	

func _on_ResumeBtn_pressed():
	set_is_paused(false)


func _on_RestartBtn_pressed():
	set_is_paused(false)
	var scene_path = get_tree().current_scene.filename
	get_tree().change_scene(scene_path)


func _on_QuitBtn_pressed():
	set_is_paused(false)
	get_tree().change_scene("res://Assets/Scenes/MainMenu.tscn")
