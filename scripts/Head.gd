extends KinematicBody2D
class_name Head

signal moving
signal stopped
signal hit

var velocity: Vector2 = Vector2()
var direction: float = Vector2().angle()
var moving: bool = false
var alive: bool = true
onready var manager: Node = get_node("/root/Manager")

func _physics_process(_delta):
	get_input()
	set_move_anim_sfx()	
	velocity = move_and_slide(velocity)
	set_rotation(direction)

func get_input():
	velocity = Vector2()
	if alive:
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
	if velocity != Vector2.ZERO:
		moving = true
		emit_signal("moving")
	else:
		emit_signal("stopped")

func hit() -> void:
	emit_signal("hit")
		
func set_move_anim_sfx() -> void:
	moving = velocity != Vector2.ZERO
	if not moving && $AnimatedSprite.get_animation() != "Idle":
		$AnimatedSprite.set_animation("Idle")
	if moving && $AnimatedSprite.get_animation() != "Walking":
		$AnimatedSprite.set_animation("Walking")
	if not moving && $SoundMove.is_playing():
		$SoundMove.stop()
	if moving && not $SoundMove.is_playing():
		$SoundMove.play()	

