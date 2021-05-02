extends Node

const tail = preload("res://scenes/Tail.tscn")
var speed  = 80
var score = 0
	
func _on_Collectable_collected(value):
	score += value
	add_tail()

func add_tail():
	var new_tail = tail.instance()
	var last_tail = get_child(get_child_count() - 1)
	var offset = Vector2(cos(last_tail.rotation + PI), sin(last_tail.rotation + PI)) * 32
	new_tail.position = last_tail.position + offset
	speed += 3
	call_deferred("add_child", new_tail)
