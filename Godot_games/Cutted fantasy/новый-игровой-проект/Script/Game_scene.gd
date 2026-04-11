extends Node2D

@onready var mob_scene = preload("res://Scene/Enemy.tscn")
func _ready() -> void:
	var map_take = randi_range(1,3)
	match map_take:
			1: $DirtTileOne.visible = true
			2: $GrassTileOne.visible = true
			_: $HellfireTileOne.visible = true

	


func _on_timer_timeout() -> void:
	var mob = mob_scene.instantiate()
	var mob_spawn = $Mobspath/Mobspawnpath
	mob_spawn.progress_ratio = randf()
	mob.position = mob_spawn.position
	add_child(mob)
	
