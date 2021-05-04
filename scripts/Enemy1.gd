extends KinematicBody2D
class_name Enemy1

const SPEED = 100
var velocity: Vector2
var dir: float

func _ready():
	velocity = Vector2(SPEED, -1).rotated(dir)

func _physics_process(delta) -> void:
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)

	if collision && collision.collider.has_method("hit"):
		queue_free()
		collision.collider.hit()

func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
