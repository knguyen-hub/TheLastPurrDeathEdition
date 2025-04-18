extends CharacterBody2D

const speed = 100
var curr_direction = "none"

func _physics_process(delta):
	player_movement(delta)

func player_movement(delta):
	if Input.is_action_pressed('ui_right'):
		curr_direction = "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed('ui_left'):
		curr_direction = "left"
		play_anim(1)
		velocity.x = -speed
		velocity.y=0
	elif Input.is_action_pressed('ui_down'):
		curr_direction = "up"
		play_anim(1)
		velocity.x = 0
		velocity.y = speed
	elif Input.is_action_pressed('ui_up'):
		curr_direction = "down"
		play_anim(1)
		velocity.x=0
		velocity.y = -speed
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide()
	
func play_anim(movement):
	var dir = curr_direction
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("walk-right")
		elif movement == 0: 
			anim.play("idle")
	
	if dir == "left":
		anim.flip_h = true
		if movement == 1:
			anim.play("walk-right")
		elif movement == 0: 
			anim.play("idle")
			
	if dir == "up":
		if movement == 1:
			anim.play("walk-right")
		elif movement == 0: 
			anim.play("idle")
	
	if dir == "down":
		if movement == 1:
			anim.play("walk-right")
		elif movement == 0: 
			anim.play("idle")
	
