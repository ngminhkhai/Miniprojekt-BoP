extends Node2D


export var mainGameScene : PackedScene




func _on_StartButton_button_up():
	Global.lives = Global.max_lives
	get_tree().change_scene(mainGameScene.resource_path)


func _on_ExitButton_button_up():
	get_tree().quit()
