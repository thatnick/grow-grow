extends KinematicBody2D
class_name Enemy2

const SPEED = 50
var velocity: Vector2
var dir: float

func _ready() -> void:
	dir += rand_range(-PI / 4, PI / 4)
	rotation = dir
	velocity = Vector2(SPEED, -1).rotated(dir)

func _physics_process(delta) -> void:
	rotation = velocity.angle()
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)

	if collision && collision.collider.has_method("hit"):
		queue_free()
		collision.collider.hit()
		return

	if collision:
		velocity = velocity.bounce(collision.normal)
	
