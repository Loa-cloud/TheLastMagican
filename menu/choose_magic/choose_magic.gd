extends Control

var is_paused = false setget set_is_paused

func set_text():
	# шаровая магия
	if GlobalInfo.level_fire_1 == 0:
		$background/magic1/Label_magic_1.text = "Шаровые молнии - 1"
	elif GlobalInfo.level_fire_1 == 1:
		$background/magic1/Label_magic_1.text = "Шаровые молнии - 2"
	elif GlobalInfo.level_fire_1 == 2:
		$background/magic1/Label_magic_1.text = "Шаровые молнии - 3"
	else:
		$background/magic1/Label_magic_1.text = "Изучено"
		
	# огненая магия
	if GlobalInfo.level_fire_2 == 0:
		$background/magic2/Label_magic_2.text = "Огненные шары - 1"
	elif GlobalInfo.level_fire_2 == 1:
		$background/magic2/Label_magic_2.text = "Огненные шары - 2"
	elif GlobalInfo.level_fire_2 == 2:
		$background/magic2/Label_magic_2.text = "Огненные шары - 3"
	else:
		$background/magic2/Label_magic_2.text = "Изучено"
		
	# кристальная магия
	if GlobalInfo.level_fire_3 == 0:
		$background/magic3/Label_magic_3.text = "Кристалы - 1"
	elif GlobalInfo.level_fire_3 == 1:
		$background/magic3/Label_magic_3.text = "Кристалы - 2"
	elif GlobalInfo.level_fire_3 == 2:
		$background/magic3/Label_magic_3.text = "Кристалы - 3"
	else:
		$background/magic3/Label_magic_3.text = "Изучено"
		


#func level_up():
#	self.is_paused = !is_paused
#	set_text()

var can_upgrade = 0

signal no_upgrade


func new_magic():
	can_upgrade += 1

func _unhandled_input(event):
	if event.is_action_pressed("fire") and can_upgrade > 0:
		self.is_paused = !is_paused
		set_text()

func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused

func _on_magic1_pressed():
	if GlobalInfo.level_fire_1 < 3:
		GlobalInfo.level_fire_1 += 1
		self.is_paused = !is_paused
		can_upgrade -= 1 
		if can_upgrade == 0:
			emit_signal("no_upgrade")
	
func _on_magic2_pressed():
	if GlobalInfo.level_fire_2 < 3:
		GlobalInfo.level_fire_2 += 1
		self.is_paused = !is_paused
		can_upgrade -= 1 
		if can_upgrade == 0:
			emit_signal("no_upgrade")

func _on_magic3_pressed():
	if GlobalInfo.level_fire_3 < 3:
		GlobalInfo.level_fire_3 += 1
		self.is_paused = !is_paused
		can_upgrade -= 1 
		if can_upgrade == 0:
			emit_signal("no_upgrade")






