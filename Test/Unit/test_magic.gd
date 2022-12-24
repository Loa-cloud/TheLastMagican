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
var Cristall = load('res://magic/Crystal.gd')

var Info = load('res://world/Global info.gd')


var _bullet_area = myArea.new()
var _heart_area = myArea.new()

var _magican_1 = null

var _standart_enemy = null
var _big_enemy = null
var _fast_enemy = null
var _fireball = null
var _cristall = null
var _info = null

	

func before_each():
	_bullet_area.set_name("bullet")
	_heart_area.set_name("heart_area")
	
	_magican_1 = Magican1.new()
	
	_standart_enemy = Big_Enemy.new()
	_big_enemy = Standart_Enemy.new()
	_fast_enemy = Fast_Enemy.new()
	_fireball = Fireball.new()
	_cristall = Cristall.new()
	
	_info = Info.new()

func after_each():
	_standart_enemy.free()
	_big_enemy.free()
	_fast_enemy.free()
	_fireball.free()
	_cristall.free()
	_info.free()
	

