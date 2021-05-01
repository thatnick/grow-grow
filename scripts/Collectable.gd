extends Area2D

signal collected(value)

var value = 1

func _on_Collectable_body_entered(body):
	print(str(body.name))
	emit_signal("collected", value)
	queue_free()
