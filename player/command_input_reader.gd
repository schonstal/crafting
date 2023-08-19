extends Node

var input_buffer:Array[Array] = []
var command_actions:Array[String] = ["down","up","left","right","strike","heavy_strike"]
var buffer_max_length := 60
var lookahead_frames := 10

func _ready() -> void:
  pass

func _process(delta:float) -> void:
  var actions := read_inputs()
  buffer(actions)
  parse_commands()
  
  
func buffer(actions:Array[String]) -> void:
  input_buffer.push_front(actions)
  if input_buffer.size() > buffer_max_length:
    input_buffer.pop_back()
  
func read_inputs() -> Array[String]:
  var pressed:Array[String] = []
  for action in command_actions:
    if Input.is_action_pressed(action):
      pressed.push_back(action)
  return pressed

func parse_commands():
  var latest_input = input_buffer[0]
  # attempt to parse all commands in priority order
