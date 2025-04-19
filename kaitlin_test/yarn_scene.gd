extends Node2D

var playing = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var cat = get_node('cat') # Replace with function body.
	cat.init_for_jumping()
	var ball_anim = get_node('yarn_ball/AnimatedSprite2D')
	ball_anim.play('default')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if playing:
		# deal with the yarn ball stuff
		var yarn = get_node('yarn_ball')
		var animator = get_node("cat/AnimatedSprite2D")
		if (!yarn.is_good()):
			yarn.play_default_anim()
			animator.play('default')
			show_lose_dialogue()
			playing = false
		
		#deal with the cat stuff
		var cat = get_node('cat')
		cat.frame_jump()
		
		if animator.get_frame() == 12:
			animator.play('default')
		elif Input.is_action_just_pressed("ui_select") and (animator.animation == "default" or animator.get_frame() >= 7) and yarn.is_good():
			animator.frame = 0
			animator.play('jumping')
		

func show_lose_dialogue() -> void:
	show_dialogue('you lost!')
	
func show_dialogue(dialogue : String) -> void:
	var events : Array = []
	var text_event = DialogicTextEvent.new()
	text_event.text = dialogue
	events.append(text_event)
	var timeline : DialogicTimeline = DialogicTimeline.new()
	timeline.events = events
	# if your events are already resources, you need to add this:
	timeline.events_processed = true
	Dialogic.start(timeline)
	
func show_dialogue2(dialogue : String, dialogue2: String) -> void:
	var events : Array = []
	var text_event = DialogicTextEvent.new()
	text_event.text = dialogue
	events.append(text_event)
	
	var text_event2 = DialogicTextEvent.new()
	text_event2.text = dialogue2
	events.append(text_event2)
	
	var timeline : DialogicTimeline = DialogicTimeline.new()
	timeline.events = events
	# if your events are already resources, you need to add this:
	timeline.events_processed = true
	Dialogic.start(timeline)
