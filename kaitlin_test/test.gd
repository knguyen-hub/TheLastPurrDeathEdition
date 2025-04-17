extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var events : Array = []
	var text_event = DialogicTextEvent.new()
	text_event.text = "wow what a beautiful morning. i should check on prahas"
	events.append(text_event)
	var timeline : DialogicTimeline = DialogicTimeline.new()
	timeline.events = events
	# if your events are already resources, you need to add this:
	timeline.events_processed = true
	Dialogic.start(timeline)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var player = get_node("player")
	var catfood = get_node('AnimatedSprite2D')
	
	var player_coords = player.global_position
	var catfood_coords = catfood.global_position
	if catfood_coords.distance_to(player_coords) < 100:
		if Input.is_action_pressed('select'):
			catfood.hide()
			var found_cat_food_event : Array = []
			var text_event = DialogicTextEvent.new()
			text_event.text = 'found the cat food, i will set it out. next i should check the litter box'
			found_cat_food_event.append(text_event)
			var timeline : DialogicTimeline = DialogicTimeline.new()
			timeline.events = found_cat_food_event
			timeline.events_processed = true
			Dialogic.start(timeline)
		catfood.play('hover')
	else:
		catfood.play('default')
