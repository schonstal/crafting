extends TextureRect

func _ready() -> void:
  # Just a hacky way to make restarting easier
  material = material.duplicate()

func _process(delta: float) -> void:
  pass
