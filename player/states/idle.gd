extends State

@onready var animation_player:AnimationPlayer = %AnimationPlayer

func _process(delta: float) -> void:
  var direction = "Neutral"
  if Input.get_axis("down", "up") > 0:
    _state_machine.transition_to("Idle/Up")
  elif Input.get_axis("down", "up") < 0:
    _state_machine.transition_to("Idle/Down")
  elif Input.get_axis("left", "right") < 0:
    _state_machine.transition_to("Idle/Left")
  elif Input.get_axis("left", "right") > 0:
    _state_machine.transition_to("Idle/Right")
  else:
    _state_machine.transition_to("Idle")

func enter(msg:Dictionary = {}) -> void:
  animation_player.play("Idle")
