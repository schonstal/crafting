class_name Ingot
extends Node2D

@export var gradient_texture:GradientTexture1D

@onready var graphic: AnimatedSprite2D = $Graphic
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var active = false

var type := 0 :
  set(value):
    type = value
    graphic.frame = type
    
var temp := 0.0

func _ready() -> void:
  self.type = randi_range(0, 7)
  
func _process(delta: float) -> void:
  if active:
    temp -= delta * 20
  else:
    temp += delta * 10
  temp = clamp(temp, 0, 100)
  graphic.modulate = Color(0.5, 0.5, 0.4, 0) + gradient_texture.gradient.sample(clamp(temp - 5, 0, 90)/100.0)

func heat(amount:float) -> void:
  temp += amount

func appear() -> void:
  animation_player.play("appear")
