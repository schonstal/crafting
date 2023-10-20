extends State

@onready var animation_player: AnimationPlayer = %AnimationPlayer

func enter(msg:Dictionary = {}) -> void:
  animation_player.play("Idle")
  EventBus.game_started.connect(_on_game_started)

func _on_game_started():
  _state_machine.transition_to("Idle")
