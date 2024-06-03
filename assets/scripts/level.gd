extends Node2D

@export var enemy : PackedScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GLOBAL.score = 0
	GLOBAL.credits = 1
	print(GLOBAL.credits)
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	Parallax_bg(delta)
	
	
	$PathSpawn/PathFollow2D.set_progress($PathSpawn/PathFollow2D.get_progress() + 80 * delta)


func Parallax_bg(delta_time) -> void:
	get_node("Backgraund/Back").scroll_base_offset -= Vector2(1, 0) * 8 * delta_time
	$Backgraund/Stars.scroll_base_offset -= Vector2(1, 0) * 16 * delta_time
	$Backgraund/Planet_1.scroll_base_offset -= Vector2(1, 0) * 24 * delta_time
	$Backgraund/Planet_2.scroll_base_offset -= Vector2(1, 0) * 24 * delta_time


func _on_timer_timeout():
	var enemy_instance = enemy.instantiate()
	enemy_instance.global_position = $PathSpawn/PathFollow2D.global_position
	add_child(enemy_instance)
	pass # Replace with function body.
