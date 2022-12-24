extends Node2D


onready var timer = get_node("Timer")

func _ready():
	timer.set_wait_time(2)
	timer.start()
	var radius = randi()%100
	var random_angel = randi()%360
	
	
	if (GlobalInfo.endless_or_standart == false):
		if ((position.x + radius * sin(random_angel)) > 190):
			position.x = 185
		elif ((position.x + radius * sin(random_angel)) < -128):
			position.x = -122
		else:
			position.x += radius * sin(random_angel)
			
		if ((position.y + radius * cos(random_angel)) < 194):
			position.y = 198
		elif ((position.y + radius * cos(random_angel)) > 384):
			position.y = 380
		else:
			position.y += radius * cos(random_angel)
	else:		
		position.x += radius * sin(random_angel)
		position.y += radius * cos(random_angel)
	
	


func _on_Timer_timeout():
	queue_free()


func _on_bullet_area_entered(area):
	if (area.name == "enemy_area")  and !GlobalInfo.super_magican:
		queue_free()
