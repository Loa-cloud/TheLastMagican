extends Node2D


####### загрузка персонажа ###########

var label
var Random_tree = preload("res://world/random_tree.tscn")

func set_random_tree():
	var step = 300
	var size_world = 50
	
	# 1 четверть
	for x in range(size_world):
		for y in range(size_world):
			var random_x = randi()%step
			var random_y = randi()%step
			# четвертая четверть
			var tree = Random_tree.instance()
			tree.position.x = x * step - random_x
			tree.position.y = -1 * y * step - random_y
			add_child(tree)
	
	# 2 четверть
	for x in range(size_world):
		for y in range(size_world):
			var random_x = randi()%step
			var random_y = randi()%step
			# четвертая четверть
			var tree = Random_tree.instance()
			tree.position.x = -1 * x * step - random_x
			tree.position.y = -1 * y * step - random_y
			add_child(tree)
			
	# 3 четверть
	for x in range(size_world):
		for y in range(size_world):
			var random_x = randi()%step
			var random_y = randi()%step
			# четвертая четверть
			var tree = Random_tree.instance()
			tree.position.x = -1 * x * step - random_x
			tree.position.y = y * step - random_y
			add_child(tree)
	
	# 4 четверть
	for x in range(size_world):
		for y in range(size_world):
			var random_x = randi()%step
			var random_y = randi()%step
			
			var tree = Random_tree.instance()
			tree.position.x = x * step + random_x
			tree.position.y = y * step + random_y
			add_child(tree)
			
			

func _ready():
	
	set_random_tree()

	var Player
	if GlobalInfo.magican == 1:
		Player = preload("res://player/Magican1.tscn")
	elif GlobalInfo.magican == 2:
		Player = preload("res://player/Magican2.tscn")
	else:
		Player = preload("res://player/Magican3.tscn")
	var pl = Player.instance()
	pl.name = "Player"
	add_child(pl)
	var _conect = $Player.connect("level_up", $GUI/Button, "level_up")
	var _conect2 = $GUI/Button.connect("new_magic", $GUI/choose_magic, "new_magic")
	var _conect3 = $GUI/choose_magic.connect("no_upgrade", $GUI/Button, "no_upgrade")
	label = $Player/LabelTimer
	label.text = "0:00"
	
func get_player():
	return $Player
	
####### появление врагов ###########
# функция выбора типа врага и его появления на карте
# появляются за пределами видимости игрока
func _on_SpawnTimer_timeout():
	var random = randi()%3
	if random == 0:
		spawn_enemy(preload("res://enemy/Enemy_standart.tscn"))
	if random == 1:
		spawn_enemy(preload("res://enemy/Enemy_big.tscn"))
	if random == 2:
		spawn_enemy(preload("res://enemy/Enemy_fast.tscn"))
	
	
func spawn_enemy(Enemy):
	var enemy = Enemy.instance()
	add_child(enemy)
	var random_angel = randi()%360
	enemy.position = $Player.position
	enemy.position.x += 170 * sin(random_angel)
	enemy.position.y += 170 * cos(random_angel)
	enemy.connect("bite", $Player, "bite")


func _on_LableTimer_timeout():
	GlobalInfo.time_count += 1
	if GlobalInfo.time_count%60 < 10:
		label.text = str(GlobalInfo.time_count/60) + ":0" + str(GlobalInfo.time_count%60)
	else:
		label.text = str(GlobalInfo.time_count/60) + ":" + str(GlobalInfo.time_count%60)
