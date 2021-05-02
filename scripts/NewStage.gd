extends Control

var pause = 3

func _ready():
	yield(get_tree().create_timer(pause), "timeout")
	loadlvl()

func loadlvl():
	get_tree().change_scene("res://scenes/Main.tscn")
