extends KinematicBody2D

var velocity = Vector2(3,0)
var damage = global.damage

func _process(delta):
	move_and_collide(velocity)
	if position.x > 110:
		queue_free()



func _on_Area2D_body_entered(body):
	global.enemylife -= damage
	queue_free()
