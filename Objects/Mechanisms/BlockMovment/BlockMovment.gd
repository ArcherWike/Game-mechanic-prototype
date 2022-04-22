extends KinematicBody2D

export(float) var speed = 1
export(int) var direction = 1
#horizontal=0 or vertical= 1 


var move = false 
var multiplier = 1


	
func _process(delta):
	if move:
		if direction:
			self.position.y += multiplier
		else:
			self.position.x += multiplier
			
			
#____________________________________________
func _on_backward_body_exited(body):
	move = false
	
func _on_forward_body_exited(body):
	move = false
#____________________________________________


func _on_forward_body_entered(body):
	if body.name == "Player":
		multiplier = 1 * speed
		move = true


func _on_backward_body_entered(body):
	if body.name == "Player":
		multiplier = -1 * speed
		move = true
