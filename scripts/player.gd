extends Node

onready var manager = get_node("/root/Manager")
const tail = preload("res://scenes/Tail.tscn")
var speed  = 120
var moving = false
const speed_increment = 5
const musicplayer = preload("res://scenes/MusicPlayer.tscn")
	
func _physics_process(delta):
	moving = $Head.moving


func _on_Collectable_collected(value):
	manager.tails += value
	add_tail()

func add_tail():
	var new_tail = tail.instance()
	var last_tail = get_child(get_child_count() - 1)
	var offset = Vector2(cos(last_tail.rotation + PI), sin(last_tail.rotation + PI)) * 32
	new_tail.position = last_tail.position + offset
	speed += speed_increment
	call_deferred("add_child", new_tail)

func tail_hit():
	manager.tails -= 1
	if manager.tails <= 0:
		manager.game_over()
	if speed >= 80:
		speed -= speed_increment
	eek_sfx()

func eek_sfx():
	var sfxplayer = musicplayer.instance()
	var sfx = load("res://sfx/Eek.wav")
	sfxplayer.set_stream(sfx)
	add_child(sfxplayer)
	sfxplayer.play()
	yield(sfxplayer, "finished")
	sfxplayer.queue_free()
