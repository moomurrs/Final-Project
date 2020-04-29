extends CanvasLayer


func _ready():
	pass


func _on_Player_scoreUpdate():
	var score = get_node("/root/Global").getScore()
	$Label.text = "Toilet Paper: " + str(score)
