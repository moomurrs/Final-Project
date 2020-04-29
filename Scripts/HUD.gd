extends CanvasLayer


func _ready():
	var score = get_node("/root/Global").getScore()
	$Label.text = "Toilet Paper: " + str(score)

func _on_Player_scoreUpdate():
	get_node("/root/Global").increaseScore()
	
	
	var score = get_node("/root/Global").getScore()
	$Label.text = "Toilet Paper: " + str(score)
