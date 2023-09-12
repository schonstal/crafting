class_name Shaker
extends Node

@export var noise:Noise
@export var translation := Vector2(100, 100)
@export var rotation := 25.0
@export var decay:Curve
@export var speed := 2.0

var time := 0.0
var amplitude := 0.0
var seed := 0.0

@onready var camera:Camera2D = $'..'

func shake(amount:float, duration:float) -> void:
  speed = 1.0 / duration
  amplitude = clamp(amplitude + amount, 0, 1)
  time = 0
  seed = randf()

func _process(delta) -> void:
  time += delta * speed
  var p := time + seed
  
  camera.offset.x = (noise.get_noise_3d(p, 0, 0) * translation.x) * amplitude
  camera.offset.y = (noise.get_noise_3d(0, p, 0) * translation.y) * amplitude
  camera.zoom.x = 1 + amplitude * 0.005
  camera.zoom.y = camera.zoom.x

  amplitude = clamp(decay.sample(time), 0, 1)
  
  if Input.is_action_just_pressed("previous"):
    shake(1.0, 0.2)
