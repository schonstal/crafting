extends Sprite2D

@export var intensity := 2.0
@export var rate := 0.05

var current_intensity := 0.0

func _process(delta: float) -> void:
  current_intensity = lerp(current_intensity, owner.heat, rate)
  modulate = Color(1, 1, 1, 1) * current_intensity * intensity
