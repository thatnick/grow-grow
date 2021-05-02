extends CanvasLayer

onready var manager = get_node("/root/Manager")

func _ready():
	$Tails.text = str(manager.tails)
	$Goal.text = str(manager.GOAL)
	$LvlNum.text = str(manager.lvl)
	$LvlTotal.text = str(manager.LVLTOTAL)
	
	
func _physics_process(_delta):
	$Tails.text = str(manager.tails)
	$LvlNum.text = str(manager.lvl)
