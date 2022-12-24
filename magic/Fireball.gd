extends KinematicBody2D

var velocity = Vector2 (1,0).normalized() 
var speed = 100

onready var timer = get_node("Timer")

func _ready():
	timer.set_wait_time(2)
	timer.start()
	
func flip_sprite():
	$Sprite.flip_h = true

func _process(delta):
	var _moveCollision = move_and_collide(velocity * speed * delta)


func _on_Timer_timeout():
	queue_free()


func _on_bullet_area_entered(area):
	if (area.name == "enemy_area") and !GlobalInfo.super_magican:
		queue_free()
