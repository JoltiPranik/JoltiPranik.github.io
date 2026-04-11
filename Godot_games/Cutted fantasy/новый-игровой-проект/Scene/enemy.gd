extends CharacterBody2D
@onready var Player = $"../Player"
var speed = 100
var trigger_move = false

func _process(delta: float) -> void:
	var direction = (Player.position - self.position).normalized()
	if trigger_move == true:
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO
	set_velocity(velocity)
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == 'Player':
		trigger_move = true
