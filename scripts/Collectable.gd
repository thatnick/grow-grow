extends Area2D

var value = 1

func collected():
	queue_free()


func _on_Collectable_body_entered(body):
	if body.has_method("add_tail"):
		body.add_tail()
