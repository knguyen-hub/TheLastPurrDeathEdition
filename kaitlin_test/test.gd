extends Node2D

var catfood_showing = true
var litterbox_need = true
var find_cat = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	await get_tree().create_timer(6.0).timeout
	var events : Array = []
	var text_event = DialogicTextEvent.new()
	text_event.text = "wow what a beautiful morning! where is biscuit? he's usually next to me when i wake up. i should check on him"
	events.append(text_event)
	var timeline : DialogicTimeline = DialogicTimeline.new()
	timeline.events = events
	# if your events are already resources, you need to add this:
	timeline.events_processed = true
	Dialogic.start(timeline)
	wait_for_first_message()


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

func wait_for_first_message() -> void:
	await get_tree().create_timer(5.0).timeout
	var this_event : Array = []
	
	var text_event = DialogicTextEvent.new()
	text_event.text = "where could he be?"
	this_event.append(text_event)
	
	var text_event2 = DialogicTextEvent.new()
	text_event2.text = 'usually setting out his food will get him to come out. i should do that now.'
	this_event.append(text_event2)
	
	var timeline : DialogicTimeline = DialogicTimeline.new()
	timeline.events = this_event
	# if your events are already resources, you need to add this:
	timeline.events_processed = true
	Dialogic.start(timeline)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var player = get_node("player")
	var player_coords = player.global_position
	
	if catfood_showing:
		# get the catfood node 
		var catfood = get_node('AnimatedSprite2D')
		
		# get the catfood position
		var catfood_coords = catfood.global_position
		
		# if the distance is small check if 'e' is pressed and hide and display dialogue
		if catfood_coords.distance_to(player_coords) < 100:
			if Input.is_action_pressed('select'):
				catfood.hide()
				catfood_showing = false
				var found_cat_food_event : Array = []
				var text_event = DialogicTextEvent.new()
				text_event.text = 'found the cat food! i can set it out now.'
				found_cat_food_event.append(text_event)
				var timeline : DialogicTimeline = DialogicTimeline.new()
				timeline.events = found_cat_food_event
				timeline.events_processed = true
				Dialogic.start(timeline)
				await get_tree().create_timer(6.0).timeout
				show_dialogue2('hmm. no biscuit still? that is so strange. where could he be?',
					'i should check the litter box.')
			catfood.play('hover')
		else:
			catfood.play('default')
	elif litterbox_need:
		var litterbox = get_node("litterbox")
		var litter_coords = litterbox.global_position
		if player_coords.distance_to(litter_coords) < 200:
			if Input.is_action_pressed('select'):
				litterbox_need = false
				var litterbox_event : Array = []
				var text_event = DialogicTextEvent.new()
				text_event.text = 'hm. the litter box is empty. where else could biscuit be?'
				litterbox_event.append(text_event)
				
				var text_event2 = DialogicTextEvent.new()
				text_event2.text = "let's look around the apartment some more."
				litterbox_event.append(text_event2)
				var timeline : DialogicTimeline = DialogicTimeline.new()
				timeline.events = litterbox_event
				timeline.events_processed = true
				Dialogic.start(timeline)
				litterbox.play('default')
			else:
				litterbox.play('blinking')
		else:
			litterbox.play('default')
	elif find_cat:
		
		var cat = get_node("cat")
		var cat_coords = cat.global_position
		if player_coords.distance_to(cat_coords) < 100:
			
			var cat_anim = get_node('cat/AnimatedSprite2D')
			find_cat = false
			cat_anim.show()
			show_dialogue2('there you are biscuit! i was getting worried',
				"come on biscuits i put out breakfast for you!")
			await get_tree().create_timer(5.0).timeout
			Dialogic.timeline_ended.connect(_on_timeline_ended)
			show_dialogue2("why aren't you moving? biscuit get up!", 
				"biscuit??")
			
func _on_timeline_ended() -> void:
	get_tree().change_scene_to_file('res://kaitlin_test/story_part.tscn')
