extends ColorRect

var velocity = Vector2(0,0)
var opacity = 1.0
var rotationspeed = randf()

func _ready():
	velocity = Vector2(randf()*2-1,randf()*2-1)
	set_rotation(randi() % 6)
	set_scale(get_scale() * randf())
	

func _process(delta):
	rect_rotation += rotationspeed
	set_position(get_position() + velocity)
	opacity = opacity * 0.92
	self_modulate = Color(1.0,1.0,1.0,opacity)
	if opacity < 0.1:
		queue_free()