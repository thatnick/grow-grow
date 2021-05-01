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
	var last_tail = get_child(get_child_count()-1)
	print(str(last_tail.name))
	new_tail.transform.origin = last_tail.transform.origin - Vector2(50, 50)
	$PhysicHead.add_child_below_node(last_tail, new_tail)
