extends Control

var score = 0

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var points: Label = $Points

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
  if Input.is_action_just_pressed("previous"):
    increment(randi_range(5, 20))

func increment(amount: int) -> void:
  score += amount
  points.text = string_with_commas(score)
  animation_player.stop()
  animation_player.play("Increment")

func string_with_commas(value: int) -> String:
  var str_value: String = str(value)
  var loop_end: int = 0 if value > -1 else 1

  for i in range(str_value.length() - 3, loop_end, -3):
    str_value = str_value.insert(i, ",")

  return str_value
