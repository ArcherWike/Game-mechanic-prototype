extends Control

func _physics_process(_delta):
	if Input.is_action_just_pressed("title_screen"):
		if !Globals.show_mainMenu:
			var packed_scene = ResourceLoader.load("res://Config/TitleScreen/TitleScreen.tscn")
			var instanced_scene = packed_scene.instance()
			add_child(instanced_scene)	
			Globals.show_mainMenu = true
			get_tree().paused = true
			$TitleScreen/Buttons/Continue.grab_focus()

		else:
			#var scene = PackedScene.new()		SAVE
			#var scene_root = $TitleScreen
			#_set_owner(scene_root, scene_root)
			#scene.pack(scene_root)
			#ResourceSaver.save('res://SavedMEnu.tscn', scene)
			$TitleScreen.free()
			get_tree().paused = false
			Globals.show_mainMenu = false
			
func _set_owner(node, root):
	if node != root:
		node.owner = root
	for child in node.get_children():
		_set_owner(child, root)	

	





