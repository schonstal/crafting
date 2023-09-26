extends AttackState

func attack() -> void:
  EventBus.shake.emit(shake_strength, shake_duration)
  # This is a bad way to do it, but out of time
  EventBus.bellows_pressed.emit()
