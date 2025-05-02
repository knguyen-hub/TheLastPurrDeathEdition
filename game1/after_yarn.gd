extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Dialogic.text_signal.connect(_on_dialogic_text_signal)
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	await get_tree().create_timer(2.0).timeout
	var events : Array = """
		good try!
		try again
		[end_timeline]""".split('\n')
	
	var timeline : DialogicTimeline = DialogicTimeline.new()
	timeline.events = events
	Dialogic.start(timeline)
	
	
func _on_timeline_ended() -> void:
	get_tree().change_scene_to_file('res://kaitlin_test/yarn_scene.tscn')



func _on_dialogic_text_signal(argument:String):
	if argument == "help":
		print('new scene')
		get_tree().change_scene_to_file('res://kaitlin_test/yarn_scene.tscn')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
