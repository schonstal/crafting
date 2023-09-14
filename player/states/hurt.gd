extends State

@onready var animation_player: AnimationPlayer = %AnimationPlayer

func enter(msg := {}) -> void:
  animation_player.animation_finished.connect(_on_animation_finished)
  animation_player.play("Hurt")
  
func exit() -> void:
  animation_player.animation_finished.disconnect(_on_animation_finished)
  
func _on_animation_finished(name: String) -> void:
  _state_machine.transition_to("Idle")
