extends Node2D

@export var clock: Clock
@export var score_service: ScoreService

@onready var game_timer: Timer = $GameTimer
@onready var ui: Control = $HUD/UI

func _ready() -> void:
  clock.active_timer = game_timer 
  clock.time_up.connect(_on_clock_time_up)
  
  EventBus.combo_succeeded.connect(_on_combo_succeeded)
  EventBus.game_started.connect(_on_game_started)

func _on_combo_succeeded(_combo:Combo) -> void:
  clock.add_time(3)

func _on_clock_time_up() -> void:
  EventBus.game_over.emit()
  
func _on_game_started() -> void:
  clock.active_timer.start()
  EventBus.shift_right.emit()
