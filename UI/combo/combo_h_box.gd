extends HBoxContainer

@onready var direction: TextureRect = $Direction
@onready var strike: TextureRect = $Strike

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
