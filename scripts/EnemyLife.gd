extends Label

func _ready():
	set_text(String(global.enemylife))

func _process(delta):
	set_text(String(global.enemylife))
