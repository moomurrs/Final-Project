extends KinematicBody2D

# 1 is up, -1 is down
var yDirection = 1
const FLOOR = Vector2(0, -1)
const SPEED = 30
var velocity = Vector2(0,0)

func _ready():
	velocity = Vector2(0,SPEED)

func _physics_process(delta):
	
	# bob the TP up and down
	if(is_on_floor()):
		velocity.y = -SPEED
		$Timer.start()
		#print("Reversing")
	
	velocity = move_and_slide(velocity, FLOOR)

# reverse the TP down
func _on_Timer_timeout():
	velocity.y = SPEED
