extends Area2D

export(String) var NameObject = "BlockMovmentObject"
export(String) var QuestName

signal right_position

func _on_Area2D_body_entered(body):
	if body.name == NameObject:
		if Globals.quest_list[QuestName][0] == 2:
			print("tak")
			emit_signal("right_position")
