extends GPUParticles2D

func _ready() -> void:
  EventBus.bellows_pressed.connect(_on_bellows_pressed)
  
func _on_bellows_pressed() -> void:
  restart()
