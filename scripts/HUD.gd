extends CanvasLayer

onready var manager = get_node("/root/Manager")

func _ready():
	$Tails.text = str(manager.tails)
	
func _physics_process(_delta):
	$Tails.text = str(manager.tails)
