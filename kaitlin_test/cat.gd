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
	
func jump() -> void:
	var animator = $AnimatedSprite2D
	if Input.is_action_just_pressed("ui_select") and animator.animation != "jumping":
		animator.play('jumping')
	else:
		animator.play('default')
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
