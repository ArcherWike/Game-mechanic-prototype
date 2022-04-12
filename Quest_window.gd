extends Control

var state = small
enum{
	small,
	unfold,
	maxilize
}


func _process(delta):
	match state:
		small:
			small_state(delta)
		unfold:
			unfold_state(delta)
		maxilize:
			maximalize_state(delta)
			
func small_state(_delta):
	if Input.is_action_just_pressed("change_visibility_quest"):
		self.set_size(Vector2(150, 100))
		state = unfold
		
func unfold_state(_delta):
	if Input.is_action_just_pressed("change_visibility_quest"):
		self.set_size(Vector2(150, 250))
		state = maxilize
	
func maximalize_state(_delta):
	if Input.is_action_just_pressed("change_visibility_quest"):
		self.set_size(Vector2(400, 300))
		state = small
