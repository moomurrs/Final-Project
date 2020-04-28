extends KinematicBody2D

var velocity = Vector2()
const SPEED = 250
const GRAVITY = 30
const JUMP = -900
const FLOOR = Vector2(0, -1)
var onGround = false
var isDead = false



func _ready():
	pass


func _physics_process(delta):
	
	if not isDead:
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
		
		# get collision objects
		if get_slide_count() > 0:
			# check what the collisions are
			for i in range(get_slide_count()):
				# if the collision object is Enemey, kill player
				if "Enemy" in get_slide_collision(i).collider.name:
					dead()
# kills the player
func dead():
	isDead = true
	# stop player motion
	velocity = Vector2(0,0)
	# play death sprite
	$AnimatedSprite.play("dead")
	# disable collision
	$CollisionShape2D.set_deferred("disabled", true)
	# wait 1 second before changing to death scene
	$Timer.start()
		


func _on_Timer_timeout():
	# call death screen
	get_tree().change_scene("res://Scenes/Death.tscn")
