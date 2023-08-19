class_name Command
extends Resource

@export var animation := "Strike"
@export var input_sequence:Array[String] = ["strike"]
@export var priority := 1
@export var lookahead := 10

func check_input(input_frames) -> bool:
  var sequence := input_sequence.duplicate()
  var next_action = sequence.pop_back()

  if input_frames[-1].find(next_action) == -1:
    return false

  next_action = sequence.pop_back()
  var frames_since_last_input := 0
  for input_frame in input_frames:
    if next_action == null:
      return true

    if frames_since_last_input > lookahead:
      return false

    frames_since_last_input += 1

    if input_frame.find(next_action) > -1:
      next_action = sequence.pop_back()
      frames_since_last_input = 0

  return false
