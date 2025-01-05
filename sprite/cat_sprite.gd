extends CharacterBody2D

@export var speed: float = 400  # Movement speed
@export var gravity: float = 600  # Increased gravity for a more realistic fall
@export var jump_force: float = -500  # Increased jump force for a higher jump

func _physics_process(delta: float) -> void:
	# Reset horizontal velocity
	velocity.x = 0
	
	# Handle left and right movement
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed
		if is_on_floor():
			$AnimatedSprite2D.play("walk")
		$AnimatedSprite2D.flip_h = true  # Face right
	elif Input.is_action_pressed("ui_left"):
		velocity.x -= speed
		if is_on_floor():
			$AnimatedSprite2D.play("walk")
		$AnimatedSprite2D.flip_h = false  # Face left
	elif is_on_floor():
		$AnimatedSprite2D.play("idle")
	
	# Handle jumping
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y = jump_force
		$AnimatedSprite2D.play("jump")
	
	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta
		$AnimatedSprite2D.play("jump")
	
	# Use the built-in velocity with move_and_slide()
	move_and_slide()
	
	# Handle interactions
	if Input.is_action_just_pressed("meow"):
		meow()
	if Input.is_action_just_pressed("nudge"):
		nudge()
	if Input.is_action_just_pressed("paw"):
		paw()

func meow():
	print("Meow!")
	$AnimatedSprite2D.play("meow")

func nudge():
	print("Nudge!")
	$AnimatedSprite2D.play("nudge")
	velocity.x += 50 if $AnimatedSprite2D.flip_h else -50

func paw():
	print("Paw!")
	$AnimatedSprite2D.play("paw") # paw animation 
	# Check for interactable objects and perform interactions 
	var area = get_node("Area2D")
	for body in area.get_overlapping_bodies():
		if body.has_method("on_paw_interaction"):
			body.on_paw_interaction()
