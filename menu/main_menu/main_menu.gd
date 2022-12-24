extends Control


func _ready():
	var loadFile = File.new()
	if not loadFile.file_exists("res://settings.json"):
		GlobalInfo.settings["super_magican"] = 0
		#GlobalInfo.settings["music"] =
		GlobalInfo.settings["display"] = OS.window_fullscreen
	else:
		print("set")
		loadFile.open("res://settings.json", File.READ)
		var save_set = parse_json(loadFile.get_as_text())
		GlobalInfo.super_magican = save_set["super_magican"]
		GlobalInfo.music = save_set["music"]
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), save_set["music"])
		OS.window_fullscreen = save_set["display"]
		loadFile.close()
		
signal new_game

signal settings

signal exit
		
func _on_new_game_pressed():
	emit_signal("new_game")
	
func _on_options_pressed():
	emit_signal("settings")
	
func _on_exit_pressed():
	emit_signal("exit")
	
func _on_main_menu_exit():
	get_tree().quit()
	
func _on_main_menu_new_game():
	if get_tree().change_scene("res://menu/select_mode/select_mode.tscn") != OK:
		print ("An unexpected error occured when trying to switch to the Readme scene")
	
func _on_main_menu_settings():
	if get_tree().change_scene("res://menu/settings/settings.tscn") != OK:
		print ("An unexpected error occured when trying to switch to the Readme scene")
