extends Node

var rng
const TAILS = 3
const GOAL = 10
const LVLTOTAL = 3

var tails = 3

#Set up the musicplayer variables
const musicplayer = preload("res://scenes/MusicPlayer.tscn")
var IntroMusic = load("res://music/Intro.mp3")
var Music = load("res://music/Music.mp3")
var Congrat = load("res://music/Congrat.mp3")
var GameOver = load("res://music/GameOver.mp3")

var music_player



#variables for levels - levels need to know: 
#what level number they are. 
#What their win state is. 
#Their difficulty - e.g. freq, type, num of enemies
var lvl = 1




func _ready():
	rng = RandomNumberGenerator.new()
	rng.randomize()
	randomize()
	
	music_player = musicplayer.instance()
	add_child(music_player)
	music_player.set_stream(IntroMusic) 
	music_player.play()

func _physics_process(delta):
	if tails >= GOAL:
		win()


func game_over():
	reset()
	get_tree().change_scene("res://scenes/GameOver.tscn")
	deathSFX() 
	music_player.set_stream(GameOver) 
	music_player.play()

func new_game():
	reset()
	lvl = 1
	get_tree().change_scene("res://scenes/NewStage.tscn")
	music_player.set_stream(Music) 
	music_player.play()
	
func reset():
	tails = TAILS

func win():
	lvl += 1
	reset()
	if lvl <= LVLTOTAL:
		get_tree().change_scene("res://scenes/NewStage.tscn")
	else:
		get_tree().change_scene("res://scenes/Win.tscn")
		music_player.set_stream(Congrat) 
		music_player.play()
		
		
func deathSFX():
	var sfxplayer = musicplayer.instance()
	var sfx = load("res://sfx/death.wav")
	sfxplayer.set_stream(sfx)
	add_child(sfxplayer)
	sfxplayer.play()
	yield(sfxplayer, "finished")
	sfxplayer.queue_free()
