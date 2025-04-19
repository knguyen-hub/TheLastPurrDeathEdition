extends AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	show()
	play("default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	"""var player = get_node('../player')
	
	var player_coords = player.global_position
	if global_position.distance_to(player_coords) < 100:
		if Input.is_action_pressed('select'):
			hide()
		play('hover')
	else:
		play('default')"""
