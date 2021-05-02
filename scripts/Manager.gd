extends Node

const TAILS = 3
const GOAL = 5

var tails = 3

func _physics_process(delta):
	if tails >= GOAL:
		win()


func game_over():
	reset()
	get_tree().change_scene("res://scenes/GameOver.tscn")
	

func new_game():
	reset()
	get_tree().change_scene("res://scenes/Main.tscn")
	
func reset():
	tails = TAILS

func win():
	reset()
	get_tree().change_scene("res://scenes/Win.tscn")
