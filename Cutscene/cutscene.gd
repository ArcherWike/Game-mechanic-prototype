extends KinematicBody2D

onready var _animated_sprite = $AnimatedSprite
onready var colision = $CollisionShape2D
 






func _input(event):
	if event.is_action_pressed("interact") and Isplayer == true:
		open_door()

var opened = false
var interact = false
var Isplayer = false

func _on_AnimatedSprite_animation_finished():
	_animated_sprite.stop()
	if opened:
		_animated_sprite.set_frame(3)
		colision.disabled = true
	else:
		_animated_sprite.set_frame(0)

func open_door():
	opened = true
	interact = true
	_animated_sprite.set_frame(0)
	_animated_sprite.play()
	


func _on_Area2D_body_exited(body):
	if body.name == "Player" and interact == true:
		opened = false
		_animated_sprite.set_frame(3)
		colision.disabled = false
		_animated_sprite.play("door", true)
		interact = false
		Isplayer = false
		

#func _on_Area2D_body_entered(body):
#	if body.name == "Player":
#		if Input.is_action_pressed("interact"):
	#		open_door()


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		Isplayer = true
		
		
	
