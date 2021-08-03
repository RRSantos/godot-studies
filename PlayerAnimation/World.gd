extends Node2D


onready var mushroomCollisionArea = $Mushroom/CollisionArea
onready var player = $Player
onready var waterCollisionArea = $TileMap/WaterCollision


func _ready() -> void:
	mushroomCollisionArea.connect("body_entered", self, "_on_enemy_collision")
	waterCollisionArea.connect("body_entered", self, "_on_enemy_collision")

func _on_enemy_collision(body):
	player.die()

