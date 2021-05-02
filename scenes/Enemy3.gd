extends KinematicBody2D

var speed = 20
var velocity
var dir
var player

func _physics_process(delta):
	velocity = Vector2(speed, -1).rotated(dir)
	velocity = position.direction_to(player.global_position)
	var collision = move_and_collide(velocity)

	if collision && collision.collider.has_method("hit"):
		queue_free()
		collision.collider.hit()
		return

	if collision:
		velocity = velocity.bounce(collision.normal)
	
func set_player(head):
	player = head
