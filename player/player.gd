class_name Player
extends Node2D

signal attacked(attack:AttackState)

@onready var state_machine: Node = $StateMachine

func _ready() -> void:
  Game.player = self
  EventBus.combo_failed.connect(_on_combo_failed)
  
func _on_combo_failed() -> void:
  state_machine.transition_to("Hurt")
