extends Node

var tail = preload("res://scenes/Tail.tscn")

const SPEED_FACTOR = 50
var speed  = 0
var score = 0


func _ready():
	_update_speed()

func _physics_process(delta):
	_update_speed()
	
	
func _on_Collectable_collected(value):
	print("collected thing with value: " + str(value))
	score += value
	add_tail()

func add_tail():
	var new_tail = tail.instance()
	var last_tail = get_child(get_child_count() - 1)
	var offset = Vector2(cos(last_tail.rotation + PI), sin(last_tail.rotation + PI)) * 32
	new_tail.position = last_tail.position + offset
	add_child(new_tail)

func _update_speed():
	speed = self.get_child_count() * SPEED_FACTOR
