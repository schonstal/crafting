# meta-name: Empty state machine state
# meta-description: A state with empty method stubs
# meta-default: true
# meta-space-indent: 2

extends State

# Basic state.
# _parent function calls should only be used if this is a sub state

func _unhandled_input(event:InputEvent) -> void:
  pass
  #_parent._unhandled_input(event)

func _physics_process(delta:float) -> void:
  pass
  #_parent._physics_process(delta)

func _process(delta:float) -> void:
  pass
  #_parent._process(delta)

func enter(msg:Dictionary = {}) -> void:
  pass
  #_parent.enter(msg)

func exit() -> void:
  pass
  #_parent.exit()
