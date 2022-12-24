extends TextureRect


var is_paused = false setget set_is_paused


signal new_magic

func level_up():
	visible = true
	emit_signal("new_magic")

	
func no_upgrade():
	visible = false
	


func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused



