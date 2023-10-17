extends Control

var score = 0

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var points: Label = $Points

func _ready() -> void:
  EventBus.score_changed.connect(_on_score_changed)
  EventBus.game_started.connect(_on_game_started)

func _on_score_changed(amount: int) -> void:
  animation_player.stop()
  
  if amount > score:
    animation_player.play("Increment")
  else:
    animation_player.play("Decrement")
  
  score = amount
  points.text = string_with_commas(score)

func string_with_commas(value: int) -> String:
  var str_value: String = str(value)
  var loop_end: int = 0 if value > -1 else 1

  for i in range(str_value.length() - 3, loop_end, -3):
    str_value = str_value.insert(i, ",")

  return str_value

func _on_game_started() -> void:
  animation_player.play("Appear")
