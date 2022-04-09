extends Control

func _physics_process(_delta):
	if Input.is_action_just_pressed("title_screen"):
		if !self.visible:
			self.show()
			$Buttons/Continue.grab_focus()
			get_tree().paused = true
		else:
			self.hide()
			get_tree().paused = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):_on_Back_pressed():
	#$"/root/MenuUI".visible = false
#	pass


func _on_Option_pressed():
	$OptionsMenu/ScreenOption/Option.show()
	#self.pause_mode = Node.PAUSE_MODE_STOP
	$OptionsMenu.show()


func _on_Continue_pressed():
	get_tree().paused = false
	Globals.show_mainMenu = false
	self.queue_free()
	
			


