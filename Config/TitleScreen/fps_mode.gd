extends Label

func _on_fps_mode_toggled(button_pressed):
	print(button_pressed)
	Globals.fps_mode = button_pressed
