extends "res://addons/gut/test.gd"

var Menu = load('res://menu/select_mode/select_mode.gd')
var _menu = null

func before_each():
	_menu = Menu.new()

func after_each():
	_menu.free()

# выбор бесконечного режима
func test_on_endless_pressed():
	_menu._on_endless_pressed()
	assert_true(GlobalInfo.endless_or_standart)
	
# выбор стандартного режима
func test_on_standart_pressed():
	_menu._on_standart_pressed()
	assert_false(GlobalInfo.endless_or_standart)
	

