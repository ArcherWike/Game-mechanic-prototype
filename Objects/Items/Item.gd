extends Area2D

export(String) var item_type = "Money bag"
# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", self ,"_on_Item_body_entered")

func _on_Item_body_entered(body):
	if body.name == "Player":
		self.queue_free()
		var amount = Dialogic.get_variable("Coins")
		Dialogic.set_variable("Coins", int(amount)+1)
		print(amount)
