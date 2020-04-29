extends Node2D

var score = 0

func _ready():
	score = 0

func increaseScore():
	score += 1

func getScore():
	return score
