extends Node

var tail = preload("res://scenes/Tail.tscn")

#ideally we would want to work out the offset to be the radius of the collision shape of the new_tail plus the 0
#const offset = 32


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
	var offset = Vector2(cos(last_tail.rotation + PI), sin(last_tail.rotation +PI)) * 32
	print(offset)
	new_tail.position = last_tail.position + offset
	add_child(new_tail)
