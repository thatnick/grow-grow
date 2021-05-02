extends KinematicBody2D

var velocity = Vector2()
var direction = Vector2().angle()

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
	
	velocity = velocity.normalized() * get_parent().speed

func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)
	
	set_rotation(direction)

func hit():
	get_tree().change_scene("res://scenes/GameOver.tscn")
