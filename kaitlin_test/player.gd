extends CharacterBody2D

const speed = 100

func _physics_process(delta: float) -> void:
	var anim = $AnimatedSprite2D
	anim.play('default')
	player_movement(delta)
		
func player_movement(delta):
	if Input.is_action_pressed('ui_right'):
		
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed('ui_left'):
		velocity.x = -speed
		velocity.y=0
	elif Input.is_action_pressed('ui_down'):
		velocity.x = 0
		velocity.y = speed
	elif Input.is_action_pressed('ui_up'):
		velocity.x=0
		velocity.y = -speed
		
	else:
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide()
