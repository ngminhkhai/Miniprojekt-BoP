extends Node2D


func _on_SwitchZone_body_entered(body):
	switch_to_Forest()

func _on_SwitchZone2_body_entered(body):
	switch_to_Castle()

func _on_Fallzone_body_entered(body):
	switch_to_village()

func _on_Fallzone2_body_entered(body):
	switch_to_Forest()


func _on_FallZone3_body_entered(body):
	switch_to_Castle()
	
func switch_to_village():
	$Player1.position.x = 23
	$Player1.position.y = 0
	$Player1/Camera2D.limit_bottom = 0
	$Player1/Camera2D.limit_top = 0
	$Village/VillageBackround/Daylight.visible = true
	false
	
func switch_to_Forest():
	$Player1.position.x = 23
	$Player1.position.y = 1000
	$Player1/Camera2D.limit_bottom = 1800
	$Player1/Camera2D.limit_top = 1200
	$Village/VillageBackround/Daylight.visible = false
	$Village/VillageBackround/Nighttime.visible = true
	$Village/VillageBackround/Castle.visible = false
	
func switch_to_Castle():
	$Player1.position.x = 23
	$Player1.position.y = -1000
	$Player1/Camera2D.limit_bottom = -600
	$Player1/Camera2D.limit_top = -1200
	$Village/VillageBackround/Daylight.visible = false
	$Village/VillageBackround/Nighttime.visible = false
	$Village/VillageBackround/Castle.visible = true


func _on_SwitchZone3_body_entered(body):
	if $HUD2D.crown < 2:
		get_tree().change_scene("res://GameoverMenu.tscn")
	
