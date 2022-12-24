extends Control

var pressed

func _ready():
	pressed = false



func _on_back_pressed():
	if get_tree().change_scene("res://menu/main_menu/main_menu.tscn") != OK:
		print ("An unexpected error occured when trying to switch to the Readme scene")


func _on_choose_pressed():
	if pressed:
		if get_tree().change_scene("res://menu/choose character/choose_character.tscn") != OK:
			print ("An unexpected error occured when trying to switch to the Readme scene")


func _on_endless_pressed():
	pressed = true
	GlobalInfo.endless_or_standart = true


func _on_standart_pressed():
	pressed = true
	GlobalInfo.endless_or_standart = false

