extends Area2D

signal collected(value)

var value = 1

func collected():
	queue_free()


func _on_Collectable_body_entered(body):
	emit_signal("collected", value)
