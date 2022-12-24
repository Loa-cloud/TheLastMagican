extends Control


var pressed

func _ready():
	pressed = false


func _on_back_pressed():
	if get_tree().change_scene("res://menu/select_mode/select_mode.tscn") != OK:
			print ("An unexpected error occured when trying to switch to the Readme scene")



func _on_choose_pressed():
	if pressed:
		if GlobalInfo.endless_or_standart == true:
			if get_tree().change_scene("res://world/World.tscn") != OK:
				print ("An unexpected error occured when trying to switch to the Readme scene")
		else:
			if get_tree().change_scene("res://world2/standard scene.tscn") != OK:
				print ("An unexpected error occured when trying to switch to the Readme scene")


	
	
	
signal character1
signal character2
signal character3


func _on_character1_pressed():
	pressed = true
	GlobalInfo.magican = 1
	emit_signal("character1")
	
func _on_character2_pressed():
	pressed = true
	GlobalInfo.magican = 2
	emit_signal("character2")
	
func _on_character3_pressed():
	pressed = true
	GlobalInfo.magican = 3
	emit_signal("character3")
	
func _on_choose_character_character1():
	$background/TextureRect2/Label.text  = "Синий маг. Способность: шаровая магия"

func _on_choose_character_character2():
	$background/TextureRect2/Label.text = "Красный маг. Способность: огненные шары"

func _on_choose_character_character3():
	$background/TextureRect2/Label.text = "Жёлтый маг. Способность: кристаллы" 

