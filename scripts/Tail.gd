extends KinematicBody2D

const GAP = 1

var parent_pos = Vector2()
var pos = Vector2()
var direction = Vector2()
var speed = 100
var velocity = Vector2(0,0)


func _physics_process(delta):

	#get the child before me and make its position my parent's postion
	parent_pos = get_parent().get_child(self.get_position_in_parent() - 1).position 
	
	pos = self.position
	direction = pos.direction_to(parent_pos)


	#if my distance from parent is greater than GAP: change velocity to move me towards parent
	if pos.distance_to(parent_pos) > GAP:
		velocity = direction
		set_rotation(direction.angle())
	speed = get_parent().speed
	velocity = move_and_slide(velocity * speed)
	
func hit():
	queue_free()
