extends Area2D

signal collected(value)

var value = 1

func _on_Collectable_body_entered(body):
	queue_free()
	emit_signal("collected", value)
