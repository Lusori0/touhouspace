extends Button

func _pressed():
	if safegame.points >= 10000:
		safegame.add_points(-10000)
		safegame.doubledamage()
		get_parent().get_child(2)._ready()