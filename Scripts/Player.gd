extends KinematicBody2D

var velocity = Vector2()
const SPEED = 60
const GRAVITY = 20
const JUMP = -200
const FLOOR = Vector2(0, -1)



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	# horizontal movement
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
	else:
		velocity.x = 0
	
	if Input.is_action_pressed("ui_up"):
		velocity.y = JUMP
	
	# apply gravity
	velocity.y += GRAVITY
	# apply movement
	move_and_slide(velocity)
