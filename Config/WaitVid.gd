extends VideoPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_VideoPlayer_finished():
	get_tree().get_current_scene().queue_free()
	var path = str("res://CurrentSave/",Globals.last_scene,".tscn")
	# Load new scene
	var packed_scene = ResourceLoader.load(path)
	# Instance the new scene
	var instanced_scene = packed_scene.instance()
	# Add it to the scene tree, as direct child of root
	get_tree().get_root().add_child(instanced_scene)
	# Set it as the current scene, only after it has been added to the tree
	get_tree().set_current_scene(instanced_scene)
	get_tree().paused = false
