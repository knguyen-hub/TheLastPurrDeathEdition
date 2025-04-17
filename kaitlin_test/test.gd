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
	pass
