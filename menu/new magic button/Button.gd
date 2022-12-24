extends Button

var is_paused = false setget set_is_paused


signal new_magic

func level_up():
	visible = true
	emit_signal("new_magic")
	#self.is_paused = !is_paused
	#set_text()
	
func no_upgrade():
	visible = false
	
	
#func _unhandled_input(event):
#	if event.is_action_pressed("fire"):
#		self.is_paused = !is_paused
		#set_text()

func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused


#func _on_Button_pressed():
	#pass # Replace with function body.
