extends Node2D

@export var clock: Clock

@onready var game_timer: Timer = $GameTimer

func _ready() -> void:
  clock.active_timer = game_timer
  game_timer.start()

func _on_combo_succeeded() -> void:
  pass
  
func _on_combo_failed() -> void:
  pass
