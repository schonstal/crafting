class_name Combo
extends Resource

var states = [
  "Neutral",
  "Left",
  "Right",
  "Up"
]

var strikes = [
  "Light",
  "Heavy"
]

@export var steps:Array = ["Neutral/Light", "Neutral/Heavy"]

var active := false

signal progressed

func _init() -> void:
  steps = []
  for i in range(0, 5):
    steps.push_back("%s/%s" % [states.pick_random(),strikes.pick_random()])
