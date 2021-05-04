extends KinematicBody2D
class_name Tail

var velocity: Vector2
var head_moving: bool = false
onready var next_child_up: Node = get_parent().get_child(get_position_in_parent() - 1)

func _ready() -> void:
	var direction: Vector2 = position.direction_to(next_child_up.position)
	set_rotation(direction.angle())

func _physics_process(_delta: float):
	var direction: Vector2 = position.direction_to(next_child_up.position)

	if head_moving:
		velocity = direction.normalized()	
		set_rotation(direction.angle())
	else:
		velocity = Vector2.ZERO
	velocity = move_and_slide(velocity * get_parent().speed)
	set_moving_anim()

func _on_Head_moving():
	head_moving = true

func _on_Head_stopped():
	head_moving = false
	
func hit() -> void:
	var player: Node = get_parent()
	for i in range(player.get_children().size() -1, -1, -1):
		if player.get_child(i) == player.get_child(get_position_in_parent() - 1):
			return
		else:
			player.tail_hit()
			player.get_child(i).queue_free()
	
func set_moving_anim() -> void:
	var moving: bool = velocity != Vector2.ZERO
	var animation = $AnimatedSprite.get_animation()
	if not moving && animation != "Idle":
		$AnimatedSprite.set_animation("Idle")
	if moving && animation != "Walking":
		$AnimatedSprite.set_animation("Walking")
