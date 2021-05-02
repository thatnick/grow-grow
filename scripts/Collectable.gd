extends Area2D

signal collected(value)

var value = 1

func _on_Collectable_body_entered(body):
	if body.name == "Head":
		$SoundCollected.play()
		yield($SoundCollected, "finished")
		emit_signal("collected", value)
		queue_free()
