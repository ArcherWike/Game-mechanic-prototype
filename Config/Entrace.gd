extends Area2D

export(String) var scene




func _on_Entrace_body_entered(body):
	if body.name == "Player":
		var repair_pos = $Position2D.get_global_position()
		print(repair_pos)
		body.position = Vector2(repair_pos)

		Globals.goto_scene(str("res://BaseStage/",scene,".tscn"))
		
