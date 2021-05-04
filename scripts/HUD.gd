extends CanvasLayer
class_name HUD

onready var manager: Node = get_node("/root/Manager")

func _ready() -> void:
	$Tails.text = str(manager.tails)
	$Goal.text = str(manager.GOAL)
	$LvlNum.text = str(manager.lvl)
	$LvlTotal.text = str(manager.LVLTOTAL)
	
	
func _physics_process(_delta) -> void:
	$Tails.text = str(manager.tails)
	$LvlNum.text = str(manager.lvl)
