extends Area2D
class_name Collectable

signal collected

func _on_Collectable_body_entered(head: Head) -> void:
	if head:
		emit_signal("collected")
		queue_free()
		