extends HBoxContainer

@onready var direction: TextureRect = $Direction
@onready var strike: TextureRect = $Strike
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var finished: Sprite2D = %Finished

var assets = {
  "Down": preload("res://UI/combo/ComboArrowDown.png"),
  "Left": preload("res://UI/combo/ComboArrowLeft.png"),
  "Right": preload("res://UI/combo/ComboArrowRight.png"),
  "Up": preload("res://UI/combo/ComboArrowUp.png"),
  "Heavy": preload("res://UI/combo/ComboHeavyButton.png"),
  "Light": preload("res://UI/combo/ComboLightButton.png")
}

var step_name: String = "Neutral/Light"

func _ready() -> void:
  var parts = step_name.split("/")
  if parts[0] == "Neutral":
    direction.visible = false
  else:
    direction.texture = assets[parts[0]]
  strike.texture = assets[parts[1]]

func finish():
  finished.position += Vector2(randi_range(-10, 10), randi_range(-5, 5))
  var tween = create_tween()
  finished.rotation = randf_range(-2*PI/16, 0)
  tween.tween_property(finished, "rotation", finished.rotation + PI/16, 0.2)
  tween.set_ease(Tween.EASE_OUT)
  tween.set_trans(Tween.TRANS_CUBIC)
  animation_player.play("finish")
  
func miss():
  animation_player.play("miss")
