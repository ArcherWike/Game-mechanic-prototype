extends VBoxContainer

const QuestLine = preload("res://Config/Quest_window/QuestLine.tscn")

func clear():
	for child in get_children():
		child.free()

func add_quest(quest_name):
	var line_quest = QuestLine.instance()
	line_quest.initialize(quest_name)
	add_child(line_quest)
	return line_quest
