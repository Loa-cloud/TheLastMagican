extends KinematicBody2D
class_name Class_enemy

var item_exp = preload("res://items/Exp.tscn").instance()
var item_heart = preload("res://items/Heart.tscn").instance()
var velocity = Vector2.ZERO
var speed = 0.8
var hp = 1




####### враг преследует игрока ###########	
# есил игрок близко, то его атакуют
signal bite

func _process(_delta):
	var pl = get_parent().get_player()
	var p = pl.position 
	go_to_player(p)
	try_bite(p)
	
	
func go_to_player(p):
	velocity = (p - position).normalized() 
	if velocity.x < 0:
		$Sprite.flip_h = true
	else:
		$Sprite.flip_h = false
	var _moveCollision = move_and_collide(velocity * speed)



func try_bite(p):
	#print(p)
	# атака игрока, если он слишком близко
	var dist_x = (p.x - position.x) * (p.x - position.x)
	var dist_y = (p.y - position.y) * (p.y - position.y)
	var distance = sqrt(dist_x + dist_y)
	if (distance < 20):
		emit_signal("bite")



####### враг умирает от пули ###########
# если в област врага входит область пули
# то он умрирает и убирает пулю
# и оставляет после себя предмет
		
func set_item():
	if randi()%10 < 2:
		item_heart.set_position(position)
		get_parent().add_child(item_heart)
	else:
		item_exp.set_position(position)
		get_parent().add_child(item_exp)
		
		
		GlobalInfo.enemy_count += 1



func _on_enemy_area_area_entered(area):
	if (area.name == "bullet"):
		hp -= 1
		if hp == 0:
			call_deferred("set_item")
			queue_free()
			
