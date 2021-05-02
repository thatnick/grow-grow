extends KinematicBody2D

const GAP = 32
var moving = false

func _ready():
	var next_child_up = get_parent().get_child(get_position_in_parent() - 1)
	var direction = position.direction_to(next_child_up.position)
	
	set_rotation(direction.angle())

func _physics_process(_delta):
	var next_child_up = get_parent().get_child(get_position_in_parent() - 1)
	var dist_to_parent = position.distance_to(next_child_up.position)
	var direction = position.direction_to(next_child_up.position)
	
	if dist_to_parent > GAP:
		var velocity = direction.normalized()
		var speed_multiplier = dist_to_parent - GAP if dist_to_parent - GAP >= 1 else 1 
		
		set_rotation(direction.angle())
		velocity = move_and_slide(velocity * (get_parent().speed * speed_multiplier))
		

	set_moving()
	set_moving_anim()

	
func hit():
	var player = get_parent()
	
	for i in range(player.get_children().size() -1, -1, -1):
		if player.get_child(i) == player.get_child(get_position_in_parent() - 1):
			return
		else:
			player.tail_hit()
			player.get_child(i).queue_free()
	

func set_moving():
	moving = get_parent().moving
	
func set_moving_anim():
	if not moving && $AnimatedSprite.get_animation() != "Idle":
		#switch to idle animation
		$AnimatedSprite.set_animation("Idle")
	if moving && $AnimatedSprite.get_animation() != "Walking":
		#switch to the Walking animation
		$AnimatedSprite.set_animation("Walking")
