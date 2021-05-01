extends KinematicBody2D

const GAP = 32

var parent_pos = Vector2()
var pos = Vector2()
var direction = Vector2()
var velocity = Vector2(0,0)

func _physics_process(delta):
	var parent = get_parent().get_child(self.get_position_in_parent() - 1)
	#get the child before me and make its position my parent's postion
	parent_pos = parent.position 
	
	pos = position
	direction = pos.direction_to(parent_pos)

	var dist_to_parent = pos.distance_to(parent_pos)
	#if my distance from parent is greater than GAP: change velocity to move me towards parent
	if dist_to_parent > GAP:
		velocity = direction.normalized()
		set_rotation(direction.angle())
		var speed_multiplier = dist_to_parent - GAP if dist_to_parent - GAP >= 1 else 1 
		print("multi " + str(speed_multiplier))
		velocity = move_and_slide(velocity * (get_parent().speed * speed_multiplier))
	
func hit():
	queue_free()
