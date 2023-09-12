extends AttackState

func hide_ingot():
  pass
  
func shift_ingot():
  EventBus.shift_right.emit()
