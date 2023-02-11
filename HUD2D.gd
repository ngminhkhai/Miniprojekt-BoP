extends CanvasLayer
#var coins = 0
var crown = 0

func _ready():
	$Coins.text = String(Global.coins)
	$crowns.text = String(crown)
	load_hearts()
	Global.hud2d = self


func _on_coin_collected():
	Global.coins = Global.coins + 1
	_ready()

func load_hearts():
	$Heartfull.rect_size.x = Global.lives * 53
	$Heartempty.rect_size.x = (Global.max_lives - Global.lives) * 53
	$Heartempty.rect_position.x = $Heartfull.rect_position.x + $Heartfull.rect_size.x + $Heartfull.rect_scale.x


func _on_coins_coin_collected():
	Global.coins = Global.coins + 1
	_ready()

func _physics_process(delta):
	if crown == 3:
		get_tree().change_scene("res://WinMeunu.tscn")


func _on_crown_collected():
	crown = crown + 1 
	_ready()
