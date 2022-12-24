#extends 'res://addons/gut/test.gd'
extends "res://addons/gut/test.gd"

class myArea:
	var name = "bullet"
	func set_name(new_name):
		name = new_name


var ClassMagican = load('res://player/Class Magican.gd')
var Magican1 = load('res://player/Magican1.gd')

var Big_Enemy = load('res://Enemy_big.gd')
var Fireball = load("res://magic/Fireball.gd")

var Global = load("res://world/Global Info.gd")

var Statistic = load("res://menu/statistcs/statistics.gd")



var _bullet_area = myArea.new()
var _heart_area = myArea.new()

var _big_enemy = null
var _magican_1 = null
var _global = null
	

# этот блок команд выполняется перед каждым тестом
func before_each():
	_bullet_area.set_name("bullet")
	_heart_area.set_name("heart_area")
	
	_big_enemy = Big_Enemy.new()
	_magican_1 = Magican1.new()
	
	
	
# этот блок команд выполняется после каждого теста
func after_each():
	_big_enemy.free()
	_magican_1.free()


# блок проверок для большого врага
func test_big_enemy():
	_big_enemy._ready()
	assert_eq(_big_enemy.hp, 2, 'Здоровье у большого врага должно быть равно 2')

func test_big_enemy_take_one_damage():
	_big_enemy._ready()
	_big_enemy._on_enemy_area_area_entered(_bullet_area)
	assert_eq(_big_enemy.hp, 1, 'Здоровье у большого врага должно быть равно 1')
	
func test_big_enemy_take_two_damage():
	_big_enemy._ready()
	_big_enemy._on_enemy_area_area_entered(_bullet_area)
	_big_enemy._on_enemy_area_area_entered(_bullet_area)
	assert_eq(_big_enemy.hp, 0, 'Здоровье у большого врага должно быть равно 0')
	
func test_big_enemy_take_heart_area():
	_big_enemy._ready()
	_big_enemy._on_enemy_area_area_entered(_heart_area)
	_big_enemy._on_enemy_area_area_entered(_heart_area)
	assert_eq(_big_enemy.hp, 2, 'Здоровье осталось прежним')
	
	
	

# проверка о не отправлении сигнала если вся магия изучена
func signal_level_up():
	_global.endless_or_standart = false
	_global.time_standart = 0
	
# проверка изменения размеров окна
# проверка изменения громкости музыки?
# проверка корректрой работы выбора режима
# проверка выбора конкретного мага
# проверка смерти мага? кажетя сложно
# проверка количества поднятых уровней
# проверка прожитого времени?
# проверка убитых врагов?
# проверка исчезновения шаровой молнии со временем
# проверка исчезновения кристалов
# проверка исчезновения фаерболов
# проверка поялвения кнопки о повышении уровня?
# проверка есть ли сигнал от мага о повышении уровня?

# проверка движения персонажа при нажатии на кнопки
# уменьшение хп
# подбор предметов персонажа
# исчезновение конфетки после ее подбора
# выбор персонажа
# снятие игры с паузы
# проверка перехода между сценами







#var _magican = ClassMagican.new()

#func test_some_method():
#	var result = _magican.test()
#	assert_eq(result, 'nothing', 'result shold have been nothing')
	
	
#func test_enemy_big():
#	var ClassEnemy = load('res://Enemy_big.gd')
#	var _enemy_big = ClassEnemy.new()
#	var hp = 2
#	var result = _enemy_big._ready()
#	assert_eq(result, hp, 'hp shoul be 2')
