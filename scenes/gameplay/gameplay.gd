extends Node2D

@export var clock: Clock

@onready var game_timer: Timer = $GameTimer

func _ready() -> void:
  clock.active_timer = game_timer
  #game_timer.start()
  
  clock.time_up.connect(_on_clock_time_up)
  
  EventBus.combo_succeeded.connect(_on_combo_succeeded)
  EventBus.shift_right.emit()

func _on_combo_succeeded(_combo:Combo) -> void:
  clock.add_time(3)

func _on_clock_time_up() -> void:
  EventBus.game_over.emit()
