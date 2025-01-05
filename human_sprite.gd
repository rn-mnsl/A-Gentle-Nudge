extends CharacterBody2D

@export var speed: float = 200  # Movement speed
var target_position: Vector2 = Vector2()
var is_moving: bool = false

func _ready():
	pass

func _physics_process(delta: float) -> void:
	if is_moving:
		move_towards_target(delta)

func move_towards_target(delta: float) -> void:
	var direction = (target_position - global_position).normalized()
	velocity = direction * speed
	move_and_slide()
	if global_position.distance_to(target_position) < 10:
		is_moving = false
		velocity = Vector2()

func look_at_cat(cat_position: Vector2) -> void:
	if cat_position.x > global_position.x:
		$AnimatedSprite2D.flip_h = false  # Face right
	else:
		$AnimatedSprite2D.flip_h = true  # Face left

func go_to_position(position: Vector2) -> void:
	target_position = position
	is_moving = true

func proceed_to_next_scene() -> void:
	get_tree().change_scene("res://path_to_next_scene.tscn")
