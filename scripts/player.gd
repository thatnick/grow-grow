extends Node

var tail = preload("res://scenes/Tail.tscn")

func _physics_process(delta):
	pass
	
func _on_Collectable_collected(value):
	print("collected thing with value: " + str(value))
	add_tail()

func add_tail():
	print("added tail")
	var new_tail = tail.instance()
	var last_tail = get_child(get_child_count() - 1)
	print(str(last_tail.name))
	# Position of new tail below TODO FIX THIS
	new_tail.position = last_tail.position
	last_tail.add_child(new_tail)
