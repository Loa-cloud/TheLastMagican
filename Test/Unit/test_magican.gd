extends "res://addons/gut/test.gd"

class myArea:
	var name = "heart_area"
	func set_name(new_name):
		name = new_name
		
		
var Magican1 = load('res://player/Magican1.gd')
		
var Big_Enemy = load('res://enemy/Enemy_big.gd')
var Standart_Enemy = load('res://enemy/Enemy_big.gd')
var Fast_Enemy = load('res://enemy/Enemy_big.gd')

var Fireball = load('res://magic/Fireball.gd')

var Info = load('res://world/Global info.gd')

var _test_scene : Class_magican

var _bullet_area = myArea.new()
var _heart_area = myArea.new()
var _exp_area = myArea.new()

var _magican_1 = null

var _standart_enemy = null
var _big_enemy = null
var _fast_enemy = null
var _fireball = null
var _info = null



	

func before_each():
	_test_scene = load('res://player/Magican1.tscn').instance()
	
	_bullet_area.set_name("bullet")
	_heart_area.set_name("heart_area")
	_exp_area.set_name("exp_area")
	
	_magican_1 = Magican1.new()
	
	_standart_enemy = Big_Enemy.new()
	_big_enemy = Standart_Enemy.new()
	_fast_enemy = Fast_Enemy.new()
	_fireball = Fireball.new()
	
	_info = Info.new()
	
	

func after_each():
	_standart_enemy.free()
	_big_enemy.free()
	_fast_enemy.free()
	_fireball.free()
	_info.free()
	
	
# тест что маг после таймера может вновь использовать магию шаровая молния
func test_on_Lightning_timeout():
	_magican_1.can_use_lightning = false
	_magican_1._on_Lightning_timeout()
	assert_true(_magican_1.can_use_lightning)
	
# тест что маг после таймера может вновь использовать магию огненные шары
func test_on_Firaball_timeout():
	_magican_1.can_use_fireball = false
	_magican_1._on_Fireball_timeout()
	assert_true(_magican_1.can_use_fireball)
	
# тест что маг после таймера может вновь использовать магию огненные шары
func test_on_Cristall_timeout():
	_magican_1.can_use_cristall = false
	_magican_1._on_Cristall_timeout()
	assert_true(_magican_1.can_use_cristall)
	
# тест что маг может отправлять сигнал о поднятом очке здоровья если попал в область очка здоровья
func test_player_can_emit_signal_heart_in_area():
	watch_signals(_magican_1)
	_magican_1._on_player_area_area_entered(_heart_area)
	assert_signal_emitted(_magican_1,'heart_in_area')
	
# тест что маг может отправлять сигнал о поднятом очке оыта если попал в область очка опыта
func test_player_can_emit_signal_exp_in_area():
	watch_signals(_magican_1)
	_magican_1._on_player_area_area_entered(_exp_area)
	assert_signal_emitted(_magican_1,'exp_in_area')
	
# персонаж может использовать магию если его уровень владения данной магией больше 0 и прошло время отката
func test_player_can_use_lightning():
	watch_signals(_magican_1)
	_magican_1.can_use_lightning = true
	GlobalInfo.level_fire_1 = 1
	_magican_1._process(100)
	assert_signal_emitted(_magican_1,'lightning')
	
# персонаж не может использовать магию если его уровень владения данной магией больше 0 и прошло время отката
func test_player_can_not_use_lightning():
	watch_signals(_magican_1)
	_magican_1.can_use_lightning = true
	GlobalInfo.level_fire_1 = 0
	_magican_1._process(100)
	assert_signal_not_emitted(_magican_1,'lightning')
	
	
# персонаж не может использовать магию если его уровень владения данной магией больше 0 и прошло время отката
func test_player_can_use_fireball():
	watch_signals(_magican_1)
	_magican_1.can_use_fireball = true
	GlobalInfo.level_fire_2 = 3
	_magican_1._process(100)
	assert_signal_emitted(_magican_1,'fireball')
	
# персонаж не может использовать магию если его уровень владения данной магией больше 0 и прошло время отката
func test_player_can_not_use_fireball():
	watch_signals(_magican_1)
	_magican_1.can_use_fireball = false
	GlobalInfo.level_fire_2 = 3
	_magican_1._process(100)
	assert_signal_not_emitted(_magican_1,'fireball')
	
# персонаж не может использовать магию если его уровень владения данной магией больше 0 и прошло время отката
func test_player_can_use_cristall():
	watch_signals(_magican_1)
	_magican_1.can_use_cristall = true
	GlobalInfo.level_fire_3 = 3
	_magican_1._process(100)
	assert_signal_emitted(_magican_1,'cristall')
	
# персонаж не может использовать магию если его уровень владения данной магией больше 0 и прошло время отката
func test_player_can_not_use_cristall():
	watch_signals(_magican_1)
	_magican_1.can_use_cristall = false
	GlobalInfo.level_fire_3 = 0
	_magican_1._process(100)
	assert_signal_not_emitted(_magican_1,'cristall')

	
	
