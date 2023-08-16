# meta-name: Empty nested state machine state
# meta-description: A state with methods that call parent methods
# meta-default: true
# meta-space-indent: 2

extends State

# Basic state.
# _parent function calls should only be used if this is a sub state

func _unhandled_input(event:InputEvent) -> void:
  _parent._unhandled_input(event)

func _physics_process(delta:float) -> void:
  _parent._physics_process(delta)

func _process(delta:float) -> void:
  _parent._physics_process(delta)

func enter(msg:Dictionary = {}) -> void:
  _parent.enter(msg)

func exit() -> void:
  _parent.exit()
