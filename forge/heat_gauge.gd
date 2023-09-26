extends Node2D

@onready var needle: Sprite2D = $Needle
@onready var initial_rotation = needle.rotation
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
  EventBus.bellows_pressed.connect(_on_bellows_pressed)

func _process(delta: float) -> void:
  needle.rotation = owner.heat * PI + initial_rotation
  
func _on_bellows_pressed() -> void:
  animation_player.play("blur")
