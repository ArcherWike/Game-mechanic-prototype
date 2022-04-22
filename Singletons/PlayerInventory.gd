extends Node
#^^^^^^^^^^^^//	PlayerInventory //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
#_____________________________________________________________________________________________
#								
#	Player inventory funcion and variables		
#_____________________________________________________________________________________________
#=============================================================================================


const SlotClass = preload("res://Config/Inventory/Slot.gd")
const ItemClass = preload("res://Objects/Items/equipment/Item.gd")

var NUM_INVENTORY_SLOTS = 20 #<-- inventory size
#EQUIPMENT

var Category = {"food": '32', "item": '64', 'coin': '99'} #category : stack size this category

var all_item_list = ["apple", "carrot", "bundle_filled", "cooked_porkchop"]		#inventory items
#var apl = Dialogic.get_variable("apple")

#empty started player inventory- don't change  (will be loaded at startup)
var inventory = {
	
}


#												   /\
#								DON'T CHANGE!!!   / I\
#	Player inventory funcion 					 /  I \
#												/   !  \
#											   /________\
#

#-----------------------------------------------------------------------------
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
#-----------------------------------------------------------------------------
func steal_item(item_name, item_quantity):
	item_quantity *= -1
	add_item(item_name, item_quantity)
#-----------------------------------------------------------------------------





#-----------------------------------------------------------------------------
func load_item_to_inventory():
	for item_name in all_item_list:
		print(item_name)
		var amount = int(Dialogic.get_variable(item_name))
		if amount > 0:
			add_item(str(item_name), amount)
			print(inventory)
#-----------------------------------------------------------------------------



#-----------------------------------------------------------------------------
func add_item_to_empty_slot(item: ItemClass, slot: SlotClass):
	inventory[slot.slot_index] = [item.item_name, item.item_quantity]
func remove_item(slot: SlotClass):
	inventory.erase(slot.slot_index)
	
func add_item_quantity(slot: SlotClass, quantity_to_add: int):
	inventory[slot.slot_index][1] += quantity_to_add
#-----------------------------------------------------------------------------
