class_name InputHandler
extends Node

@onready var buffer_timer: Timer = $BufferTimer

var input_intent:String = "Idle" :
  set(value):
    input_intent = value
    intent_changed.emit(value)
    buffer_timer.start()

signal intent_changed(attack_name:String)

func _ready() -> void:
  buffer_timer.timeout.connect(_on_buffer_timeout)
  
func _on_buffer_timeout():
  input_intent = "Idle"
  intent_changed.emit(input_intent)

func _unhandled_input(event: InputEvent) -> void:
  var direction = "Neutral"
  if Input.get_axis("down", "up") > 0:
    direction = "Up"
  elif Input.get_axis("down", "up") < 0:
    direction = "Down"
  elif Input.get_axis("left", "right") < 0:
    direction = "Left"
  elif Input.get_axis("left", "right") > 0:
    direction = "Right"
    
  if event.is_action_pressed("heavy_strike"):
    self.input_intent = "Attack/%s/Heavy" % direction
  elif event.is_action_pressed("strike"):
    self.input_intent = "Attack/%s/Light" % direction
