extends Area2D




func _on_highgrass_body_entered(body):
	if body.name == "Player":
		print('dadas')
		print(varPlayer.FRICTION)
		varPlayer.ACCELERATION = 100
		varPlayer.FRICTION = 600

func _on_highgrass_body_exited(body):
	if body.name == "Player":
		print(varPlayer.FRICTION)
		varPlayer.FRICTION = 350
		varPlayer.ACCELERATION = 700
