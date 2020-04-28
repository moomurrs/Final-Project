extends KinematicBody2D

var velocity = Vector2()
const SPEED = 150
const GRAVITY = 20
const JUMP = -400
const FLOOR = Vector2(0, -1)
var onGround = false


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
		if onGround:
			velocity.y = JUMP
			onGround = false
	
	# apply gravity
	velocity.y += GRAVITY
	
	if is_on_floor():
		onGround = true
	else:
		onGround = false
	
	
	# apply movement
	velocity = move_and_slide(velocity, FLOOR)
	
	
