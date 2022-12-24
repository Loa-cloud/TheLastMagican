extends Control

signal get_statistic

func _ready():
	var text = "Вы проиграли"
	if GlobalInfo.endless_or_standart == false and  GlobalInfo.time_standart == 0:
		text = "Вы выиграли!"
	emit_signal("get_statistic", text)
	
	
	

func _on_statistics_get_statistic(text):
	var c1 = GlobalInfo.time_count/60
	var c2 = GlobalInfo.time_count%60
	var time_count = ""
	if c2 < 10:
		time_count = str(c1) + ":0" + str(c2)
	else:
		time_count = str(c1) + ":" + str(c2)
	$background/TextureRect2/Label.text = text
	$background/TextureRect/Label_monster.text = "Монстры: " + str(GlobalInfo.enemy_count)
	$background/TextureRect/Label_level.text = "Уровень: " +  str(GlobalInfo.level_count)
	$background/TextureRect/Label_time.text = "Время: " +  str(time_count)



func _on_main_menu_pressed():
	GlobalInfo.get_standart()
	if get_tree().change_scene("res://menu/main_menu/main_menu.tscn") != OK:
		print ("An unexpected error occured when trying to switch to the Readme scene")



func _on_repeat_pressed():
	GlobalInfo.get_again()
	if GlobalInfo.endless_or_standart == true:
		if get_tree().change_scene("res://world/World.tscn") != OK:
			print ("An unexpected error occured when trying to switch to the Readme scene")
	else:
		if get_tree().change_scene("res://world2/standard scene.tscn") != OK:
			print ("An unexpected error occured when trying to switch to the Readme scene")
	#pass # Replace with function body.
