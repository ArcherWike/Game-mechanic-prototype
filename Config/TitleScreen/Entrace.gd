extends Area2D

export(String) var scene


func _on_Entrace_body_entered(body):
	if body.name == "Player":
		if scene == "":
			push_error("Error changing scenes: scene has no assigned scene")
			return false
		var repair_pos = $Position2D.get_global_position()
		body.position = Vector2(repair_pos)
		#self.set_deferred("disabled", true)
		
		Globals.goto_scene(str("res://BaseStage/",scene,".tscn"), true)
		return true
		#self.disabled = false


