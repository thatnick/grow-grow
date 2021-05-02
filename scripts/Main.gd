extends Node

const NUM_ENEMIES = 5
const background_size = Vector2(1072, 603)
const collectable = preload("res://scenes/Collectable.tscn")
const enemy = preload("res://scenes/Enemy.tscn")
var rng = RandomNumberGenerator.new()

func _ready():
	randomize()
	rng.randomize()
	
	spawn_collectable()
	for i in NUM_ENEMIES:
		spawn_enemy()
	
	$EnemyTimer.start(10)
	$EnemyTimer.connect("timeout", self, "_on_EnemyTimer_timeout")

func _on_Collectable_collected(_value):
	spawn_collectable()

func _on_EnemyTimer_timeout():
	for i in NUM_ENEMIES:
		spawn_enemy()

func spawn_collectable():
	var new_collectable = collectable.instance()
	new_collectable.connect("collected", self, "_on_Collectable_collected")
	new_collectable.connect("collected", $Player, "_on_Collectable_collected")
	new_collectable.position = get_rand_pos()
	call_deferred("add_child", new_collectable)

func spawn_enemy():
	var new_enemy = enemy.instance()
	new_enemy.position = get_rand_pos()
	add_child(new_enemy)
	
func get_rand_pos():
	return Vector2(
		rng.randi_range(32, background_size.x - 32),
		rng.randi_range(32, background_size.y - 32)
	)
