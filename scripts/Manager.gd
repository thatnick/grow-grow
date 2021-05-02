extends Node

var rng
const TAILS = 3
const GOAL = 10
const LVLTOTAL = 3

var tails = 3

#variables for levels - levels need to know: 
#what level number they are. 
#What their win state is. 
#Their difficulty - e.g. freq, type, num of enemies
var lvl = 1

func _ready():
	rng = RandomNumberGenerator.new()
	rng.randomize()
	randomize()

func _physics_process(delta):
	if tails >= GOAL:
		win()


func game_over():
	reset()
	get_tree().change_scene("res://scenes/GameOver.tscn")
	

func new_game():
	reset()
	lvl = 1
	get_tree().change_scene("res://scenes/Main.tscn")
	
func reset():
	tails = TAILS

func win():
	lvl += 1
	reset()
	if lvl < LVLTOTAL:
		get_tree().change_scene("res://scenes/Main.tscn")
	else:
		get_tree().change_scene("res://scenes/Win.tscn")
