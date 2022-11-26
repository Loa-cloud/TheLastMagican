extends Node2D


onready var timer = get_node("Timer")

func _ready():
	timer.set_wait_time(2)
	timer.start()


func _on_Timer_timeout():
	queue_free()