extends CharacterBody2D
@onready var Player = $"../Player"
@onready var attack = preload("res://Scene/Mob_Attack.tscn")
var speed = 25
var trigger_move = false
var attack_trigger = false
var health = 10

func _process(delta: float) -> void:
	var direction = (Player.position - $".".position).normalized()
	if trigger_move == true:
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO
	set_velocity(velocity)
	move_and_slide()
	attack_melee()
	
	if health <= 0:
		queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == 'Player':
		trigger_move = true

func _on_attack_area_body_entered(body: Node2D) -> void:
	if body.name == 'Player':
		attack_trigger = true

func attack_melee():
	if attack_trigger == true:
		var udar = attack.instantiate()
		var deltax = Player.position.x - $".".position.x
		var deltay = Player.position.y - $".".position.y
		var lenght = sqrt(deltax * deltax + deltay * deltay)
		udar.position.x += 25 * deltax / lenght
		udar.position.y += 30 * deltay / lenght
		udar.rotation -= udar.position.angle_to($".".position)
		add_child(udar)
		await get_tree().create_timer(0.05).timeout
		udar.free()

		
func damage(input_damage: int):
	health -= input_damage
