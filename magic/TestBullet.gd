extends RigidBody2D

var start_position 

func _ready():
	start_position = position


func _process(delta):
	print (start_position.y)
	#var pl = get_parent().get_player()
	#var p = pl.position 
	#print (position.y)
	#if start_position.y - 20 < position.y:
	#if p == position.y:
		#print ('Сравнялись')
	#	queue_free()
