extends Node

var lifetotal
var life
var playerspeed = 0.75
var damage
var playerPosition = Vector2(0,0)

var backgroundColor
var paused = false

var enemylife = 10000.0
var enemyTotal = 10000.0
var projectilespeedmultiplier = 1.0
var beginningProjectileSpeed = 0.8
var enemyRotationSpeed = 0.4

func _init():
	set_pause_mode(PAUSE_MODE_PROCESS)
	randomize()
	backgroundColor = Color(randf(),randf(),randf(),1.0)
	VisualServer.set_default_clear_color(backgroundColor * 0.5)

func _ready():
	damage = safegame.damagemultiplier
	lifetotal = safegame.health
	life = lifetotal
	

func _process(delta):
	projectilespeedmultiplier =  (enemyTotal - enemylife)/enemyTotal + beginningProjectileSpeed
	if Input.is_action_just_pressed("ui_cancel"):
		paused = !paused
		get_tree().paused = paused