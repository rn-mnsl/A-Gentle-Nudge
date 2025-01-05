extends Node2D

var can_start_game: bool = false

func _ready():
	$Timer.start()  # Start the timer when the scene loads

func _process(delta):
	if can_start_game and Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://Scenes/bedroom.tscn")

func _on_timer_timeout() -> void:
	can_start_game = true  # Enable starting the game after 10 seconds
	$level_start.text = "Press [Space] to Start"
