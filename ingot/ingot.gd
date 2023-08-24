class_name Ingot
extends Node2D

var temp := 70.0

func _ready() -> void:
  $Graphic.modulate = Color(1 + randf()*2, 1 + randf(), 1)

func heat(amount:float) -> void:
  temp += amount
