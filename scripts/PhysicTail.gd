extends KinematicBody2D

const SPEED = 20
const GAP = 32

var parent_pos = Vector2()
var pos = Vector2()
var direction = Vector2()
var velocity = Vector2(0,0)


func _physics_process(delta):


	parent_pos = get_parent().get_node("PhysicHead").position
	pos = self.position
	direction = pos.direction_to(parent_pos)


	#if my distance from parent is greater than GAP: change velocity to move me towards parent
	if pos.distance_to(parent_pos) > GAP:
		velocity = direction

	velocity = move_and_slide(velocity * SPEED)
	
	
