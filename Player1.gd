extends KinematicBody2D


export var SPEED = 50
export var JUMPFORCE = - 700
export var GRAVITY = 30
export var cOUNTDOWN = 5
export var SLIDE_FRICTION = 400
export var ScoreScene:PackedScene
export var PROTECTION = 0

var crown = 0
#var coins = 0
var velocity = Vector2(0,0)
var on_ground = false
var JUMPCOUNT = 0
var is_sliding = false
var can_slide = false
var shielded = false

onready var neutral_shape = $Neutral
onready var slide_shape = $Slide

# warning-ignore:unused_argument
func _physics_process(delta):
	handle_player_collision_shapes()
	check_sliding_logic()
	check_is_in_air()
	velocity.x += SPEED
	
	if Input.is_action_just_pressed("ui_up"):
		if JUMPCOUNT < 2:
			JUMPCOUNT+=1
			velocity.y = JUMPFORCE
			on_ground = false
			$SoundJump.play()

	velocity.y = velocity.y + GRAVITY

	velocity.y = move_and_slide(velocity,Vector2.UP,true).y
	
	velocity.x = lerp(velocity.x,0,0.2)
	
	
	
func handle_player_collision_shapes():
	if(is_sliding and slide_shape.disabled):
		neutral_shape.disabled = true
		slide_shape.disabled = false
	elif(!is_sliding and neutral_shape.disabled):
		neutral_shape.disabled = false
		slide_shape.disabled = true

func check_is_in_air():
	if is_on_floor():
		if on_ground == false:
			on_ground = true
			JUMPCOUNT = 0
	else: 
		if on_ground == true:
			on_ground = false
			JUMPCOUNT = 2
		if velocity.y < 0:
			$Sprite.play("jump")
	
func check_sliding_logic():
	if (is_on_floor()):
		if(!is_sliding): can_slide = true
	else:
		can_slide = false
	if(can_slide and Input.is_action_pressed("ui_down")):
		is_sliding = true
		can_slide =false
	if(is_sliding and !Input.is_action_pressed("ui_down")):
		is_sliding = false
	if(is_sliding):
		$Sprite.play("slide")
	else:
		$Sprite.play("run")
	

#func add_coin ():
#	coins = coins +1 


#to-do : 
# define obstacles: areas where player receive "damage" or get slower if ur hit twices he dies
# switching to different scene, frome village to forest to castle
# menu (start, pause, TryAgain, Score)
# more tiles second area (forest)
func _onTimer_timeout():
	$Timer.stop()
	set_modulate(Color(1,1,1,1))
	print("test2")
	velocity.x+=SPEED



func bounce():
	velocity.y = JUMPFORCE * 0.7 

func ouch(var enemyposx):
	if(shielded):
		PROTECTION -=1
		$FullShield.visible = false
		$HalfShield.visible = true
		if(PROTECTION==0):
			shielded = false
			$HalfShield.visible = false
	else:
		Global.lose_life()
		set_modulate(Color(1,0.3,0.3,0.4))
		velocity.y = JUMPFORCE * 0.5

#	if position.x < enemyposx:
#		velocity.x = -800
#	elif position.x > enemyposx:
#		velocity.x = 800  
	
	Input.action_release("ui_left")
	Input.action_release("ui_right")
	
	$Timer2.start()
	


func _on_Timer2_timeout():
	set_modulate(Color(1,1,1,1))
	


func _on_Shield_shield_collected():
		set_modulate(Color(1,1,1,1))
		PROTECTION = 2
		$FullShield.visible=true
		shielded = true

func _on_Fallzone_body_entered(body):
	PROTECTION = 0
	shielded = false
	$FullShield.visible = false
	$HalfShield.visible = false
	Global.lose_life()

	
func _on_Fallzone2_body_entered(body):
	PROTECTION = 0
	shielded = false
	$FullShield.visible = false
	$HalfShield.visible = false
	Global.lose_life()



func _on_FallZone3_body_entered(body):
	PROTECTION = 0
	shielded = false
	$FullShield.visible = false
	$HalfShield.visible = false
	Global.lose_life()
