extends Node

const SlotClass = preload("res://Config/Inventory/Slot.gd")
const ItemClass = preload("res://Objects/Items/equipment/Item.gd")

var NUM_INVENTORY_SLOTS = 20
#EQUIPMENT

var Category = {"food": '32', "item": '64', 'coin': '99'}

var all_item_list = ["apple", "carrot", "bundle_filled", "cooked_porkchop"]
#var apl = Dialogic.get_variable("apple")


var inventory = {
	
}

#0: ["apple", 20],
#	1: ["carrot", 30],
#	2: ["carrot", 30],
#	3: ["carrot", 30]

func add_item(item_name, item_quantity):
	for item in inventory:
		if inventory[item][0] == item_name:
			var category = Dialogic.get_category_variable(item_name)
			var stack_size = int(PlayerInventory.Category[category])
			var able_to_add = stack_size - inventory[item][1]
			if able_to_add >= item_quantity:
				inventory[item][1] += item_quantity
				return
			else:
				inventory[item][1] += able_to_add
				item_quantity = item_quantity - able_to_add
			#var amount = Dialogic. get_variable(item_name)
			#var q = int(amount) + int(item_quantity)
		#Dialogic.set_variable(item_name, q)
	
	for i in range(NUM_INVENTORY_SLOTS):
		if inventory.has(i) == false:
			inventory[i] = [item_name, item_quantity]
			return

func steal_item(item_name, item_quantity):
	item_quantity *= -1
	add_item(item_name, item_quantity)

func load_item_to_inventory():
	for item_name in all_item_list:
		print(item_name)
		var amount = int(Dialogic.get_variable(item_name))
		if amount > 0:
			add_item(str(item_name), amount)
			print(inventory)





#func refresh():
	#Dialogic.set_variable(item_name, int(amount)+quantity)
#	for item in inventory:
#		var amount = Dialogic.get_variable(inventory[item][0])
#		print(inventory[item][0])
#		inventory[item][1] = amount
		
		#inventory[item][1] = String()


func add_item_to_empty_slot(item: ItemClass, slot: SlotClass):
	inventory[slot.slot_index] = [item.item_name, item.item_quantity]
func remove_item(slot: SlotClass):
	inventory.erase(slot.slot_index)
	
func add_item_quantity(slot: SlotClass, quantity_to_add: int):
	inventory[slot.slot_index][1] += quantity_to_add
