extends KinematicBody2D

var speed = 50
var velocity
var dir

func _ready():
	dir += rand_range(-PI / 4, PI / 4)
	rotation = dir
	velocity = Vector2(speed, -1).rotated(dir)

func _physics_process(delta):
	rotation = velocity.angle()
	var collision = move_and_collide(velocity * delta)

	if collision && collision.collider.has_method("hit"):
		queue_free()
		collision.collider.hit()
		return

	if collision:
		velocity = velocity.bounce(collision.normal)
	
