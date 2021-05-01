extends Node

#const NUM_COLLECTABLES = 20
#var collectable = preload("res://scenes/Collectable.tscn")
#onready var background_extents = $Background/CollisionShape2D.shape.extents
#onready var background_centre = $Background/CollisionShape2D.position
#onready var test = $Background/Sprite.get_rect()
#
#func _ready():
#	randomize()
#	print("rect is " + str(test))
#	for i in NUM_COLLECTABLES:
#		spawn(collectable)
#
#func _on_Collectable_collected(value):
#	spawn(collectable)
#
#func spawn(scene):
#	var new_collectable = scene.instance()
#	var pos_in_extents = Vector2(
#		(randi() % background_extents.x) - (background_extents.x/2) + background_centre.x,
#		(randi() % background_extents.y) - (background_extents.y/2) + background_centre.y
#	)
#
#	new_collectable.position = pos_in_extents
#	add_child(new_collectable)
