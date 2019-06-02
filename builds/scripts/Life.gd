extends Label

func _ready():
	set_text(String(global.life))

func _process(delta):
	set_text(String(global.life))
