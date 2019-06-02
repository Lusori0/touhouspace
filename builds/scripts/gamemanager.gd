extends Node2D

var paused

func _process(delta):
	if global.enemylife <= 0:
		get_tree().change_scene("res://scenes/EndsceneWon.tscn")
	if global.life <= 0:
		get_tree().change_scene("res://scenes/EndsceneLost.tscn")
