extends Node

var points = 0 setget add_points
const filepath = "res://data/safegame.data"

var damagemultiplier = 1
var health = 100

func _ready():
	load_safegame()


func load_safegame():
	var file = File.new()
	if not file.file_exists(filepath): return
	file.open(filepath, File.READ)
	points = file.get_var(points)
	damagemultiplier = file.get_var(damagemultiplier)
	health = file.get_var(health)
	file.close()
	
func save_safegame():
	var file = File.new()
	file.open(filepath, file.WRITE)
	file.store_var(points)
	file.store_var(damagemultiplier)
	file.store_var(health)
	file.close()
	
func add_points(newpoints):
	points += newpoints
	save_safegame()

func doubledamage():
	damagemultiplier = damagemultiplier *2
	save_safegame()

func addhealth():
	health += 10
	save_safegame()
	print(health)