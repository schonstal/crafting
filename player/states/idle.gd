extends State

@onready var animation_player:AnimationPlayer = %AnimationPlayer


func _unhandled_input(event:InputEvent) -> void:
  pass

func _physics_process(delta:float) -> void:
  pass

func _process(delta:float) -> void:
  pass

func enter(msg:Dictionary = {}) -> void:
  animation_player.play("Idle")

func exit() -> void:
  pass
