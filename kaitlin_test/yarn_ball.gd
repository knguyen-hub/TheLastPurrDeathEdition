extends CharacterBody2D

var counter =0
var speed = 300.0
var good = true

func play_default_anim() -> void:
	var anim = $AnimatedSprite2D
	anim.pause()

func is_good() -> bool:
	return good

func _physics_process(delta: float) -> void:
	if (good):
		
		if counter > 2:
			speed += 50
			counter = 0
		if position[0] > 0:
			
			velocity.x = -speed
		else:
			counter += 1
			velocity.x = 0
			position = Vector2(1080, 380)
		var collision = move_and_collide(velocity * delta)
		if collision:
			good = false
			print('collision detected')
	else:
		velocity.x = 0
