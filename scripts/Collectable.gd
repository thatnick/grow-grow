extends Area2D

signal collected

func _on_Collectable_body_entered(body: KinematicBody2D) -> void:
	if body.name == "Head":
		$SoundCollected.play()
		yield($SoundCollected, "finished")
		emit_signal("collected")
		queue_free()
