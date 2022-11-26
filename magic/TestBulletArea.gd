extends KinematicBody2D


var velocity = Vector2 (1,0).normalized() 
var look_vec = Vector2.ZERO
var target = null
var speed = 1.3

#var pl = get_parent().get_player()
#var p = pl.level_2

onready var timer = get_node("Timer")

func _ready():
	timer.set_wait_time(2)
	timer.start()
#	var pl = get_parent().get_player()
#	var p = pl.position 
#	velocity.x = 10
#	velocity.y = 0
	
	
#	move_toward(0,100,10)
	
func _process(delta):
	var p = get_parent().get_player()
	#print(p.position)
	move_and_collide(velocity * speed)
	



func _on_Timer_timeout():
	queue_free()
