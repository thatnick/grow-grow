extends Node

onready var manager = get_node("/root/Manager")
const NUM_ENEMIES = 5
const background_size = Vector2(1072, 603)
const collectable = preload("res://scenes/Collectable.tscn")
const enemy1 = preload("res://scenes/Enemy1.tscn")
const enemy2 = preload("res://scenes/Enemy2.tscn")
const enemy3 = preload("res://scenes/Enemy3.tscn")

func _ready():
	spawn_collectable()
	for i in NUM_ENEMIES:
		if manager.lvl >= 1:
			spawn_enemy(enemy1)
		if manager.lvl >= 2:
			spawn_enemy(enemy2)
		if manager.lvl >= 3:
			spawn_enemy(enemy3)
	
	$EnemyTimer.start(10)
	$EnemyTimer.connect("timeout", self, "_on_EnemyTimer_timeout")

func _on_Collectable_collected(_value):
	spawn_collectable()

func _on_EnemyTimer_timeout():
	for i in manager.lvl * 2:
		if manager.lvl >= 1:
			spawn_enemy(enemy1)
		if manager.lvl >= 2:
			spawn_enemy(enemy2)
		if manager.lvl >= 3:
			spawn_enemy(enemy3)

func spawn_collectable():
	var new_collectable = collectable.instance()
	new_collectable.connect("collected", self, "_on_Collectable_collected")
	new_collectable.connect("collected", $Player, "_on_Collectable_collected")
	new_collectable.position = get_rand_pos()
	call_deferred("add_child", new_collectable)

func spawn_enemy(type):
	$EnemyPath/EnemySpawnLocation.offset = randi()
	var new_enemy = type.instance()
	var direction = $EnemyPath/EnemySpawnLocation.rotation + PI / 2
	new_enemy.position = $EnemyPath/EnemySpawnLocation.position
	new_enemy.dir = direction
	add_child(new_enemy)
	if new_enemy.has_method("set_player"):
		new_enemy.set_player($Player/Tail1)
		#new_enemy.dir = new_enemy.position.angle_to($Player/Head.position)	
	
func get_rand_pos():
	return Vector2(
		manager.rng.randi_range(32, background_size.x - 32),
		manager.rng.randi_range(32, background_size.y - 32)
	)
