extends Node2D

@export var heat_decay_rate := 0.05
@export var bellows_amount := 0.5

var heat := 0.0
var tween:Tween

func _ready() -> void:
  EventBus.bellows_pressed.connect(_on_bellows_pressed)
  
func _process(delta: float) -> void:
  heat = clamp(heat - delta * heat_decay_rate, 0, 1)
  
func _on_bellows_pressed() -> void:
  heat = clamp(heat + bellows_amount, 0, 1)
