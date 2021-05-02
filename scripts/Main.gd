extends Node

onready var manager = get_node("/root/Manager")
const NUM_ENEMIES = 5
const background_size = Vector2(1072, 603)
const collectable = preload("res://scenes/Collectable.tscn")
const enemy = preload("res://scenes/Enemy.tscn")

func _ready():
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
	$EnemyPath/EnemySpawnLocation.offset = randi()
	var new_enemy = enemy.instance()
	
	var direction = $EnemyPath/EnemySpawnLocation.rotation + PI / 2
	new_enemy.position = $EnemyPath/EnemySpawnLocation.position
	direction += rand_range(-PI / 4, PI / 4)
	new_enemy.rotation = direction
	add_child(new_enemy)
	new_enemy.velocity = Vector2(new_enemy.speed, -1).rotated(direction)
	
func get_rand_pos():
	return Vector2(
		manager.rng.randi_range(32, background_size.x - 32),
		manager.rng.randi_range(32, background_size.y - 32)
	)
