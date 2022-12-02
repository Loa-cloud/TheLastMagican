extends Node2D

var Enemy = preload("res://enemy/Enemy1.tscn")

var random_angel = 0
var difficulty = 1
var random = 0

onready var player = $Player
onready var label = get_node("Player/LabelTimer")



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

####### получение доступа к персонжу для его координат ###########
func get_player():
	return $Player

			
func swap_dif1():
	var enemy = Enemy.instance()
	add_child(enemy)
	random = randi()%4
	
	if random == 0:
		enemy.position = $Spawn1.position
		print(1)
			
	elif random == 1:
		enemy.position = $Spawn2.position
		print(2)
			
	elif random == 2:
		enemy.position = $Spawn3.position
		print(3)
		
	else:
		enemy.position = $Spawn4.position
		print(4)
		
func swap_dif2():
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
		
func swap_dif3():
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

func swap_dif4():
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

# функция появления врагов
# появляются на месте игрока и перемещаются за его предел видимости
func _on_SpawnTimer_timeout():
	if difficulty == 1:
		swap_dif1()
	elif difficulty == 2:
		swap_dif2()
	elif difficulty == 3:
		swap_dif3()
	elif difficulty == 4:
		swap_dif4()


func _on_Timer_1_min_timeout():
	print("tttt")
	difficulty += 1


var timer_counter = 300
func _on_Timer_1sec_timeout():
	if timer_counter > 0:
		timer_counter -= 1
		var c1 = timer_counter/60
		var c2 = timer_counter%60
		if c2 < 10:
			label.text = str(c1) + ":0" + str(c2)
		else:
			label.text = str(c1) + ":" + str(c2)
