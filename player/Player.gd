extends KinematicBody2D


####### атака персонажа #########
# куст
export var bullet_speed = 100
export var fire_rate = 0.9
var bullet_fire = preload('res://magic/TestBullet.tscn')
var can_fire = true # атака кустом

# фаербол
# 1 - фаербол вправо
# 2 - фаербол влево
# 3 - увеличивется размер
var bullet_2 = preload('res://magic/TestBulletArea.tscn')
var can_fire_2 = false
var fire_rate_2 = 1
var level_2 = 1

func level_up_2():
	var t = 0

# дыра
# 1 
# 2 - увеличивается частота появления
# 3 - увеличивается размер
# можно сделать массивы, в которых будут скорости для улучшений?
# сделать функцию левел ап для каждой магии
var bullet_3 = preload('res://magic/HoleBullet.tscn')
var can_fire_3 = false
var fire_rate_3 = 0.3
var level_3 = 1


func _process(delta):
	####### атака врага кустом наверх ###########
	# переделать чтобы он исчезал на уровне персонажа
	if can_fire:
		var bullet_instane = bullet_fire .instance()
		bullet_instane.position = get_global_position()
		bullet_instane.position.y -= 20
		#bullet_instane.rotation_degrees = rotation_degrees
		#bullet_instane.rotation_degrees = 20
		#bullet_instane.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rotation))
		
		get_tree().get_root().add_child(bullet_instane)
		can_fire = false
		yield(get_tree().create_timer(fire_rate),"timeout")
		can_fire = true
		
	####### атака врага фаерболом вбок ###########
	if can_fire_2:
		var bullet2 = bullet_2.instance()
		bullet2.position = get_global_position()
		bullet2.position.x += 20
		get_tree().get_root().add_child(bullet2)
		if level_2 > 1:
			bullet2.position.x -= 20
			get_tree().get_root().add_child(bullet2)
		
		can_fire_2 = false
		yield(get_tree().create_timer(fire_rate_2),"timeout")
		can_fire_2= true
		
	####### атака дырой в области ###########
	# проблема в том что дыра появляется поверх персонажа
	# нужно как то полуить название нода и запихнуть всё под него
	if can_fire_3:
		var bullet3 = bullet_3.instance()
		bullet3.position = get_global_position()
		
		var radius = randi()%100
		var random_angel = randi()%360
		bullet3.position.x += radius * sin(random_angel)
		bullet3.position.y += radius * cos(random_angel)
		
		#var pl = get_parent().get_player()
		#get_tree().get_root().add_child_below_node(pl ,bullet3)
		
		can_fire_3 = false
		yield(get_tree().create_timer(fire_rate_3),"timeout")
		can_fire_3= true
		
		



####### перемещение персонажа ###########
var velocity = Vector2.ZERO
var pos = Vector2.ZERO
export var speed = 1

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
		
	if input_vector != Vector2.ZERO:
		velocity = input_vector	
	else:
		velocity = Vector2.ZERO
	move_and_collide(velocity * speed)
	
	
	
####### подбор предметов и урон ###########
#var exp_count = 0
var can_get_damage = true
var damage_rate = 1
var near_enemy = 0

func get_damage():
	if can_get_damage:
		$HpProgress.value -= 1
		if $HpProgress.value == 0:
			$HpProgress.value = $HpProgress.max_value
		#can_get_damage = false
		#yield(get_tree().create_timer(damage_rate),"timeout")
		#can_get_damage = true

func _on_player_area_area_entered(area):
	if (area.name == "heart_area"):
		area.get_parent().queue_free()
		if $HpProgress.value < $HpProgress.max_value:
			$HpProgress.value += 1
	if (area.name == "exp_area"):
		area.get_parent().queue_free()
		#exp_count += 1
		$ExpProgress.value += 1
		if $ExpProgress.value == $HpProgress.max_value:
			$ExpProgress.value = 0
		# можно включить область, которая отбросит врагов? или просто инвиз. . .
	if area.name == "enemy_area":
		get_damage()
		

