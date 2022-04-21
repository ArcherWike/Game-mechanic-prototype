extends VBoxContainer


func initialize(quest_name):
	$QuestName.set_text(str(quest_name))
	$Description.set_text(str(Globals.quest_list[quest_name][1]))

func _on_TextureButton_pressed():
	print($QuestName.text)
	Globals.current_quest = str($QuestName.text)
