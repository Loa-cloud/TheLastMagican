extends "res://addons/gut/test.gd"


class point:
	var x = 10
	var y = 10
	
class myArea:
	var name = "bullet"
	func set_name(new_name):
		name = new_name
		
		
var Big_Enemy = load('res://enemy/Enemy_big.gd')
var Standart_Enemy = load('res://enemy/Enemy_big.gd')
var Fast_Enemy = load('res://enemy/Enemy_big.gd')

var _bullet_area = myArea.new()
var _heart_area = myArea.new()

var _standart_enemy = null
var _big_enemy = null
var _fast_enemy = null

	

func before_each():
	_bullet_area.set_name("bullet")
	_heart_area.set_name("heart_area")
	
	_standart_enemy = Standart_Enemy.new()
	_big_enemy = Big_Enemy.new()
	_fast_enemy = Fast_Enemy.new()

func after_each():
	_standart_enemy.free()
	_big_enemy.free()
	_fast_enemy.free()
	
	
	
	
# уровень здоровья у врага
func test_hp_standart_enemy():
	#_standart_enemy._ready()
	assert_eq(_standart_enemy.hp, 1, 'Здоровье у стандартного врага должно быть равно 1')
	
func test_hp_big_enemy():
	_big_enemy._ready()
	assert_eq(_big_enemy.hp, 2, 'Здоровье у большого врага должно быть равно 2')
	
func test_hp_fast_enemy():
	#_fast_enemy._ready()
	assert_eq(_fast_enemy.hp, 1, 'Здоровье у быстрого врага должно быть равно 1')
	
	
# отправка сигнала о нанесении урона магу
func test_standart_can_bite_near_player():
	watch_signals(_standart_enemy)
	_standart_enemy.position.x = 1
	_standart_enemy.position.y = 1
	var magican_p = point.new()
	_standart_enemy.try_bite(magican_p)
	assert_signal_emitted(_standart_enemy, 'bite')
	
	
# интеграционный тест
# отправка сигнала о нанесении урона магу
func test_standart_can_bite_near_player_int():
	watch_signals(_standart_enemy)
	_standart_enemy.position.x = 1
	_standart_enemy.position.y = 1
	var magican_p = load('res://player/Magican1.gd').new()
	magican_p.position.x = 2
	magican_p.position.y = 2
	_standart_enemy.try_bite(magican_p.position)
	assert_signal_emitted(_standart_enemy, 'bite')
	
	
# нет сигнала о не нанесении урона магу, есьи маг далеко
func test_standart_can_not_bite_near_player():
	watch_signals(_standart_enemy)
	_standart_enemy.position.x = 100
	_standart_enemy.position.y = 100
	var magican_p = point.new()
	_standart_enemy.try_bite(magican_p)
	assert_signal_not_emitted(_standart_enemy, 'bite')

# умирание от пули
func test_big_enemy_take_one_damage():
	print_stray_nodes()
	_big_enemy._ready()
	_big_enemy._on_enemy_area_area_entered(_bullet_area)
	assert_eq(_big_enemy.hp, 1, 'Здоровье у большого врага должно быть равно 1')
	


# не умирание от очков хп
func test_standart_enemy_take_hp():
	_standart_enemy._ready()
	_standart_enemy._on_enemy_area_area_entered(_heart_area)
	assert_ne(_standart_enemy.hp, 0, 'Здоровье должно остаться прежним')
	
	
	
	
	
	
	
	
	
	
	
	
	
