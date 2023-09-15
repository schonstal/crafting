extends AttackState

@onready var piston_animation: AnimationPlayer = %PistonAnimation

func enter(msg := {}) -> void:
  piston_animation.play("Activate")
  super.enter(msg)
