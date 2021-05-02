extends KinematicBody2D

var speed = 50
var velocity = Vector2()
var dir = Vector2()

func _ready():
	on_spawn()

func _physics_process(delta):
	rotation = velocity.angle()
	var collision = move_and_collide(velocity * delta)

	if collision && collision.collider.has_method("hit"):
		queue_free()
		collision.collider.hit()
		return

	if collision:
		velocity = velocity.bounce(collision.normal)

func _on_VisibilityNotifier2D_screen_entered():
	$CollisionShape2D.disabled = false

func on_spawn():
	$CollisionShape2D.disabled = true
