extends Button

func _pressed():
	if safegame.points >= 5000:
		safegame.add_points(-5000)
		safegame.addhealth()
		get_parent().get_child(2)._ready()