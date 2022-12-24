extends KinematicBody2D

class_name Class_magican


func _ready():
	pass


####### атака врага шаровой молнией ###########
	# 1 уровень 
	# 2 уровень - уровень горизонта стал ниже
	# 3 уровень - уровень горизонта стал ниже
var can_use_lightning = true
# переменная отображает в какую сторону повернут маг
var direction = 'right'


signal lightning
signal fireball
signal cristall

func _on_Class_Magican_lightning():

	var position_queue_1 = position.y
	if GlobalInfo.level_fire_1 > 1:
		position_queue_1 += 50
	if GlobalInfo.level_fire_1 > 2:
		position_queue_1 += 50
	var bullet_instane = preload('res://magic/Lightning.tscn').instance()
	bullet_instane.position = get_global_position()
	bullet_instane.position.y -= 20
	bullet_instane.position_queue = position_queue_1
	get_tree().get_root().add_child(bullet_instane)
	can_use_lightning = false
	$Lightning.start(0.9)

func _on_Lightning_timeout():
	can_use_lightning = true


####### атака врага огненными шарами ###########
	# 1 уровень - 1 фаербол
	# 2 уровень - 2 фаербол
	# 3 уровень - они стали больше
var can_use_fireball = true





func _on_Class_Magican_fireball():

	var bullet2 = preload('res://magic/Fireball.tscn').instance()
	if GlobalInfo.level_fire_2 > 2:
		bullet2.scale = (Vector2(1.05,1.05))
		
	if (direction == 'right'):
		bullet2.position = get_global_position()
		bullet2.position.x += 20
		bullet2.velocity = Vector2 (1,0).normalized() 
		get_tree().get_root().add_child(bullet2)
	else:
		bullet2.flip_sprite()
		bullet2.position = get_global_position()
		bullet2.position.x -= 20
		bullet2.velocity = Vector2 (-1,0).normalized() 
		get_tree().get_root().add_child(bullet2)
			
	if GlobalInfo.level_fire_2 > 1:
		bullet2 = preload('res://magic/Fireball.tscn').instance()
		#bullet2.flip_sprite()
		if GlobalInfo.level_fire_2 > 2:
			bullet2.scale = (Vector2(1.05,1.05))
			
		if (direction == 'right'):
			bullet2.flip_sprite()
			bullet2.position = get_global_position()
			bullet2.position.x -= 20
			bullet2.velocity = Vector2 (-1,0).normalized() 
			get_tree().get_root().add_child(bullet2)
		else:
			bullet2.position = get_global_position()
			bullet2.position.x += 20
			bullet2.velocity = Vector2 (1,0).normalized() 
			get_tree().get_root().add_child(bullet2)
		
		
	can_use_fireball = false
	$Fireball.start(1.1)


func _on_Fireball_timeout():
	can_use_fireball = true


####### атака врага кристаллами ###########
	# 1 уровень 
	# 2 уровень - кристаллы появляются чаще
	# 3 уровень - кристаллы больше
var can_use_cristall = true






func _on_Class_Magican_cristall():

	var bullet3 = preload('res://magic/Crystal.tscn').instance()
	var fire_rate_3 = 0.9
	bullet3.scale = (Vector2(0.4,0.4))
	if GlobalInfo.level_fire_3 > 1:
		fire_rate_3 = 0.3
	if GlobalInfo.level_fire_3 > 2:
		bullet3.scale = (Vector2(0.45,0.45))
	bullet3.position = get_global_position()
	get_tree().get_root().add_child(bullet3)
	
	can_use_cristall = false
	$Cristall.start(fire_rate_3)


func _on_Cristall_timeout():
	can_use_cristall = true


func _process(_delta):
	if can_use_lightning and GlobalInfo.level_fire_1 > 0:
		emit_signal("lightning")
	if can_use_fireball and GlobalInfo.level_fire_2 > 0:
		emit_signal("fireball")
	if can_use_cristall and GlobalInfo.level_fire_3 > 0:
		emit_signal("cristall")


####### перемещение персонажа ###########
var velocity = Vector2.ZERO
var speed = 70

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	input_vector = input_vector.normalized()
	if input_vector != Vector2.ZERO:
		velocity = input_vector
	else:
		velocity = Vector2.ZERO
	# поворот спрайта
	if velocity.x < 0:
		$Sprite.flip_h = true
		direction = 'left'
	elif velocity.x > 0:
		$Sprite.flip_h = false
		direction = 'right'
		
	var _moveCollision = move_and_collide(velocity * delta * speed)
	
	
	
####### подбор предметов и урон ###########
signal level_up
signal heart_in_area
signal exp_in_area

func _on_player_area_area_entered(area):
	if (area.name == "heart_area"):
		emit_signal("heart_in_area")
	if (area.name == "exp_area"):
		emit_signal("exp_in_area")
		

func _on_Class_Magican_heart_in_area():
	if $HpProgress.value < $HpProgress.max_value:
		$HpProgress.value += 100

func _on_Class_Magican_exp_in_area():
	$ExpProgress.value += 1
	if $ExpProgress.value == $ExpProgress.max_value:
		$ExpProgress.value = 0
		GlobalInfo.enemy_count += 1
		if GlobalInfo.level_fire_1 != 3 or GlobalInfo.level_fire_2 != 3 or GlobalInfo.level_fire_3 != 3:
			emit_signal("level_up")
			GlobalInfo.level_count += 1
		$ExpProgress.max_value += 5


####### получение урона ###########
func bite():
	$HpProgress.value -= 1
	if $HpProgress.value == 0:
		if get_tree().change_scene("res://menu/statistics/statistics.tscn") != OK:
			print ("An unexpected error occured when trying to switch to the Readme scene")
			
	











