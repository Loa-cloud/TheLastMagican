extends "res://addons/gut/test.gd"

var Menu = load('res://menu/pause/pause.gd')
var _menu = null

func before_each():
	_menu = Menu.new()

func after_each():
	_menu.free()


# на кнопку возообновить игру игра снимается с паузы
func test_on_play_pressed():
	var Doubled = double(Menu)
	var _doubled_script = Doubled.new()
	_doubled_script.is_paused = true
	_doubled_script._on_play_pressed()
	assert_false(_doubled_script.is_paused)

	
