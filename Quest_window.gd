extends Control

onready var quest_list = $AllQuest/ScrollContainer/VBoxContainer

var state = small
enum{
	small,
	maxilize
}

func _ready():
	$AllQuest.visible = false


func _process(delta):
	if Globals.current_quest != "":
		$SmallWindow2.show()
		$SmallWindow2/quest.set_text(str(Globals.current_quest)+"\n "+str(Quest.get_description(Globals.current_quest)))
	else:
		$SmallWindow2/quest.set_text("Brak questow do wykonania")


	match state:
		small:
			small_state(delta)
		maxilize:
			maximalize_state(delta)
			
func small_state(_delta):
	if Input.is_action_just_pressed("change_visibility_quest"):
		$SmallWindow2.visible = true
		$AllQuest.visible = false
		#self.set_size(Vector2(150, 100))
		state = maxilize

func maximalize_state(_delta):
	if Input.is_action_just_pressed("change_visibility_quest"):
		quest_list.clear()		
		for quest in Quest.list(Globals.QuestStatus.STARTED):
			print(quest)
			quest_list.add_quest(quest)
				
				#self.set_size(Vector2(400, 300))
		$SmallWindow2.visible = false
		$AllQuest.visible = true
		state = small
		
		

