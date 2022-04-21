extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func get_status(quest_name: String):
	if Globals.quest_list.has(quest_name):
		return Globals.quest_list[quest_name][0]
	else:
		return Globals.QuestStatus.NONEXISTENT


func accept_quest(quest_name: String, description:String):
	if Globals.quest_list.has(quest_name):
		return false
	else:
		#Globals.quest_list["COMPLETED"].append(quest_name)
		Globals.quest_list[quest_name] = [Globals.QuestStatus.STARTED, description]
		print(Globals.quest_list)
		#Globals.quest_list("COMPLETED")[0].append(quest_name) = Globals.QuestStatus.STARTED
		return true


func change_status(quest_name: String, status:int):
	if Globals.quest_list.has(quest_name):
		Globals.quest_list[quest_name][0] = status
		return true
	else:
		return false





func list(status:int):
	if status == -1:
		return Globals.quest_list.keys()
	var result = []
	for quest in Globals.quest_list:
		if Globals.quest_list[quest][0] == status:
			var add_text = (str(quest))
			result.append(add_text)
	return result


func get_description(quest_name:String):
	return Globals.quest_list[quest_name][1]
