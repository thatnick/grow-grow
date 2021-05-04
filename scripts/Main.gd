extends Node
class_name Main

onready var manager: Node = get_node("/root/Manager")
const background_size = Vector2(1072, 603)
const collectable = preload("res://scenes/Collectable.tscn")
const enemy1 = preload("res://scenes/Enemy1.tscn")
const enemy2 = preload("res://scenes/Enemy2.tscn")
const enemy3 = preload("res://scenes/Enemy3.tscn")

func _ready() -> void:
	spawn_collectable()

	if manager.lvl == 1:
		spawn_enemy(enemy1, 6)
	if manager.lvl == 2:
		spawn_enemy(enemy1, 3)
		spawn_enemy(enemy2, 3)
	if manager.lvl == 3:
		spawn_enemy(enemy1, 3)
		spawn_enemy(enemy2, 2)
		spawn_enemy(enemy3, 1)
	
	$EnemyTimer.start(12)
	$EnemyTimer.connect("timeout", self, "_on_EnemyTimer_timeout")

func _on_Collectable_collected() -> void:
	spawn_collectable()

func _on_EnemyTimer_timeout() -> void:
	if manager.lvl == 1:
		spawn_enemy(enemy1, 6)
	elif manager.lvl > 1:
		spawn_enemy(enemy1, 3)
	if manager.lvl >= 2:
		spawn_enemy(enemy2, 1)
	if manager.lvl >= 3:
		spawn_enemy(enemy3, 1)

func spawn_collectable() -> void:
	var new_collectable: Collectable = collectable.instance()
	new_collectable.connect("collected", self, "_on_Collectable_collected")
	new_collectable.connect("collected", $Player, "_on_Collectable_collected")
	new_collectable.position = get_rand_pos()
	call_deferred("add_child", new_collectable)

func spawn_enemy(type: PackedScene, num: int):
	for i in num:
		$EnemyPath/EnemySpawnLocation.offset = randi()
		var new_enemy: Node2D = type.instance()
		var direction: float = $EnemyPath/EnemySpawnLocation.rotation + PI / 2
		new_enemy.position = $EnemyPath/EnemySpawnLocation.position
		new_enemy.dir = direction
		add_child(new_enemy)
		if new_enemy.has_method("set_player"):
			new_enemy.set_player($Player/Head)
	
func get_rand_pos() -> Vector2:
	return Vector2(
		manager.rng.randi_range(32, background_size.x - 32),
		manager.rng.randi_range(32, background_size.y - 32)
	)
