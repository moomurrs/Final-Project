# Game Jam 2020
# Programmer: Murun T
# Team: TP Gang

extends Node2D
var ENEMY = preload("res://Scenes/Enemy.tscn")

func _ready():
	pass


# create a new enemy every few seconds
func _on_EnemyTimer_timeout():
	$Sounds/Sneeze.play()
	var enemy = ENEMY.instance()
	enemy.position.x = $Player.position.x
	enemy.position.y = $Player.position.y - 550
	add_child(enemy)
