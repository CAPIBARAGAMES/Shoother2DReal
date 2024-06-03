extends Node2D

const SPEED = 60
@onready var explosion: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match  explosion:
		false: global_position.x -= SPEED * delta


func explosion_ctrl() -> void:
	explosion = true
	$Area2D.queue_free()
	$Explosion.play("Explosion")
	$Explosion/Audio.play()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

	

func _on_area_2d_body_entered(body) -> void:
	if body is Player:
		explosion_ctrl()
		body.queue_free()
		GLOBAL.credits -= 1
		print(GLOBAL.credits)

	if GLOBAL.credits <= 0:
		get_tree().change_scene_to_file("res://scenes/gameover.tscn")
		
func _on_area_2d_area_entered(area):
	if area.is_in_group("shot"):
		explosion_ctrl()
		GLOBAL.score += 100
		print(GLOBAL.score)








func _on_audio_finished() -> void:
	queue_free()
	


