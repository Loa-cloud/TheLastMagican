extends "res://addons/gut/test.gd"

var Menu = load('res://menu/statistics/statistics.gd')
var _menu = null

func before_each():
	_menu = Menu.new()
	watch_signals(_menu)

func after_each():
	_menu.free()
	
func test_get_statistic():
	_menu._ready()
	#var text = "Вы проиграли"
	#_menu._on_character1_pressed()
	assert_signal_emitted(_menu,'get_statistic')
	#assert_eq(_menu.text, text, "Должно быть сообщение о проигрыше")
