extends Control

var is_paused = false setget set_is_paused


func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		self.is_paused = !is_paused

func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused

func _on_play_pressed():
	self.is_paused = false


func _on_main_menu_pressed():
	GlobalInfo.get_standart()
	self.is_paused = false
	if get_tree().change_scene("res://menu/main_menu/main_menu.tscn") != OK:
		print ("An unexpected error occured when trying to switch to the Readme scene")

