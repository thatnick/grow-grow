extends Node

const STARTING_TAILS = 3
const GOAL = 10
const LVLTOTAL = 3
const MUSIC_PLAYER = preload("res://scenes/MusicPlayer.tscn")

var IntroMusic: Resource = load("res://music/Intro.mp3")
var Music: Resource = load("res://music/Level.mp3")
var Congrat: Resource = load("res://music/Win.mp3")
var GameOver: Resource = load("res://music/GameOver.mp3")

var tails: int = 0
var music_player
onready var rng: RandomNumberGenerator = RandomNumberGenerator.new()

var lvl: int = 1

func _ready() -> void:
	rng = RandomNumberGenerator.new()
	rng.randomize()
	randomize()
	
	music_player = MUSIC_PLAYER.instance()
	add_child(music_player)
	music_player.set_stream(IntroMusic) 
	music_player.play()

func _physics_process(_delta) -> void:
	if tails >= GOAL:
		win()

func game_over() -> void:
	reset()
	get_tree().change_scene("res://scenes/GameOver.tscn")
	music_player.set_stream(GameOver) 
	music_player.play()

func new_game() -> void:
	reset()
	lvl = 1
	get_tree().change_scene("res://scenes/NewStage.tscn")
	music_player.set_stream(Music) 
	music_player.play()
	
func reset() -> void:
	tails = 0

func win() -> void:
	lvl += 1
	reset()
	if lvl <= LVLTOTAL:
		get_tree().change_scene("res://scenes/NewStage.tscn")
	else:
		get_tree().change_scene("res://scenes/Win.tscn")
		music_player.set_stream(Congrat) 
		music_player.play()
