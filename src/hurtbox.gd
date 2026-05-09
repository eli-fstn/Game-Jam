extends Area2D

@export var enemy: CharacterBody2D

func take_damage(amount):
	if enemy:
		enemy.take_damage(amount)
