extends Node2D

@export var bright_color:Color
@export var dark_color:Color
@export var interval := 0.2

var alpha := 1.0

var bright := false
var time := 0.0

func appear() -> void:
  alpha = 1.0
  var t := get_tree().create_tween()
  t.tween_property(self, "position", position + Vector2(0, 100), 1.0)
  t.tween_property(self, "alpha", 0.0, 1.0)
  t.set_parallel()
  t.set_ease(Tween.EASE_OUT)
  t.set_trans(Tween.TRANS_CUBIC)
  
func _process(delta: float) -> void:
  time -= delta  
  if time > 0:
    return

  bright = !bright
  if bright:
    modulate = bright_color
  else:
    modulate = dark_color
    
  modulate.a = alpha
  time = interval
