extends KinematicBody2D

var item_exp_preload = preload("res://items/Exp.tscn")
var item_heart_preload = preload("res://items/Heart.tscn")
var item_exp = item_exp_preload.instance()
var item_heart = item_heart_preload.instance()
#var destination = Vector2.ZERO
var velocity = Vector2.ZERO
#var goal = Vector2.ZERO
var speed = 0.5
#var stand = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

####### враг преследует игрока ###########	
func _process(delta):
	var pl = get_parent().get_player()
	var p = pl.position 
	velocity = (p - position).normalized() 
	move_and_collide(velocity * speed)


####### враг умирает от пули ###########
# если в област врага входит область пули
# то он умрирает и убирает пулю
# и оставляет после себя предмет
"""
func _on_enemy_area_area_entered(area):
	if (area.name == "bullet"):
		area.get_parent().queue_free()
		item_exp.set_position(position)
		get_parent().add_child(item_exp)
		queue_free()"""
		
func set_item():
	if randi()%10 < 2:
		item_heart.set_position(position)
		get_parent().add_child(item_heart)
	else:
		item_exp.set_position(position)
		get_parent().add_child(item_exp)
	#area.get_parent().queue_free()

func _on_enemy_area_area_entered(area):
	if (area.name == "bullet"):
		call_deferred("set_item")
		#item_exp.set_position(position)
		#area.get_parent().queue_free()
		queue_free()
	"""if (area.name == "player_area"):
		var pl = get_parent().get_player()
		var p = pl.position 
		velocity = (p - position).normalized() 
		move_and_collide(velocity * speed)
		velocity *= -50
		move_and_collide(velocity * speed)"""
		
		

		
		
		
		
