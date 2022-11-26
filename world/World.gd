extends Node2D

var Enemy = preload("res://enemy/Enemy1.tscn")

var random_angel = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

####### получение доступа к персонжу для его координат ###########
func get_player():
	return $Player

# функция появления врагов
# появляются на месте игрока и перемещаются за его предел видимости
func _on_SpawnTimer_timeout():
	var enemy = Enemy.instance()
	add_child(enemy)
	random_angel = randi()%360
	#enemy.position = $Spawn.position
	enemy.position = $Player.position
	enemy.position.x += 170 * sin(random_angel)
	enemy.position.y += 170 * cos(random_angel)
