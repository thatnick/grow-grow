extends Sprite
class_name Background

onready var manager: Node = get_node("/root/Manager")

export(Array, Texture) var backgrounds: Array

func _ready() -> void:
	texture = backgrounds[manager.rng.randi_range(0, backgrounds.size() - 1)]
