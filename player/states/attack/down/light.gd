extends AttackState

@onready var sizzle_sound: AudioStreamPlayer = %SizzleSound

func hide_ingot():
  EventBus.hide_ingot.emit()
  sizzle_sound.play()
  
func shift_ingot():
  EventBus.shift_right.emit()
