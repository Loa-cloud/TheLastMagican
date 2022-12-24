extends RigidBody2D

var position_queue = 0
onready var timer = get_node("Timer")

func _ready():
	timer.set_wait_time(2)
	timer.start()
	
func _process(_delta):
	if position_queue < position.y:
		queue_free()

func _on_bullet_area_entered(area):
	if (area.name == "enemy_area")  and !GlobalInfo.super_magican:
		queue_free()

func _on_Timer_timeout():
	queue_free()
