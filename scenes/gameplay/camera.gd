extends Camera2D

@onready var shaker:Shaker = $Shaker

func _ready() -> void:
  EventBus.shake.connect(_on_shake)
  
func _on_shake(amount:Vector2, duration:float) -> void:
  shaker.shake(amount, duration)
