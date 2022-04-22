extends KinematicBody2D

var active = false


########################################################################## VARIABLE:
export(String) var Dialog_Timeline
export(String) var quest_name = "Lizard glodny! Lizard Zly!"
export(int) var required_amount = 20
export(String) var item_name = "cooked_porkchop"
export(String) var description = "Przynies 20 ziemniokuf dla Lizarda"

export(String) var d_bring = "/Testing_levels/Quest/Lizard/L1-bring"
export(String) var d_pending = "/Testing_levels/Quest/Lizard/L2-pending"
export(String) var d_delivered = "/Testing_levels/Quest/Lizard/L3-delivered"
export(String) var d_end = "/Testing_levels/Quest/Lizard/L4-end"
#____________________________________________________________________CODE:
func _input(event):
	if (
		active and
		get_node_or_null('DialogicNode') == null and
		event.is_action_pressed("interract")
	):
		if has_node("Quest"):
			var quest_run = get_node("Quest").run_quest_collect(quest_name, description, item_name, required_amount, d_bring, d_pending, d_delivered, d_end)
			#$"/root/Quest".run_quest_collect(quest_name, description, item_name, required_amount, d_bring, d_pending, d_delivered, d_end)
	
##########################################################################______________________	
func _process(delta):
	$Area2D/keyE.visible = active

		
	
func _on_Area2D_body_entered(body):
	if body.name == 'Player':
		active = true

func _on_Area2D_body_exited(body):
	if body.name == 'Player':
		active = false
