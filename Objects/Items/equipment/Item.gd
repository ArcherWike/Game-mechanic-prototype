extends Node2D

var item_name
var item_quantity

# Called when the node enters the scene tree for the first time.
func _ready():
	var randi_val = randi() % 4
	if randi_val == 0:
		item_name = "apple"
	elif randi_val == 1:
		item_name = "bundle_filled"
	else:
		item_name = "carrot"
		
	$TextureRect.texture = load("res://Objects/Items/equipment/"+ item_name +".png")
	var category = Dialogic.get_category_variable(item_name)
	var stack_size = int(PlayerInventory.Category[category])
	item_quantity = randi() % stack_size + 1
	
	if stack_size == 1:
		$Label.visible = false
	else:
		$Label.text = String(item_quantity)

func set_item(nm, qt):
	item_name = nm
	item_quantity = qt
	$TextureRect.texture = load("res://Objects/Items/equipment/"+ item_name +".png")
	
	var category = Dialogic.get_category_variable(item_name)
	var stack_size = int(PlayerInventory.Category[category])
	if stack_size == 1:
		$Label.visible = false
	else:
		$Label.visible = true
		$Label.text = String(item_quantity)


func add_item_quantity(amout_to_add):
	item_quantity += amout_to_add
	$Label.text = String(item_quantity)

func decrease_item_quantity(amount_to_remove):
	item_quantity -= amount_to_remove
	$Label.text = String(item_quantity)
	
	
