extends Sprite

var speed = global.speed

func _physics_process(delta):
	set_position(Vector2(get_position().x - speed, 0))
	if get_position().x < -150:
		set_position(Vector2(156,0))
	pass
