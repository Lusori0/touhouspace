extends Control


func _ready():
	safegame.add_points((global.enemyTotal - global.enemylife)*4)
