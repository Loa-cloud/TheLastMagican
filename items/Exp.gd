extends Node2D



func _on_exp_area_area_entered(area):
	if (area.name == "player_area"):
		queue_free()
