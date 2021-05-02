extends KinematicBody2D

const GAP = 32

func _ready():
	var next_child_up = get_parent().get_child(self.get_position_in_parent() - 1)
	var direction = position.direction_to(next_child_up.position)
	
	set_rotation(direction.angle())

func _physics_process(delta):
	var next_child_up = get_parent().get_child(self.get_position_in_parent() - 1)
	var dist_to_parent = position.distance_to(next_child_up.position)
	var direction = position.direction_to(next_child_up.position)
	
	if dist_to_parent > GAP:
		var velocity = direction.normalized()
		var speed_multiplier = dist_to_parent - GAP if dist_to_parent - GAP >= 1 else 1 
		
		set_rotation(direction.angle())
		velocity = move_and_slide(velocity * (get_parent().speed * speed_multiplier))
	
func hit():
	queue_free()
