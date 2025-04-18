extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var animator = $AnimatedSprite2D
	animator.hide()
	animator.play('sleeping')

func init_for_jumping() -> void:
	var animator = $AnimatedSprite2D
	animator.show()
	animator.play('default')
	
func frame_jump() -> void:
	var animator= $AnimatedSprite2D
	var frame = animator.get_frame()
	if (frame >= 0 and frame <3) or animator.animation == 'default':
		$CharacterBody2D/CollisionPolygon2D.polygon = $CharacterBody2D/frame0.polygon
	elif frame == 3:
		$CharacterBody2D/CollisionPolygon2D.polygon = $CharacterBody2D/frame3.polygon
	elif frame == 4:
		$CharacterBody2D/CollisionPolygon2D.polygon = $CharacterBody2D/frame4.polygon
	elif frame == 5:
		$CharacterBody2D/CollisionPolygon2D.polygon = $CharacterBody2D/frame5.polygon
	elif frame == 6:
		$CharacterBody2D/CollisionPolygon2D.polygon = $CharacterBody2D/frame6.polygon
	elif frame == 7:
		$CharacterBody2D/CollisionPolygon2D.polygon = $CharacterBody2D/frame7.polygon
	elif frame == 8:
		$CharacterBody2D/CollisionPolygon2D.polygon = $CharacterBody2D/frame8.polygon
	elif frame == 9:
		$CharacterBody2D/CollisionPolygon2D.polygon = $CharacterBody2D/frame9.polygon
	elif frame >= 10:
		$CharacterBody2D/CollisionPolygon2D.polygon = $CharacterBody2D/frame10.polygon
	
func jump() -> void:
	var animator = $AnimatedSprite2D
	if Input.is_action_just_pressed("ui_select") and animator.animation != "jumping":
		animator.play('jumping')
	else:
		animator.play('default')
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
