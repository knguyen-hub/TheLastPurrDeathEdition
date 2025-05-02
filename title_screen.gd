extends Control


# start button
func _on_play_button_pressed() -> void:
	# replace demo.tscn to your 
	get_tree().change_scene_to_file("res://kaitlin_test/test.tscn")

# exit button
func _on_quit_button_pressed() -> void:
	get_tree().quit()
