extends Node2D
# переменная о выбранном режиме
var endless_or_standart = true
# режим супер мага
var super_magican = 1
# время до выигрыша в стандартном режиме
var time_standart = 300
# переменная о выбранном маге
var magican = 2
# переменная о  прожитом времени
var time_count = 0
# переменная об убитых врагах
var enemy_count = 0
# переменная о  прожитом времени
var level_count = 0
# переменная об уровне каждой магии
var level_fire_1 = 0
var level_fire_2 = 0
var level_fire_3 = 0

var display = true
var music = 0


const FILE_NAME = "res://game-data.json"



func get_standart():
	endless_or_standart = true
	magican = 1
	time_count = 0
	enemy_count = 0
	level_count = 0
	level_fire_1 = 0
	level_fire_2 = 0
	level_fire_3 = 0
	time_standart = 300
	
func get_again():
	time_count = 0
	enemy_count = 0
	level_count = 0
	level_fire_1 = 0
	level_fire_2 = 0
	level_fire_3 = 0
	time_standart = 300





