extends Node

const NUM_COLLECTABLES = 20
const background_size = Vector2(1280, 1280)
const collectable = preload("res://scenes/Collectable.tscn")
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	for i in NUM_COLLECTABLES:
		spawn(collectable)

func _on_Collectable_collected(value):
	spawn(collectable)

func spawn(scene):
	var new_collectable = scene.instance()
	new_collectable.connect("collected", self, "_on_Collectable_collected")
	new_collectable.connect("collected", $Player, "_on_Collectable_collected")
	new_collectable.position = Vector2(
		rng.randi_range(0, background_size.x),
		rng.randi_range(0, background_size.y)
	)
	add_child(new_collectable)
