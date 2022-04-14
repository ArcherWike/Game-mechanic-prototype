extends Node

var NUM_INVENTORY_SLOTS = 20
#EQUIPMENT
var Category = {"food": '32', "item": '64', 'coin': '99'}

#var apl = Dialogic.get_variable("apple")


var inventory = {
	0: ["apple", 0],
	1: ["carrot", 0]
}



func add_item(item_name, item_quantity):
	for item in inventory:
		if inventory[item][0] == item_name:
			#check if slot is full
			inventory[item][1] += item_quantity
			return
			#var amount = Dialogic. get_variable(item_name)
			#var q = int(amount) + int(item_quantity)
		#Dialogic.set_variable(item_name, q)
	
	for i in range(NUM_INVENTORY_SLOTS):
		if inventory.has(i) == false:
			inventory[i] = [item_name, item_quantity]
			return


func refresh():
	#Dialogic.set_variable(item_name, int(amount)+quantity)
	for item in inventory:
		var amount = Dialogic.get_variable(inventory[item][0])
		print(inventory[item][0])
		inventory[item][1] = amount
		
		#inventory[item][1] = String()
