extends Node2D

var effectposition = Vector2(0,0)

func _ready():
	$rect1.set_position(effectposition)
	$rect2.set_position(effectposition)
	$rect3.set_position(effectposition)