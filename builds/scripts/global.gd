extends Node

var lifetotal
var life
var playerspeed = 0.75
var damage

var backgroundColor

var enemylife = 10000.0
var enemyTotal = 10000.0
var projectilespeedmultiplier = 1.0
var beginningProjectileSpeed = 0.8
var enemyRotationSpeed = 0.4

func _init():
	randomize()
	backgroundColor = Color(randf(),randf(),randf(),1.0)
	VisualServer.set_default_clear_color(backgroundColor * 0.5)

func _ready():
	damage = safegame.damagemultiplier
	lifetotal = safegame.health
	life = lifetotal
	

func _process(delta):
	projectilespeedmultiplier =  (enemyTotal - enemylife)/enemyTotal + beginningProjectileSpeed