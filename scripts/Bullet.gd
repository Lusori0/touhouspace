extends KinematicBody2D

var velocity = Vector2(3,0)
var damage = global.damage
var hiteffect = preload("res://scenes/hiteffect.tscn")


func _process(delta):
	move_and_collide(velocity)
	if position.x > 110:
		queue_free()

func _on_Area2D_body_entered(body):
	global.enemylife -= damage
	var hiteffectin = hiteffect.instance()
	hiteffectin.effectposition = position
	get_parent().get_parent().add_child(hiteffectin)
	queue_free()
