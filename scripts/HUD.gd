extends CanvasLayer

onready var manager = get_node("/root/Manager")

func _ready():
	$Tails.text = str(manager.tails)
	$LvlNum.text = str(manager.lvl)
	
func _physics_process(_delta):
	$Tails.text = str(manager.tails)
	$LvlNum.text = str(manager.lvl)
