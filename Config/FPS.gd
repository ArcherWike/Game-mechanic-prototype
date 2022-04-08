extends Label

func _process(_delta):
	set_text("FPS: %d" % Engine.get_frames_per_second())
	if Globals.fps_mode:
		self.show()
	else:
		self.hide()
		
