extends Area2D

signal collected(value)

var value = 1

func _on_Collectable_body_entered(body):
	if body.name == "PhysicHead":
		emit_signal("collected", value)
		queue_free()
