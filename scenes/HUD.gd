extends CanvasLayer

var score

func _ready():
	_get_score()
	
	
func _physics_process(delta):
	_get_score()
	
func _get_score():
	if get_parent().has_node("Player"):
		score = get_parent().get_node("Player").score
	else:
		score = "##"
	$Score.text = str(score)
