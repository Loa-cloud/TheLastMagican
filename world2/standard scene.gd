extends Node2D

##var Enemy = preload("res://enemy/Enemy1.tscn")

var random_angel = 0
var difficulty = 1
var random = 0

var player
var label

#onready var player = $Player
#get_node("Player/LabelTimer")
#onready var label  = $Player/LableTimer

var Player = preload("res://player/Magican1.tscn")

#var label

func _ready():
	GlobalInfo.endless_or_standart = false
	if GlobalInfo.magican == 1:
		Player = preload("res://player/Magican1.tscn")
	elif GlobalInfo.magican == 2:
		Player = preload("res://player/Magican2.tscn")
	else:
		Player = preload("res://player/Magican3.tscn")
	var pl = Player.instance()
	pl.position.x = -42
	pl.position.y = 286
	pl.name = "Player"
	add_child(pl)
	player = $Player
	#label  = $Player/LabelTimer
	var _conect = $Player.connect("level_up", $GUI/Button, "level_up")
	var _conect2 = $GUI/Button.connect("new_magic", $GUI/choose_magic, "new_magic")
	var _conect3 = $GUI/choose_magic.connect("no_upgrade", $GUI/Button, "no_upgrade")
	
	$SpawnTimer.wait_time = 2
	label = $Player/LabelTimer
	label.text = "5:00"
	
	

####### получение доступа к персонжу для его координат ###########
func get_player():
	return $Player


####### поялвение врагов ###########
func swap_dif1(Enemy):
	var enemy = Enemy.instance()
	add_child(enemy)
	random = randi()%4
	
	if random == 0:
		enemy.position = $Spawn1.position
			
	elif random == 1:
		enemy.position = $Spawn2.position
			
	elif random == 2:
		enemy.position = $Spawn3.position
		
	else:
		enemy.position = $Spawn4.position
		
	enemy.connect("bite", $Player, "bite")
		
func swap_dif2(Enemy):
	var enemy1 = Enemy.instance()
	var enemy2 = Enemy.instance()
	random = randi()%6
	
	if random == 0:
		add_child(enemy1)
		enemy1.position = $Spawn1.position
		add_child(enemy2)
		enemy2.position = $Spawn2.position
			
	elif random == 1:
		add_child(enemy1)
		enemy1.position = $Spawn1.position
		add_child(enemy2)
		enemy2.position = $Spawn3.position
			
	elif random == 2:
		add_child(enemy1)
		enemy1.position = $Spawn1.position
		add_child(enemy2)
		enemy2.position = $Spawn4.position
		
	elif random == 3:
		add_child(enemy1)
		enemy1.position = $Spawn2.position
		add_child(enemy2)
		enemy2.position = $Spawn3.position
	
	elif random == 4:
		add_child(enemy1)
		enemy1.position = $Spawn2.position
		add_child(enemy2)
		enemy2.position = $Spawn4.position
	
	else:
		add_child(enemy1)
		enemy1.position = $Spawn3.position
		add_child(enemy2)
		enemy2.position = $Spawn4.position
		
	enemy1.connect("bite", $Player, "bite")
	enemy2.connect("bite", $Player, "bite")
		
func swap_dif3(Enemy):
	var enemy1 = Enemy.instance()
	var enemy2 = Enemy.instance()
	var enemy3 = Enemy.instance()
	random = randi()%4
	
	if random == 0:
		add_child(enemy1)
		enemy1.position = $Spawn1.position
		add_child(enemy2)
		enemy2.position = $Spawn2.position
		add_child(enemy3)
		enemy3.position = $Spawn3.position
			
	elif random == 1:
		add_child(enemy1)
		enemy1.position = $Spawn1.position
		add_child(enemy2)
		enemy2.position = $Spawn2.position
		add_child(enemy3)
		enemy3.position = $Spawn4.position
			
	elif random == 2:
		add_child(enemy1)
		enemy1.position = $Spawn1.position
		add_child(enemy2)
		enemy2.position = $Spawn3.position
		add_child(enemy3)
		enemy3.position = $Spawn4.position
	
	else:
		add_child(enemy1)
		enemy1.position = $Spawn2.position
		add_child(enemy2)
		enemy2.position = $Spawn3.position
		add_child(enemy3)
		enemy3.position = $Spawn4.position
		
	enemy1.connect("bite", $Player, "bite")
	enemy2.connect("bite", $Player, "bite")
	enemy3.connect("bite", $Player, "bite")
	

func swap_dif4(Enemy):
	var enemy1 = Enemy.instance()
	var enemy2 = Enemy.instance()
	var enemy3 = Enemy.instance()
	var enemy4 = Enemy.instance()
	add_child(enemy1)
	enemy1.position = $Spawn1.position
	
	add_child(enemy2)
	enemy2.position = $Spawn2.position
	
	add_child(enemy3)
	enemy3.position = $Spawn3.position
	
	add_child(enemy4)
	enemy4.position = $Spawn4.position
	
	enemy1.connect("bite", $Player, "bite")
	enemy2.connect("bite", $Player, "bite")
	enemy3.connect("bite", $Player, "bite")
	enemy4.connect("bite", $Player, "bite")

var r = RandomNumberGenerator.new()
var Enemy3 = preload("res://enemy/Enemy_standart.tscn")
var Enemy1 = preload("res://enemy/Enemy_big.tscn")
var Enemy2 = preload("res://enemy/Enemy_fast.tscn")	


func choose_enemy():
	r.randomize()
	var random1 = r.randi_range(0, 3)
	if random1 == 0:
		return Enemy3
	if random1 == 1:
		return Enemy1
	if random1 == 2:
		return Enemy2
	else:
		return Enemy2

		
# функция появления врагов
# появляются на месте игрока и перемещаются за его предел видимости
func _on_SpawnTimer_timeout():
	var Enemy = choose_enemy()
	if difficulty == 1:
		swap_dif1(Enemy)
	elif difficulty == 2:
		swap_dif2(Enemy)
	elif difficulty == 3:
		swap_dif3(Enemy)
	elif difficulty == 4:
		swap_dif4(Enemy)


func _on_Timer_1_min_timeout():
	if difficulty < 4:
		difficulty += 1
	else:
		$SpawnTimer.wait_time = 1

func _on_Timer_1sec_timeout():
	GlobalInfo.time_count += 1
	if GlobalInfo.time_standart == 0:
		get_win()
	if GlobalInfo.time_standart > 0:
		GlobalInfo.time_standart -= 1
		var c1 = GlobalInfo.time_standart/60
		var c2 = GlobalInfo.time_standart%60
		if c2 < 10:
			label.text = str(c1) + ":0" + str(c2)
		else:
			label.text = str(c1) + ":" + str(c2)

func get_win():
	GlobalInfo.time_count = 300
	if get_tree().change_scene("res://menu/statistics/statistics.tscn") != OK:
		print ("An unexpected error occured when trying to switch to the Readme scene")
