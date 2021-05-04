extends KinematicBody2D
class_name Enemy3

var speed = 20
var velocity: Vector2
var dir: float
var player: Node2D

func _physics_process(_delta) -> void:
	velocity = Vector2(speed, -1).rotated(dir)
	velocity = position.direction_to(player.global_position)
	var collision = move_and_collide(velocity)

	if collision && collision.collider.has_method("hit"):
		queue_free()
		collision.collider.hit()
		return

	if collision:
		velocity = velocity.bounce(collision.normal)
	
func set_player(head: Head) -> void:
	player = head
