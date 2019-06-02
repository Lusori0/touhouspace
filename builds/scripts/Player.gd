extends KinematicBody2D

var velocity = Vector2(0,0)
var playerSpeed = global.playerspeed
var bullet = preload("res://scenes/Bullet.tscn")

var widthb = 80
var heightb = 45

var playerHeight
var playerWidth

func _ready():
	widthb = get_viewport_rect().size.x/2
	heightb = get_viewport_rect().size.y/2
	
	playerHeight = int($CollisionShape2D.shape.extents.y)
	playerWidth = int($CollisionShape2D.shape.extents.x)

func _physics_process(delta):
	
	if Input.is_action_pressed("up"):
		velocity.y = -playerSpeed
	elif Input.is_action_pressed("down"):
		velocity.y = playerSpeed
	else:
		velocity.y =  0
	
	if Input.is_action_pressed("right"):
		velocity.x = playerSpeed
	elif Input.is_action_pressed("left"):
		velocity.x = -playerSpeed * 1.5
	else:
		velocity.x = 0
		
	
	move_and_collide(velocity)
	
	
	if position.y < -heightb + playerHeight/2:
		set_position(Vector2(position.x, -heightb + playerHeight/2))
	if position.y > heightb - playerHeight/2:
		set_position(Vector2(position.x, heightb - playerHeight/2))
	if position.x < -widthb + playerWidth/2:
		set_position(Vector2(-widthb + playerWidth/2, position.y))
	if position.x > widthb - playerWidth/2:
		set_position(Vector2(widthb - playerWidth/2, position.y))
		
		
	if Input.is_action_just_pressed("fire"):
		$Timer.start()
		
	if Input.is_action_just_released("fire"):
		$Timer.stop()
		



func _on_Timer_timeout():
	var bulletinstance = bullet.instance()
	get_parent().add_child(bulletinstance)
	bulletinstance.global_position = global_position



