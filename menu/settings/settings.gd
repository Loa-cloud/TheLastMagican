extends Control

func _ready():
	add_items()
	if GlobalInfo.super_magican == 0:
		$background/TextureRect2/CheckBox.pressed = false
	else:
		$background/TextureRect2/CheckBox.pressed = true
		
	if OS.window_fullscreen == true:
		$background/TextureRect2/window.text = "1920*1080"
	else:
		$background/TextureRect2/window.text = "1280*720"
		
	$background/TextureRect2/sound.value = GlobalInfo.music

	print(GlobalInfo.music)

func _on_back_pressed():
	if get_tree().change_scene("res://menu/main_menu/main_menu.tscn") != OK:
		print ("An unexpected error occured when trying to switch to the Readme scene")
	var fileSave = File.new()
	fileSave.open("res://settings.json", File.WRITE)
	#GlobalInfo.settings["super_magican"] = GlobalInfo.super_magican
	GlobalInfo.display = OS.window_fullscreen
	var settings = {"super_magican":GlobalInfo.super_magican, "music":GlobalInfo.music, "display": OS.window_fullscreen}
	fileSave.store_string(to_json(settings))
	fileSave.close()
	print(GlobalInfo.music)



func add_items():
	$background/TextureRect2/window.clear()
	if OS.window_fullscreen == true:
		$background/TextureRect2/window.add_item("1920*1080")
		$background/TextureRect2/window.add_item("1280*720")
	else:
		$background/TextureRect2/window.add_item("1280*720")
		$background/TextureRect2/window.add_item("1920*1080")
	


func _on_sound_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)
	GlobalInfo.music = value
	print(value)


func _on_window_item_selected(index):
	var t = $background/TextureRect2/window.get_item_text(index)
	print(t)
	if t == "1920*1080":
		OS.window_fullscreen = true

	if t == "1280*720":
		OS.window_fullscreen = false


func _on_CheckBox_button_down():
	GlobalInfo.super_magican = 0

func _on_CheckBox_button_up():
	GlobalInfo.super_magican = 1


func _on_CheckBox_pressed():
	if GlobalInfo.super_magican == 0:
		GlobalInfo.super_magican = 1
	else:
		GlobalInfo.super_magican = 0
