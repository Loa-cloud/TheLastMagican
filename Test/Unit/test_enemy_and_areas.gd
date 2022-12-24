extends "res://addons/gut/test.gd"

class myArea:
	var name = "bullet"
	func set_name(new_name):
		name = new_name
		
		
var Magican1 = load('res://player/Magican1.gd')
		
var Big_Enemy = load('res://enemy/Enemy_big.gd')
var Standart_Enemy = load('res://enemy/Enemy_big.gd')
var Fast_Enemy = load('res://enemy/Enemy_big.gd')

var Fireball = load('res://magic/Fireball.gd')


var _bullet_area = myArea.new()
var _heart_area = myArea.new()

var _magican_1 = null

var _standart_enemy = null
var _big_enemy = null
var _fast_enemy = null
var _fireball = null

	

func before_each():
	_bullet_area.set_name("bullet")
	_heart_area.set_name("heart_area")
	
	_magican_1 = Magican1.new()
	
	_standart_enemy = Big_Enemy.new()
	_big_enemy = Standart_Enemy.new()
	_fast_enemy = Fast_Enemy.new()
	_fireball = Fireball.new()

func after_each():
	_standart_enemy.free()
	_big_enemy.free()
	_fast_enemy.free()
	_fireball.free()
	

# атака врага
func test_standart_enemy_try_bite_player():
	watch_signals(_standart_enemy)
	_standart_enemy.position.x = 0
	_standart_enemy.position.y = 0
	_magican_1.position.x = 1
	_magican_1.position.y = 1
	_standart_enemy.try_bite(_magican_1.position)
	
	assert_signal_emitted(_standart_enemy, 'bite')
	
# магия и враг - фигняя
#func enemy_and_fireball():
#	_standart_enemy.position.x = 0
#	_standart_enemy.position.y = 0
#	_fireball.position.x = 1
#	_fireball.position.x = 2
	
	
#	assert_freed(_standart_enemy, "New Node")
	
	
	
	
	
	
	
	
	
	
	
	
	
