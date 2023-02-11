extends Button




func _on_Tryagain_pressed():
	Global.lives = Global.max_lives
	Global.coins = 0
	get_tree().change_scene("res://Game.tscn")
