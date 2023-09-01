class_name Player
extends Node2D

signal attacked(attack:AttackState)

func _ready() -> void:
  Game.player = self
