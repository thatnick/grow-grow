extends Node

func _physics_process(delta):
	pass
	
func _on_Collectable_collected(value):
	add_tail()

func add_tail():
	print("added tail")
	
