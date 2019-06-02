extends Node2D

var particle = preload("res://scenes/BackgroundParticle.tscn")
var particleList = []

func _ready():
	for i in range(40):
		particleList.append(particle.instance())
		add_child(particleList[i])
	

