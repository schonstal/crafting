extends AttackState

func hide_ingot():
  EventBus.hide_ingot.emit()
  
func shift_ingot():
  EventBus.shift_right.emit()
