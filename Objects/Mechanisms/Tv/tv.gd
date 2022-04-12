extends Area2D

var active = false


onready var video = $VideoPlayer
#var cutscene = load("res://Cutscene/Intro.tscn") 
func _ready():
	# warning-ignore:return_value_discarded
	connect("body_entered", self, "_on_body_entered")
	# warning-ignore:return_value_discarded
	connect("body_exited", self, "_on_body_exited")

func _input(event):
	if (active and event.is_action_pressed("interact")):
		display()
		

func display():
	video.visible = true
	video.play()

	

func _on_body_exited(body):
	if body.name == "Player":	
		active = false


func _on_body_entered(body):
	if body.name == "Player":
		active = true
		#get_parent().add_child(cutscene)	


func _on_VideoPlayer_finished():
	video.visible = false

