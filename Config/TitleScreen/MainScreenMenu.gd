extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_NewGame_pressed():
	Globals.remove_recursive("res://CurrentSave/")
	Globals.copy_recursive("res://BaseStage/", "res://CurrentSave/")
	Globals.goto_scene(str("res://CurrentSave/Center.tscn"), false)
	Dialogic.reset_saves()
	PlayerInventory.load_item_to_inventory()
	#PlayerInventory.refresh()

	


func _on_Continue_pressed():
	Globals.remove_recursive("res://CurrentSave/")
	Globals.copy_recursive("res://SlotSave/", "res://CurrentSave/")
	Globals.goto_scene(str("res://CurrentSave/", Globals.saved_scene,".tscn"), false)
	Dialogic.load()
	PlayerInventory.load_item_to_inventory()
	
