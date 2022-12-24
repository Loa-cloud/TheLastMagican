extends Node2D


func _ready():
	pass # Replace with function body.




func _on_Area2D_area_exited(area):
	pass
	#if area.name == 'player_area':
	#	var pl = get_parent().get_player()
	#	pl.position.x *= -1
	#	pl.position.y *= -1
	#	pass # Replace with function body.
	#area.posirion.x *= -1
	#area.posirion.y *= -1
	#area.


func _on_Area2D_body_exited(body):
	body.position.x *= -1
	pass # Replace with function body.
