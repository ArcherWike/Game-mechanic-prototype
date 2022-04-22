extends Node2D

var active = false
#export(String) var Dialog_Timeline
export(String) var Quest_name = "Quest name"
export(String) var Description = "blalals"
#export(int) var required_amount = 15
#export(String) var item_name = "carrot"
#export(String) var description = "Przynies 15 marfwewk dla Wladyslafa"

#export(String) var d_bring = "/Testing_levels/Quest/Wladyslaf/W_1-bring"
#export(String) var d_pending = "/Testing_levels/Quest/Wladyslaf/W_1-pending"
#export(String) var d_delivered = "/Testing_levels/Quest/Wladyslaf/W_1-delivered"
#export(String) var d_end = "/Testing_levels/Quest/TesterNPC/aq-T-end"
# Called when the node enters the scene tree for the first time.


func _process(delta):
	pass
	#$keyE.visible = active
	
func run_quest_collect(quest_name, description, item_name, required_amount, d_bring, d_pending, d_delivered, d_end):
	Quest_name = quest_name
	Description = description
	var quest_status = Quest.get_status(quest_name)
	match quest_status:
		Globals.QuestStatus.NONEXISTENT:
			run_dialog(d_bring)
								

		Globals.QuestStatus.STARTED:
			if int(Dialogic.get_variable(item_name)) >= required_amount:
				run_dialog(d_delivered)
				var amount = Dialogic.get_variable(item_name)
				Dialogic.set_variable(item_name, int(amount)- required_amount)
				Quest.change_status(quest_name, Globals.QuestStatus.COMPLETED)
				Globals.current_quest = ""
			else:
				run_dialog(d_pending)
		Globals.QuestStatus.COMPLETED:
			run_dialog(d_end)
	
				
#func _input(event):


##############	Dialog function
func run_dialog(Dialog_Timeline):
	get_tree().paused = true
	var dialog = Dialogic.start(Dialog_Timeline)
	dialog.pause_mode = Node.PAUSE_MODE_PROCESS
	add_child(dialog)
	dialog.connect("dialogic_signal",self, 'dialogic_signal')
	dialog.connect('timeline_end', self, 'unpause')
		
	
#----------------- Dialog signal- visible quest in interface small
func dialogic_signal(arg):
	if arg == "accept_quest":
		Quest.accept_quest(Quest_name, Description)
		Globals.current_quest = Quest_name

#------------------------------------------------------------
func unpause(_timeline_name):
	get_tree().paused = false

