extends Node

#OPTION
var fps_mode = false
var show_mainMenu = false
var current_scene = "Colectr"
var saved_scene = "Colect"

""""
			SCENE CONFIG
# Changing scenes is most easily done using the functions `change_scene`
# and `change_scene_to` of the SceneTree. This script demonstrates how to
# change scenes without those helpers.
"""

func save_scene(last_scene):
	var path_last_scene = str("res://CurrentSave/",last_scene,".tscn")
	var scene = PackedScene.new()
	scene.pack(get_tree().get_current_scene())
	if ResourceSaver.save(path_last_scene, scene):
		push_error("Eroor, can't save")
	return true                                            ##dodać error jeżeli nie ma pliku
	

func goto_scene(path, whether_to_save):
	# This function will usually be called from a signal callback,
	# or some other function from the running scene.
	# Deleting the current scene at this point might be
	# a bad idea, because it may be inside of a callback or function of it.
	# The worst case will be a crash or unexpected behavior.
	# The way around this is deferring the load to a later time, when
	# it is ensured that no code from the current scene is running:
	call_deferred("_deferred_goto_scene", path, whether_to_save)
	
	
func _deferred_goto_scene(path, whether_to_save):
	current_scene = get_tree().get_current_scene().get_name()
	if whether_to_save:
		var last_scene = get_tree().get_current_scene().get_name() #the name of the scene we are leaving
		if !save_scene(last_scene):
			push_error("error save scene")
	#print("Lauren left ",last_scene)
	print("Lauren go ", path)
	#get_tree().get_current_scene().queue_free()
	if get_tree().change_scene(path):
		push_error("can't change scene. I go to cry")
	
	return true

	# Load new scene
	#var packed_scene = load(path) #new wersion (I don't know, but there are small bugs)
	#ResourceLoader.load(path)

	# Instance the new scene
	#var instanced_scene = packed_scene.instance()

	# Add it to the scene tree, as direct child of rootget_rooT(

	#get_tree().get_root().add_child(instanced_scene)

	# Set it as the current scene, only after it has been added to the tree
	#get_tree().set_current_scene(instanced_scene)


#LOAD Slot SAVE
func copy_recursive(from, to):
	var directory = Directory.new()
	
	# If it doesn't exists, create target directory
	if not directory.dir_exists(to):
		directory.make_dir_recursive(to)
	
	# Open directory
	var error = directory.open(from)
	if error == OK:
		# List directory content
		directory.list_dir_begin(true)
		var file_name = directory.get_next()
		while file_name != "":
			if directory.current_is_dir():
				copy_recursive(from + "/" + file_name, to + "/" + file_name)
			else:
				directory.copy(from + "/" + file_name, to + "/" + file_name)
			file_name = directory.get_next()
	else:
		print("Error copying " + from + " to " + to)

func remove_recursive(path):
	var directory = Directory.new()
	
	# Open directory
	var error = directory.open(path)
	if error == OK:
		# List directory content
		directory.list_dir_begin(true)
		var file_name = directory.get_next()
		while file_name != "":
			if directory.current_is_dir():
				remove_recursive(path + "/" + file_name)
			else:
				directory.remove(file_name)
			file_name = directory.get_next()
		
		# Remove current path
		#directory.remove(path)
	else:
		print("Error removing " + path)
