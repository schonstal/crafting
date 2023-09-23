class_name Clock
extends Resource

signal time_up
signal time_increased
signal time_decreased

@export var active_timer: Timer :
  set(timer):
    if active_timer != null:
      active_timer.timeout.disconnect(_on_timeout)
    active_timer = timer
    timer.timeout.connect(_on_timeout)

var time_left: float :
  get:
    return active_timer.time_left
  
func add_time(amount: float):
  active_timer.start(ceil(active_timer.time_left) + amount - 0.001)
  if amount > 0:
    time_increased.emit()
  elif amount < 0:
    time_decreased.emit()
  
func _on_timeout() -> void:
  time_up.emit()
