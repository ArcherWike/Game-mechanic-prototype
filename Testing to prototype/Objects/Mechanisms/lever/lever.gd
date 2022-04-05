extends KinematicBody2D

onready var animated_sprite = $LeverAnimated
onready var door = $DoorAnimated
onready var collision = $CloseDoorCollision

var lever_on = false
var IsPlayer = false
#if Input.is_action_pressed("interact") and

func _input(event):
	if event.is_action_pressed("interact") and IsPlayer == true:
		if lever_on:
			animated_sprite.set_frame(0)
			lever_on = false
			door.play("door", false)
			collision.disabled = false
		else:
			animated_sprite.set_frame(1)
			lever_on = true
			door.play()
			collision.disabled = true


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		IsPlayer = true


func _on_Area2D_body_exited(body):
	if body.name == "Player":
		IsPlayer = false


func _on_DoorAnimated_animation_finished():
	door.stop()
	if lever_on:
		door.set_frame(4)
	else:
		door.set_frame(0)
