extends Control
class_name GameOver

onready var manager: Node = get_node("/root/Manager")

func _process(_delta) -> void:
	if Input.is_action_pressed("ui_accept"):
		manager.new_game()