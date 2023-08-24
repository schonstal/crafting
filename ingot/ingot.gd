class_name Ingot
extends Node2D

@export var gradient_texture:GradientTexture1D

var temp := 0.0

@onready var graphic: Sprite2D = $Graphic
  
func _process(delta: float) -> void:
  temp += delta * 20
  if Input.is_action_just_pressed("next"):
    temp = 0
    
  graphic.modulate = 1.5 * gradient_texture.gradient.sample(clamp(temp - 5, 0, 90)/100.0)

func heat(amount:float) -> void:
  temp += amount
