extends KinematicBody2D

var speed = 50
var velocity = Vector2()
var dir = Vector2()

func _ready():
	velocity = Vector2(speed, 0)
	rotation = dir.angle()

func _physics_process(delta):
	rotation = velocity.angle()
	var collision = move_and_collide(velocity * delta)
	
	if collision && collision.collider.has_method("hit"):
		queue_free()
		collision.collider.hit()
		return
	if collision:
		velocity = velocity.bounce(collision.normal)
		print("Collider name is " + str(collision.collider.name))
