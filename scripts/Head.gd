extends KinematicBody2D

onready var manager = get_node("/root/Manager")
var velocity = Vector2()
var direction = Vector2().angle()
var moving = false



func _physics_process(_delta):
	get_input()
	set_move_anim_sfx()	
	velocity = move_and_slide(velocity)
	set_rotation(direction)
	print("head pos", position)


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
	update_moving()

func hit():
	manager.game_over()

func update_moving():
	if velocity != Vector2(0,0):
		moving = true
	else:
		moving = false
		
func set_move_anim_sfx():
	#set the animation
	if not moving && $AnimatedSprite.get_animation() != "Idle":
		$AnimatedSprite.set_animation("Idle")
	if moving && $AnimatedSprite.get_animation() != "Walking":
		$AnimatedSprite.set_animation("Walking")
	#set the move sound
	if not moving && $SoundMove.is_playing():
		$SoundMove.stop()
	if moving && not $SoundMove.is_playing():
		$SoundMove.play()
	pass
	
