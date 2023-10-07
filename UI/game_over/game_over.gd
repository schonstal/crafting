extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
  EventBus.game_over.connect(_on_game_over)
  
func _on_game_over() -> void:
  animation_player.play("appear")
