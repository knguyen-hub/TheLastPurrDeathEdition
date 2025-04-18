extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var cat = get_node('cat') # Replace with function body.
	cat.init_for_jumping()
	var ball_anim = get_node('yarn_ball/AnimatedSprite2D')
	ball_anim.play('default')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	var animator = get_node("cat/AnimatedSprite2D")
	if animator.get_frame() == 12:
		animator.play('default')
	elif Input.is_action_just_pressed("ui_select") and (animator.animation == "default" or animator.get_frame() >= 7):
		animator.frame = 0
		animator.play('jumping')
