extends KinematicBody2D

var speed = 50
var velocity = Vector2()
var dir = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = Vector2(speed, 0)
	rotation = dir.angle()

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)
		print("Collider name is " + str(collision.collider.name))

func _on_TriggerZone_body_entered(body):
	print("CATERPILLAR ALERT!!!")
