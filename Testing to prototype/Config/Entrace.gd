extends Area2D

export(String) var scene_to_load

func _on_goto_scene_pressed(body):
	if body.name == "Player":
		Globals.goto_scene(scene_to_load)
