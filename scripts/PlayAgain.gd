extends Button

onready var manager = get_node("/root/Manager")

func _on_PlayAgain_pressed():
	manager.new_game()
