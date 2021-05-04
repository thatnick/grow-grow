extends Control
class_name NewStage

const PAUSE = 2

func _ready() -> void:
	yield(get_tree().create_timer(PAUSE), "timeout")
	loadlvl()

func loadlvl() -> void:
	get_tree().change_scene("res://scenes/Main.tscn")
