extends "res://addons/gut/test.gd"

var Menu = load('res://menu/choose character/choose_character.gd')
var _menu = null

func before_each():
	_menu = Menu.new()
	watch_signals(_menu)

func after_each():
	_menu.free()
	
func test_on_character1_pressed():
	_menu._on_character1_pressed()
	assert_signal_emitted(_menu,'character1')
	
func test_on_character2_pressed():
	_menu._on_character2_pressed()
	assert_signal_emitted(_menu,'character2')
	
func test_on_character3_pressed():
	_menu._on_character3_pressed()
	assert_signal_emitted(_menu,'character3')
