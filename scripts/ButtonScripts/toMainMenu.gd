extends Button

func _pressed():
	global.life = global.lifetotal
	global.enemylife = global.enemyTotal
	get_tree().change_scene("res://scenes/MainScreen.tscn")
	global._ready()