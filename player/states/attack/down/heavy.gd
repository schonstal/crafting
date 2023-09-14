extends AttackState

func attack() -> void:
  EventBus.shake.emit(shake_strength, shake_duration)
