extends Sprite

onready var manager = get_node("/root/Manager")

export(Array, Texture) var backgrounds

func _ready():
	texture = backgrounds[manager.rng.randi_range(0, backgrounds.size() - 1)]
