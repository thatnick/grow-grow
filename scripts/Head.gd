extends KinematicBody2D

var velocity = Vector2(0, 0)
var direction = Vector2().angle()
var speed = 100

func get_input():
	speed = get_parent().speed
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
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	
	set_rotation(direction)

func hit():
	print("You died?")
