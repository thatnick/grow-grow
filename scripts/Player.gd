extends Node
class_name Player

const TAIL = preload("res://scenes/Tail.tscn")
const MUSIC_PLAYER = preload("res://scenes/MusicPlayer.tscn")
const SPEED_INCREMENT = 5
const MIN_SPEED = 120

onready var manager: Node = get_node("/root/Manager")
var hit_sound: AudioStream = load("res://sfx/Hit.wav")
var eat_sound: AudioStream = load("res://sfx/Eat.wav")
var death_sound: AudioStream = load("res://sfx/Death.wav")
var speed: int  = MIN_SPEED

func _ready():
	$Head.connect("hit", self, "_on_Head_hit")
	for i in manager.STARTING_TAILS:
		yield(add_tail(), "ready")

func _on_Collectable_collected() -> void:
	play_sound(eat_sound)
	yield($SfxPlayer, "finished")
	add_tail()

func _on_Head_hit() -> void: 
	$Head.alive = false
	play_sound(death_sound)
	yield($SfxPlayer, "finished")
	manager.game_over()

func add_tail() -> Tail:
	var new_tail = TAIL.instance()
	var last_tail = get_child(get_child_count() - 1)
	var offset = Vector2(cos(last_tail.rotation + PI), sin(last_tail.rotation + PI)) * 32
	new_tail.position = last_tail.position + offset
	speed += SPEED_INCREMENT
	manager.tails += 1
	$Head.connect("moving", new_tail, "_on_Head_moving")
	$Head.connect("stopped", new_tail, "_on_Head_stopped")
	call_deferred("add_child", new_tail)
	return new_tail

func tail_hit() -> void:
	play_sound(hit_sound)
	yield($SfxPlayer, "finished")
	manager.tails -= 1
	if manager.tails <= 0:
		$Head.alive = false
		play_sound(death_sound)
		yield($SfxPlayer, "finished")
		manager.game_over()
	if speed >= MIN_SPEED:
		speed -= SPEED_INCREMENT
	

func play_sound(sound: AudioStream) -> void:	
	$SfxPlayer.set_stream(sound)
	$SfxPlayer.play()
		