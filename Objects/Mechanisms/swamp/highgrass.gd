extends Area2D




func _on_highgrass_body_entered(body):
	if body.name == "Player":
		print(varPlayer.FRICTION)
		varPlayer.ACCELERATION -= 300
		varPlayer.FRICTION += 550
		varPlayer.MAX_SPEED -= 200

func _on_highgrass_body_exited(body):
	if body.name == "Player":
		varPlayer.FRICTION -= 550
		varPlayer.ACCELERATION += 300
		varPlayer.MAX_SPEED += 200
		
		
