extends Area2D

export(String) var item_type = "Money bag"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Item_body_entered(body):
	if body.name == "Player":
		self.queue_free()
