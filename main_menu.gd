extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"VBoxContainer/Start Button".grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://opening_scene.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_credit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://credit_scene.tscn")