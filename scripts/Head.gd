extends KinematicBody2D

var velocity = Vector2(0, 0)
var direction = Vector2().angle()
const SPEED = 100

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		direction = velocity.angle()
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		direction = velocity.angle()
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
		direction = velocity.angle()
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		direction = velocity.angle()
	velocity = velocity.normalized() * SPEED

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	
	set_rotation(direction)
