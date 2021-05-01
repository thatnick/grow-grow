extends KinematicBody2D

var velocity = Vector2(0, 0)
const SPEED = 60

func _physics_process(delta):
	velocity.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	velocity = move_and_slide(velocity.normalized() * SPEED)


