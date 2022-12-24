extends "res://addons/gut/test.gd"

var Set = load('res://menu/settings/settings.gd')
var _settings = null

func before_each():
	_settings = Set.new()

func after_each():
	_settings.free()

# активация режима супермага
func test_on_CheckBox_button_down_set_super_magican():
	GlobalInfo.super_magican = 0
	_settings._on_CheckBox_pressed()
	assert_eq(GlobalInfo.super_magican, 1, 'Режим Архимага должен быть активирован')
	
# дезактивация режима супермага
func test_on_CheckBox_button_down_unset_super_magican():
	GlobalInfo.super_magican = 1
	_settings._on_CheckBox_pressed()
	assert_eq(GlobalInfo.super_magican, 0, 'Режим Архимага должен быть дезактивирован')
	
