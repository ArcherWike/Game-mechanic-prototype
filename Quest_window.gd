extends Control

var state = small
enum{
	small,
	maxilize
}

func _ready():
	$AllQuest.visible = false


func _process(delta):
	var text = ""
	text += "Started:\n"
	for quest in Quest.list(Globals.QuestStatus.STARTED):
		text += "  %s\n" % quest
	#$Label.set_text(Dialogic.get_variable("quest"))
	$AllQuest/Label.set_text(text)
	
	if Globals.current_quest != "":
		$SmallWindow2/quest.set_text(Globals.current_quest)

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
		#self.set_size(Vector2(400, 300))
		$SmallWindow2.visible = false
		$AllQuest.visible = true
		state = small
