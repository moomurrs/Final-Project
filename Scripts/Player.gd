extends KinematicBody2D

var velocity = Vector2()
const SPEED = 150
const GRAVITY = 20
const JUMP = -400
const FLOOR = Vector2(0, -1)
var onGround = false



func _ready():
	pass


func _physics_process(delta):
	# horizontal movement
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		
		$AnimatedSprite.play("run")
		#$AnimatedSprite.flip_h = true
	else:
		velocity.x = 0
		$AnimatedSprite.play("idle")
	
	if Input.is_action_pressed("ui_up"):
		if onGround:
			velocity.y = JUMP
			onGround = false
			$AnimatedSprite.play("jump")
	
	# apply gravity
	velocity.y += GRAVITY
	
	if is_on_floor():
		onGround = true
	else:
		onGround = false
	
	
	# apply movement
	velocity = move_and_slide(velocity, FLOOR)
	
	
