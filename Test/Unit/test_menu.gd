extends "res://addons/gut/test.gd"

var Menu = load('res://menu/main_menu/main_menu.gd')
var _menu = null

func before_each():
	_menu = Menu.new()
	watch_signals(_menu)

func after_each():
	_menu.free()


	

func test_on_new_game_pressed():
	_menu._on_new_game_pressed()
	assert_signal_emitted(_menu,'new_game')
	
func test_on_options_pressed():
	_menu._on_options_pressed()
	assert_signal_emitted(_menu,'settings')
	#emit_signal("settings")
	
func test_on_exit_pressed():
	_menu._on_exit_pressed()
	assert_signal_emitted(_menu,'exit')
	#emit_signal("exit")
