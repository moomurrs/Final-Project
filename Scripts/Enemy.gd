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
	velocity.x = SPEED * direction
	
	velocity.y += GRAVITY
	rotate(delta)
	
	velocity = move_and_slide(velocity, FLOOR)
	
	if is_on_wall():
		direction *= -1
