extends Node

const tail = preload("res://scenes/Tail.tscn")
var speed  = 80
var score = 3
const speed_increment = 3
	
func _on_Collectable_collected(value):
	score += value
	add_tail()

func add_tail():
	var new_tail = tail.instance()
	var last_tail = get_child(get_child_count() - 1)
	var offset = Vector2(cos(last_tail.rotation + PI), sin(last_tail.rotation + PI)) * 32
	new_tail.position = last_tail.position + offset
	speed += speed_increment
	call_deferred("add_child", new_tail)

func tail_hit():
	score -= 1
	if speed >= 80:
		speed -= speed_increment
