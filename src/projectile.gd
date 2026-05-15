extends Area2D

@export var speed := 250.0

var direction := Vector2.ZERO

func _ready():
	rotation = direction.angle()

func _physics_process(delta):
	position += direction * speed * delta
