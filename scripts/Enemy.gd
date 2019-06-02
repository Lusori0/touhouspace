extends Node2D

var Projectile = preload("res://scenes/Obstacle.tscn")
var shooting = false
var rotationspeed = global.enemyRotationSpeed

var pattern = randi() % 3

func _ready():
	$startTimer.start()
	$changePattern.start()

func _on_startTimer_timeout():
	shooting = true
	$EnemyShootTimer.start()

func _on_changePattern_timeout():
	randomize()
	pattern = randi() % 3


func _on_EnemyShootTimer_timeout():
	if shooting:
		if pattern == 0:
			var projectile = Projectile.instance()
			projectile.velocity = Vector2(cos(get_rotation()), sin(get_rotation())) * global.projectilespeedmultiplier
			get_parent().add_child(projectile)
		
			var projectile2 = Projectile.instance()
			projectile2.velocity = Vector2(cos(get_rotation()+ PI/2), sin(get_rotation()+PI/2)) * global.projectilespeedmultiplier
			get_parent().add_child(projectile2)
		
			var projectile3 = Projectile.instance()
			projectile3.velocity = Vector2(cos(get_rotation()+PI), sin(get_rotation()+PI)) * global.projectilespeedmultiplier
			get_parent().add_child(projectile3)
			
			var projectile4 = Projectile.instance()
			projectile4.velocity = Vector2(cos(get_rotation() - PI/2), sin(get_rotation() - PI/2)) * global.projectilespeedmultiplier
			get_parent().add_child(projectile4)
			
			rotationspeed = 0.1
			rotate(rotationspeed)
			$EnemyShootTimer.set_wait_time(0.15)
			
		elif pattern == 1:
			rotationspeed = 0.4
			rotate(rotationspeed)
			$EnemyShootTimer.set_wait_time(0.01)

			var projectile = Projectile.instance()
			projectile.velocity = Vector2(sin(get_rotation()), cos(get_rotation())) * global.projectilespeedmultiplier
			get_parent().add_child(projectile)
		elif pattern == 2:
			rotationspeed = 0.2
			rotate(rotationspeed)
			$EnemyShootTimer.set_wait_time(0.01)

			var projectile = Projectile.instance()
			projectile.velocity = Vector2(sin(get_rotation()), cos(get_rotation())) * global.projectilespeedmultiplier
			get_parent().add_child(projectile)

			var projectile2 = Projectile.instance()
			projectile2.velocity = Vector2(sin(get_rotation()+PI), cos(get_rotation()+PI)) * global.projectilespeedmultiplier
			get_parent().add_child(projectile2)
