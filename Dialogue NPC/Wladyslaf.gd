extends Area2D

var active = false
export(String) var Dialog_Timeline
export(String) var quest_name = "Quest Wladyslaf"
export(int) var required_amount = 15
export(String) var item_name = "carrot"
export(String) var description = "Przynies 15 marfwewk dla Wladyslafa"
# Called when the node enters the scene tree for the first time.

func _process(delta):
	$keyE.visible = active

func _input(event):
#	if Dialog_Timeline == "":
#			push_error("Dialog name error")
#			return false
	if get_node_or_null('DialogicNode') == null:
		if event.is_action_pressed("interract") and active:
			var quest_status = Quest.get_status(quest_name)
			match quest_status:
				Globals.QuestStatus.NONEXISTENT:				
					Quest.accept_quest(quest_name, description)
					q1_initial()
					Globals.current_quest = quest_name
					

				Globals.QuestStatus.STARTED:
					if int(Dialogic.get_variable(item_name)) >= required_amount:
						q1_delivered()
						var amount = Dialogic.get_variable(item_name)
						Dialogic.set_variable(item_name, int(amount)- required_amount)
						Quest.change_status(quest_name, Globals.QuestStatus.COMPLETED)
						Globals.current_quest = ""

					#PlayerInventory.add_item(item_name, )
					else:
						q1_pending()
				Globals.QuestStatus.COMPLETED:
					print("Skonczyles juz quest")
	#	if event.is_action_pressed("interract") and active:
	#		get_tree().paused = true
	#		var dialog = Dialogic.start(Dialog_Timeline)
		#	dialog.pause_mode = Node.PAUSE_MODE_PROCESS
		#	dialog.connect('timeline_end', self, 'unpause')
		#	add_child(dialog)

##############	Dialog function
func q1_initial():
	get_tree().paused = true
	var dialog = Dialogic.start("/Testing_levels/Quest/Wladyslaf/W_1-bring")
	dialog.pause_mode = Node.PAUSE_MODE_PROCESS
	dialog.connect('timeline_end', self, 'unpause')
	add_child(dialog)


func q1_pending():
	get_tree().paused = true
	var dialog = Dialogic.start("/Testing_levels/Quest/Wladyslaf/W_1-pending")
	dialog.pause_mode = Node.PAUSE_MODE_PROCESS
	dialog.connect('timeline_end', self, 'unpause')
	add_child(dialog)

func q1_delivered():
	get_tree().paused = true
	var dialog = Dialogic.start("/Testing_levels/Quest/Wladyslaf/W_1-delivered")
	dialog.pause_mode = Node.PAUSE_MODE_PROCESS
	dialog.connect('timeline_end', self, 'unpause')
	add_child(dialog)

#------------------------------------------------------------
func unpause(_timeline_name):
	get_tree().paused = false

func _on_Interract_body_entered(body):
	if body.name == 'Player':
		active = true

func _on_Interract_body_exited(body):
	if body.name == 'Player':
		active = false
