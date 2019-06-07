extends Node2D

var Projectile = preload("res://scenes/Obstacle.tscn")
var shooting = false
var rotationspeed = 0

var bulletamount = 0
var spawnlocation = Vector2(0,0)
var playerPosition = Vector2(0,0)
var playerVector
var playerVectorLength
var top_bottom

var pattern = 6#randi() % 6

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
	pattern = 6#randi() % 7

func _on_helptimer_timeout():
	bulletamount = 0

func _on_EnemyShootTimer_timeout():
	if shooting:
		if pattern == 0:
			patternone()
		elif pattern == 1:
			patterntwo()
		elif pattern == 2:
			patternthree()
		elif pattern == 3:
			patternfour()
		elif pattern == 4:
			patternfive()
		elif pattern == 5:
			patterndead()	
		elif pattern == 6:
			patternwall()	



func patternone():
	rotationspeed = 0.1
	rotate(rotationspeed)
	$EnemyShootTimer.set_wait_time(0.15)
	
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


func patterntwo():
	rotationspeed = 0.4
	rotate(rotationspeed)
	$EnemyShootTimer.set_wait_time(0.01)

	var projectile = Projectile.instance()
	projectile.velocity = Vector2(sin(get_rotation()), cos(get_rotation())) * global.projectilespeedmultiplier
	projectile.set_position(Vector2(74,0))
	get_parent().add_child(projectile)

func patternthree():
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

func patternfour():
	rotationspeed = 0
	$EnemyShootTimer.set_wait_time(0.1)
	$helptimer.set_wait_time(1.25)
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
		projectile.acceleration = 1.07
		get_parent().add_child(projectile)
		
		var projectile2 = Projectile.instance()
		projectile2.velocity = Vector2(0,-0.1)
		projectile2.set_position(spawnlocation)
		projectile2.acceleration = 1.07
		get_parent().add_child(projectile2)
		
		var projectile3 = Projectile.instance()
		projectile3.velocity = Vector2(0.1,0)
		projectile3.set_position(spawnlocation)
		projectile3.acceleration = 1.07
		get_parent().add_child(projectile3)
		
		var projectile4 = Projectile.instance()
		projectile4.velocity = Vector2(-0.1,0)
		projectile4.set_position(spawnlocation)
		projectile4.acceleration =1.07
		get_parent().add_child(projectile4)


func patternfive():
	$helptimer.set_wait_time(0.5)
	if bulletamount == 0:
		playerVector = Vector2(global.playerPosition.x - 74, global.playerPosition.y + global.playerVelocity.y *5)
		playerVectorLength = sqrt(playerVector.x * playerVector.x + playerVector.y * playerVector.y)
	bulletamount += 1
	if bulletamount < 10:
		rotationspeed = 0
		rotate(rotationspeed)
		$EnemyShootTimer.set_wait_time(0.025)
		var projectile = Projectile.instance()
		projectile.acceleration = 1.02
		projectile.set_position(Vector2(74,0))
		projectile.velocity = Vector2(playerVector.x / playerVectorLength , playerVector.y / playerVectorLength )
		get_parent().add_child(projectile)

func patterndead():
	var projectile = Projectile.instance()
	projectile.set_position(Vector2(74,global.playerPosition.y))
	get_parent().add_child(projectile)

func patternwall():
	var projectile_array_right = []
	var projectile_array_left = []
	$EnemyShootTimer.set_wait_time(0.1)
	if(bulletamount < 7):
		for i in range(5):
			projectile_array_right.append(Projectile.instance()) #Hinzufügen in Array
			projectile_array_right[i].velocity = Vector2(-2,0)
			projectile_array_right[i].set_position(Vector2(74, -41+i*20+10-randi()%5))#-41 ist oben
			get_parent().add_child(projectile_array_right[i])
		for i in range(5):
			projectile_array_left.append(Projectile.instance())
			projectile_array_left[i].velocity = Vector2(2,0)
			projectile_array_left[i].set_position(Vector2(-74, -41+i*20+5-randi()%5))
			get_parent().add_child(projectile_array_left[i])
		bulletamount += 1


#patternidea:
#spawn bullets around player
#bullets shoot outwards, slowing down, and returning eventually
#harder to implement tho :/