extends CharacterBody2D

var speed = 500

func _process(delta: float) -> void:
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		direction.x += 10
	if Input.is_action_pressed('ui_left'):
		direction.x -= 10
	if Input.is_action_pressed('ui_up'):
		direction.y -= 10
	if Input.is_action_pressed('ui_down'):
		direction.y += 10

	set_velocity(direction * speed * delta)
	move_and_slide()

	if velocity != Vector2.ZERO:
		$AnimatedSprite2D.play("Walk")
	else:
		$AnimatedSprite2D.stop()
