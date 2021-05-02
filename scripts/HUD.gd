extends CanvasLayer

var score

func _ready():
	get_score()
	
func _physics_process(_delta):
	get_score()
	
func get_score():
	if get_parent().has_node("Player"):
		score = get_parent().get_node("Player").score
	else:
		score = "##"
	$Score.text = str(score)
