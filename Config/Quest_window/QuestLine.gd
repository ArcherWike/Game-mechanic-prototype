extends VBoxContainer


func initialize(quest_name):
	$Button/QuestName.set_text(str(quest_name))
	#$Description.set_text(str(Globals.quest_list[quest_name][1]))

func _on_Button_pressed():
	print($Button/QuestName.text)
	Globals.current_quest = str(($Button/QuestName.text))
