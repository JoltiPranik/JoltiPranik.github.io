extends CharacterBody2D
@onready var attack = preload("res://Scene/Player_Attack.tscn")
var speed = 500
var  trigger = false
var health = 100

func _process(delta: float) -> void:
	var direction = Vector2.ZERO
	if velocity != Vector2.ZERO:
		trigger = true
		$AnimatedSprite2D.play("Walk")
	else:
		trigger = false
		$AnimatedSprite2D.stop()
	
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
	if health <= 0:
		queue_free()
		
	if Input.is_action_pressed("ui_accept") and trigger == true:
		var udar = attack.instantiate()
		udar.global_position = direction + direction
		add_child(udar)
		await get_tree().create_timer(0.05).timeout
		udar.free()
func damage(input_damage: int):
	health -= input_damage
