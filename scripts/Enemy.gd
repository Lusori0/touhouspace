extends Node2D

var Projectile = preload("res://scenes/Obstacle.tscn")
var shooting = false
var rotationspeed = global.enemyRotationSpeed

var bulletamount = 0
var spawnlocation = Vector2(0,0)

var pattern = randi() % 4

func _ready():
	$startTimer.start()
	$changePattern.start()

func _on_startTimer_timeout():
	shooting = true
	$EnemyShootTimer.start()
	$helptimer.start()

func _on_changePattern_timeout():
	randomize()
	shooting = false
	$startTimer.start()
	$EnemyShootTimer.stop()
	pattern = randi() % 4

func _on_helptimer_timeout():
	bulletamount = 0


func _on_EnemyShootTimer_timeout():
	if shooting:
		if pattern == 0:
			var projectile = Projectile.instance()
			projectile.velocity = Vector2(cos(get_rotation()), sin(get_rotation())) * global.projectilespeedmultiplier
			projectile.set_position(Vector2(74,0))
			get_parent().add_child(projectile)
		
			var projectile2 = Projectile.instance()
			projectile2.velocity = Vector2(cos(get_rotation()+ PI/2), sin(get_rotation()+PI/2)) * global.projectilespeedmultiplier
			projectile2.set_position(Vector2(74,0))
			get_parent().add_child(projectile2)
		
			var projectile3 = Projectile.instance()
			projectile3.velocity = Vector2(cos(get_rotation()+PI), sin(get_rotation()+PI)) * global.projectilespeedmultiplier
			projectile3.set_position(Vector2(74,0))
			get_parent().add_child(projectile3)
			
			var projectile4 = Projectile.instance()
			projectile4.velocity = Vector2(cos(get_rotation() - PI/2), sin(get_rotation() - PI/2)) * global.projectilespeedmultiplier
			projectile4.set_position(Vector2(74,0))
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
			projectile.set_position(Vector2(74,0))
			get_parent().add_child(projectile)
		elif pattern == 2:
			rotationspeed = 0.2
			rotate(rotationspeed)
			$EnemyShootTimer.set_wait_time(0.01)

			var projectile = Projectile.instance()
			projectile.velocity = Vector2(sin(get_rotation()), cos(get_rotation())) * global.projectilespeedmultiplier
			projectile.set_position(Vector2(74,0))
			get_parent().add_child(projectile)

			var projectile2 = Projectile.instance()
			projectile2.velocity = Vector2(sin(get_rotation()+PI), cos(get_rotation()+PI)) * global.projectilespeedmultiplier
			projectile2.set_position(Vector2(74,0))
			get_parent().add_child(projectile2)
			
		elif pattern == 3:
			rotationspeed = 0
			$EnemyShootTimer.set_wait_time(0.1)
			
			if bulletamount == 0:
				var rand1 = randi() % 2
				var rand2 = randi() % 2
				var positionaddX = 0
				var positionaddY = 0
				if rand1 == 0:
					rand1 = -1
				if rand2 == 0:
					positionaddX = 20 * rand1
				else:
					positionaddY = 20 * rand1
				
				spawnlocation = Vector2(global.playerPosition.x + positionaddX, global.playerPosition.y + positionaddY)
			
			bulletamount += 1
			
			if bulletamount < 10:
				var projectile = Projectile.instance()
				projectile.velocity = Vector2(0,0.1)
				projectile.set_position(spawnlocation)
				projectile.acceleration = 1.08
				get_parent().add_child(projectile)
				
				var projectile2 = Projectile.instance()
				projectile2.velocity = Vector2(0,-0.1)
				projectile2.set_position(spawnlocation)
				projectile2.acceleration = 1.08
				get_parent().add_child(projectile2)
				
				var projectile3 = Projectile.instance()
				projectile3.velocity = Vector2(0.1,0)
				projectile3.set_position(spawnlocation)
				projectile3.acceleration = 1.08
				get_parent().add_child(projectile3)
				
				var projectile4 = Projectile.instance()
				projectile4.velocity = Vector2(-0.1,0)
				projectile4.set_position(spawnlocation)
				projectile4.acceleration =1.08
				get_parent().add_child(projectile4)
			
#		elif pattern == 3:
#			rotationspeed = 0
#			rotate(rotationspeed)
#			$EnemyShootTimer.set_wait_time(0.01)
#
#			var projectile = Projectile.instance()
#			projectile.velocity = Vector2(global.playerPosition.x / 20, global.playerPosition.y / 20)
#			get_parent().add_child(projectile)



