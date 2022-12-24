extends StaticBody2D




# Called when the node enters the scene tree for the first time.
func _ready():
	var random = randi()%2
	if random == 0:
		$Sprite1.visible = true
		$Collision1.disabled = false
	elif random == 1:
		$Sprite2.visible = true
		$Collision2.disabled = false

