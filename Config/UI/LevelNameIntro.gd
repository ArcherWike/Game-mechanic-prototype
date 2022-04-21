extends CanvasLayer

func _show_name():
	$AnimationPlayer.play("ShowLevelName")
	yield( $AnimationPlayer, "animation_finished" )
	queue_free()

func _ready():
	$Label.text = get_parent().name
	_show_name()
	##if get_parent().name == "Level1":
		#$Label.text = "Bxdvbxdvo"
		#_show_name()
	#elif get_parent().name == "Level2":
		#$Label.text = "Bzsfczsfrdo"
		#_show_name()
