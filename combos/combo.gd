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
var ingot_type = 0
var points = 10

signal failed
signal succeeded
signal progressed

func _init() -> void:
  steps = []
  for i in range(0, 5):
    steps.push_back("%s/%s" % [states.pick_random(),strikes.pick_random()])
