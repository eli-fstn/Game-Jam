extends CharacterBody2D

@export var max_health := 30

var health := max_health

func take_damage(amount):
	health -= amount
	
	print("Enemy HP: ", health)
	if health <= 0:
		die()
		
func die():
	queue_free()
