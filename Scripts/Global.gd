extends Node2D

var score = 0

func _ready():
	pass

func increaseScore():
	score += 1

func getScore():
	return score
