extends Control


func _physics_process(_delta):
	if OS.get_screen_count() > 1:
		$ScreenOption/Option/Screen0.show()
		$ScreenOption/Option/Screen1.show()
	else:
		$ScreenOption/Option/Screen0.hide()
		$ScreenOption/Option/Screen1.hide()

#



		#CHANGE SCREEN
func _on_Screen1_pressed():
	OS.set_current_screen(1)

func _on_Screen0_pressed():
	OS.set_current_screen(0)


func _on_Fullscreen_pressed():
	if OS.is_window_fullscreen():
		OS.set_window_fullscreen(false)
	else:
		OS.set_window_fullscreen(true)


func _on_Minimized_pressed():
	if OS.is_window_minimized():
		OS.set_window_minimized(false)
	else:
		OS.set_window_minimized(true)


func _on_Maximized_pressed():
	if OS.is_window_maximized():
		OS.set_window_maximized(false)
	else:
		OS.set_window_maximized(true)


#BACK TO MENU
func _on_Back_pressed():
	self.hide()



###############OPTIIOMNNFSNS MENU
func hide_all():
	$KeyOption.hide()
	$ScreenOption/Option.hide()
	
func _on_Screen_pressed():
	hide_all()
	$ScreenOption/Option.visible = true


func _on_Keymapping_pressed():
	hide_all()
	$KeyOption.show()
