extends Area2D

signal crown_collected

func _on_Crown_body_entered(body):
	$AnimationPlayer.play("woohoo")
	emit_signal("crown_collected")
	set_collision_mask_bit(0,false)
	$Crownsound.play()
	


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
