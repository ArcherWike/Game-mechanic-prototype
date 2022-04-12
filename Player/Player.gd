extends KinematicBody2D
	

	
var velocity = Vector2.ZERO # 0, prędkość 

func _physics_process(delta):
	var input_vector = Vector2.ZERO # vector w kierunku którego gracz się porusza
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left") # ruch lewo/prawo
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up") # ruch góra/dół
	input_vector = input_vector.normalized() # po skosie porusza się tak jak normalnie w 4 strony, nie porusza się szybciej
	if input_vector != Vector2.ZERO: # jeśli gracz ma się poruszyć
		velocity = velocity.move_toward(input_vector * varPlayer.MAX_SPEED, varPlayer.ACCELERATION * delta) # zastosowanie przyśpieszenia, co klatkę będzie velocity zwiększać aż będzie max
	else: # jeśli ma się zatrzymać
		velocity = velocity.move_toward(Vector2.ZERO, varPlayer.FRICTION * delta)# symulacja bezwładności
	
	velocity = move_and_slide(velocity) # porusza gracza o podane velocity i sprawdza kolizje a jak na taką natrafi to się po niej "ślizga"



	#var repair_pos = $Entrace/BackPos
	#repair_pos = get("rect/pos")
	#self.set_position(get_node(repair_pos))
	



