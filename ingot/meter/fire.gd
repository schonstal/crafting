extends Sprite2D

func _ready() -> void:
  material = material.duplicate()
  visibility_changed.connect(_on_visibility_changed)

func _on_visibility_changed() -> void:
  if !visible:
    return
  var tween := create_tween()
  tween.tween_method(set_outer_threshold, 0.5, 0.075, 0.5)\
       .set_trans(Tween.TRANS_QUAD)\
       .set_ease(Tween.EASE_OUT)

func set_outer_threshold(value:float) -> void:
  print(value)
  material.set_shader_parameter("outer_threshold", value)
