extends KinematicBody2D

const GRAVITY = 10
const SPEED = 60
const FLOOR = Vector2(0, -1)
# 1 is right, 0 is left
var direction = 1
var velocity = Vector2()

func _ready():
	pass

func _physics_process(delta):
	# control the direction of movement
	velocity.x = SPEED * direction
	
	# rotate the virus accordingly
	if	direction == 1:
		#$Sprite.flip_h = false
		rotate(delta)
	else:
		rotate(-delta)
		#$Sprite.flip_h = true
	
	velocity.y += GRAVITY
	
	
	velocity = move_and_slide(velocity, FLOOR)
	
	# flip the direction on wall detection
	if is_on_wall():
		direction *= -1
	
	
		
	
