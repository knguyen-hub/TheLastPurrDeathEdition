extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	await get_tree().create_timer(2.0).timeout
	var events : Array = []
	
	var text_event = DialogicTextEvent.new()
	text_event.text = "i remember when biscuit was just a kitten. he was so lively and playful, always causing mayhem"
	events.append(text_event)
	
	var text_event2 = DialogicTextEvent.new()
	text_event2.text = "he especially loved to play with my yarn! he would always inevitably end up making a mess and getting himself all tangled up"
	events.append(text_event2)
	
	var text_event3 = DialogicTextEvent.new()
	text_event3.text = "so many skeins of yarn that i could never get untangled..."
	events.append(text_event3)
	
	var text_event4 = DialogicTextEvent.new()
	text_event4.text = "what i wouldn't give to have those days back though"
	events.append(text_event4)
	
	var timeline : DialogicTimeline = DialogicTimeline.new()
	timeline.events = events
	# if your events are already resources, you need to add this:
	timeline.events_processed = true
	Dialogic.start(timeline)

func _on_timeline_ended()-> void:
	get_tree().change_scene_to_file('res://kaitlin_test/yarn_scene.tscn')
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
