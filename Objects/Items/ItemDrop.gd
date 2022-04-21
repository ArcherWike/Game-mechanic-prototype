extends Area2D

export(String) var item_name
export(int) var quantity = 1

func _ready():
	$Sprite.texture = load("res://Objects/Items/equipment/"+ item_name +".png")


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		if item_name == "":
			push_error("Item haven't name")
		else:
			var amount = Dialogic.get_variable(item_name)
			Dialogic.set_variable(item_name, int(amount)+quantity)
			PlayerInventory.add_item(item_name, quantity)
			self.queue_free()
		


