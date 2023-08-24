class_name Ingot
extends Node2D

var temp := 0.0

func _ready() -> void:
  $Graphic.modulate = Color(1 + randf()*2, 1 + randf(), 1)
  
func _process(delta: float) -> void:
  temp += delta * 20
  if Input.is_action_just_pressed("next"):
    temp = 0

func heat(amount:float) -> void:
  temp += amount
