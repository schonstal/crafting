extends Node

var input_buffer:Array[Array] = []
var command_actions:Array[String] = ["up","down","left","right","strike","heavy_strike"]
var buffer_max_length = 30

func _ready() -> void:
  pass

func _process(delta:float) -> void:
  var pressed:Array[String] = []
  for action in command_actions:
    if Input.is_action_pressed(action):
      pressed.push_back(action)

  input_buffer.push_front(pressed)
  if input_buffer.size() > buffer_max_length:
    input_buffer.pop_back()
