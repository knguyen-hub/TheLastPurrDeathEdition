extends CharacterBody2D

var counter =0
var speed = 300.0


func _physics_process(delta: float) -> void:
	if counter > 2:
		speed += 50
		counter = 0
	if position[0] > 0:
		
		velocity.x = -speed
	else:
		counter += 1
		velocity.x = 0
		position = Vector2(1080, 380)

	move_and_slide()
