extends Node

var timer = 120
#const TIMER_INITAL = 5

#func _ready():
	#timer = TIMER_INITAL

func _physics_process(delta):
#	timer = timer - 1
#	if timer == 0:
#		add_tail()
#		timer = 120
	pass

func add_tail():
	print("added tail")
	pass
