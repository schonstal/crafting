class_name Player
extends Node2D

@onready var state_machine: Node = $StateMachine

var health := 3.0 :
  set(value):
    health = value
    health_changed.emit(health)

signal attacked(attack:AttackState)
signal health_changed(new_health: float)

func _ready() -> void:
  EventBus.combo_failed.connect(_on_combo_failed)
  EventBus.game_over.connect(_on_game_over)
  
func _on_combo_failed(combo:Combo) -> void:
  state_machine.transition_to("Hurt")
  health -= 1.0

func _on_game_over() -> void:
  state_machine.transition_to("GameOver")
