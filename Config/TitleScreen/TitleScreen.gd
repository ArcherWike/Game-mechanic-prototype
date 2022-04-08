extends Control

func _physics_process(_delta):
	if Input.is_action_just_pressed("title_screen"):
		if !self.visible:
			self.visible = true
			$Buttons/Continue.grab_focus()
			get_tree().paused = true
		else:
			self.visible = false
			get_tree().paused = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
