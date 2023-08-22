extends State

@onready var animation_player:AnimationPlayer = %AnimationPlayer

func _process(delta: float) -> void:

  var direction = "Neutral"
  if Input.get_axis("down", "up") > 0:
    direction = "Up"
  elif Input.get_axis("down", "up") < 0:
    direction = "Down"
  elif Input.get_axis("left", "right") < 0:
    direction = "Left"
  elif Input.get_axis("left", "right") > 0:
    direction = "Right"
    
  if Input.is_action_just_pressed("heavy_strike"):
    _state_machine.transition_to("Attack/%s/Heavy" % direction)
  elif Input.is_action_just_pressed("strike"):
    _state_machine.transition_to("Attack/%s/Light" % direction)

func enter(msg:Dictionary = {}) -> void:
  animation_player.play("Idle")
