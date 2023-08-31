class_name AttackState
extends SubState

@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var input_handler: InputHandler = %InputHandler

var attack_name : String :
  get:
    return "%s/%s" % [get_parent().name, name]
    
@export var big_sparks := true
@export var delay_frames := 8

func enter(msg:Dictionary = {}) -> void:
  var animation = "%s.%s" % [get_parent().name, name]
  animation_player.stop()
  animation_player.play(animation)
  animation_player.animation_finished.connect(attack_complete)
  _parent.enter(msg)

func exit() -> void:
  animation_player.animation_finished.disconnect(attack_complete)
  _parent.exit()

func attack_complete(_name:String) -> void:
  _state_machine.transition_to(input_handler.input_intent)

func attack():
  owner.attacked.emit(self)
