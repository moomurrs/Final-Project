extends Control


func _ready():
	var score = get_node("/root/Global").getScore()
	$Score.text = "TP Collected: " + str(score)

