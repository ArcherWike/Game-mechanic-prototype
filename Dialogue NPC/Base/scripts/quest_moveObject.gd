extends Node

var active = false
#export(String) var Dialog_Timeline
var Quest_name
var Description
#export(int) var required_amount = 15
#export(String) var item_name = "carrot"
#export(String) var description = "Przynies 15 marfwewk dla Wladyslafa"

#export(String) var d_bring = "/Testing_levels/Quest/Wladyslaf/W_1-bring"
#export(String) var d_pending = "/Testing_levels/Quest/Wladyslaf/W_1-pending"
#export(String) var d_delivered = "/Testing_levels/Quest/Wladyslaf/W_1-delivered"
#export(String) var d_end = "/Testing_levels/Quest/TesterNPC/aq-T-end"
# Called when the node enters the scene tree for the first time.
#func _ready():
	#var ObjectNode = get_tree().get_root().get_node("/root/Area2D/target")
	#ObjectNode.connect("right_position", self, "on_right_position")

func run_quest_collect(quest_name, description, item_name, required_amount, d_bring, d_pending, d_delivered, d_end):
	Quest_name = quest_name
	Description = description
	var quest_status = Quest.get_status(quest_name)
	match quest_status:
		Globals.QuestStatus.NONEXISTENT:
			run_dialog(d_bring)
		Globals.QuestStatus.STARTED:
			run_dialog(d_pending)
		Globals.QuestStatus.COMPLETED:
			run_dialog(d_end)
			

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
	if arg == str(Quest_name)+"-accept_quest":
		Quest.accept_quest(Quest_name, Description)
		Globals.current_quest = Quest_name




#------------------------------------------------------------
func unpause(_timeline_name):
	get_tree().paused = false


func _on_Area2D_right_position():
	Quest.change_status(Quest_name, Globals.QuestStatus.COMPLETED)
	Globals.current_quest = ""
