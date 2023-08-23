class_name Combo
extends Resource

var states = [
  "Neutral",
  "Left",
  "Right",
  "Up",
  "Down"
]

var strikes = [
  "Light",
  "Heavy"
]

@export var steps:Array = ["Neutral/Light", "Neutral/Heavy"]
