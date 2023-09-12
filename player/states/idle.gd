extends State

@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var input_handler: InputHandler = %InputHandler

func enter(msg:Dictionary = {}) -> void:
  animation_player.play("Idle")
  input_handler.intent_changed.connect(_on_input_intent_changed)
  
func exit() -> void:
  input_handler.intent_changed.disconnect(_on_input_intent_changed)

func _unhandled_input(event: InputEvent) -> void:
  if event.is_action_pressed("next"):
    EventBus.shift_right.emit()
  elif event.is_action_pressed("previous"):
    EventBus.shift_left.emit()

func _on_input_intent_changed(intent:String):
  if intent != "Idle":
    _state_machine.transition_to(intent)
