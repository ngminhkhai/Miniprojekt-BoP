extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("pause"):
		var new_pause_state = not get_tree().paused
		get_tree().paused = not get_tree().paused
		visible = new_pause_state
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Resume_Game_pressed():
	var new_pause_state = not get_tree().paused
	get_tree().paused = not get_tree().paused
	visible = new_pause_state


func _on_MainMenu_pressed():
	var new_pause_state = not get_tree().paused
	get_tree().paused = not get_tree().paused
	visible = new_pause_state
	get_tree().change_scene("res://MainMenu.tscn")
