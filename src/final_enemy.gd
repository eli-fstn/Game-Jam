extends CharacterBody2D

const speed: float = 150
var target = null
var last_direction = Vector2.DOWN
var stop_distance = 30

@onready var final_enemy = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if target:
		_attack(delta)
	else:
		velocity = Vector2.ZERO
	move_and_slide()

func _attack(delta: float) -> void:
	var distance = global_position.distance_to(target.global_position)
	var direction = global_position.direction_to(target.global_position)

	if distance > stop_distance:
		velocity = direction * speed
		if direction != Vector2.ZERO:
			last_direction = direction
			play_animation("walk", last_direction)
	else:
		velocity = Vector2.ZERO
		play_animation("idle", last_direction)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		target = body

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		target = null
		play_animation("walk", last_direction)

func play_animation(prefix: String, dir: Vector2) -> void:
	if abs(dir.x) > abs(dir.y):
		final_enemy.flip_h = dir.x > 0
		final_enemy.play(prefix + "_left")
	else:
		if dir.y > 0:
			final_enemy.play(prefix + "_front")
		else:
			final_enemy.play(prefix + "_back")
