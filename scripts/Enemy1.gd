extends KinematicBody2D

var speed = 100
var velocity
var dir

func _ready():
	velocity = Vector2(speed, -1).rotated(dir)

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)

	if collision && collision.collider.has_method("hit"):
		queue_free()
		collision.collider.hit()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
