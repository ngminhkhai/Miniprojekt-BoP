extends Node

var max_lives = 3
var lives = max_lives
var hud2d
var coins = 0

func lose_life():
	lives -= 1
	hud2d.load_hearts()
	if lives <= 0:
		coins = 0
		get_tree().change_scene("res://GameoverMenu.tscn")
