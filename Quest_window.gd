extends Control

onready var quest_list = $AllQuest/Active/ActiveContainer
onready var complete_list = $AllQuest/Complete/CompleteContainer

var state = small
enum{
	small,
	maxilize
}



func _process(delta):
	if Globals.current_quest != "":
		$AllQuest/Panel/Description.text = Globals.quest_list[Globals.current_quest][1]
	#$AllQuest/Panel/Description.text = 


	match state:
		small:
			small_state(delta)
		maxilize:
			maximalize_state(delta)
			
func small_state(_delta):
	if Input.is_action_just_pressed("change_visibility_quest"):
		$AllQuest.visible = false
		#self.set_size(Vector2(150, 100))
		state = maxilize

func maximalize_state(_delta):
	if Input.is_action_just_pressed("change_visibility_quest"):
		$AllQuest/Complete.hide()
		$AllQuest/Active.show()
		quest_list.clear()		
		for quest in Quest.list(Globals.QuestStatus.STARTED):
			print(quest)
			quest_list.add_quest(quest)
		$AllQuest.visible = true
				#self.set_size(Vector2(400, 300))
		
		state = small
		
		

#$Description.set_text(str(Globals.quest_list[quest_name][1]))



func _on_CompleteButton_pressed():
	$AllQuest/Complete.show()
	$AllQuest/Active.hide()
	quest_list.clear()		
	for quest in Quest.list(Globals.QuestStatus.STARTED):
		print(quest)
		quest_list.add_quest(quest)


func _on_ActiveButton_pressed():
	$AllQuest/Complete.hide()
	$AllQuest/Active.show()
	complete_list.clear()	
	for quest in Quest.list(Globals.QuestStatus.COMPLETED):
		complete_list.add_quest(quest)
