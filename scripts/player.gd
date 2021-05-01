extends Node

var tail = preload("res://scenes/Tail.tscn")

#const SPEED_FACTOR = 1.1
var speed  = 80
var score = 0

#func _ready():
#	_update_speed()
#
#func _physics_process(delta):
#	_update_speed()
	
	
func _on_Collectable_collected(value):
	score += value
	add_tail()

func add_tail():
	var new_tail = tail.instance()
	var last_tail = get_child(get_child_count() - 1)
	var offset = Vector2(cos(last_tail.rotation + PI), sin(last_tail.rotation + PI)) * 32
	new_tail.position = last_tail.position + offset
	speed += 3
	add_child(new_tail)

#func _update_speed():
#	speed = get_child_count() * SPEED_FACTOR if get_child_count() > 4  else 4 * SPEED_FACTOR
