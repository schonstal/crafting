extends Node

@export var interval := 0.00
@export var enabled = false

var time := 0.0

@onready var parent:AnimatedSprite2D = get_parent()
@onready var initial_offset = parent.offset

func _process(delta: float) -> void:
  time -= delta
  if enabled && time < 0:
    parent.offset = initial_offset + Vector2(
      randf_range(-2, 2),
      randf_range(0, 0)
    )
    time = interval
