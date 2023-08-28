extends Node2D

var ingot_scene := preload("res://ingot/ingot.tscn")

@onready var queue: IngotQueue = $Queue

func _ready() -> void:
  for i in range(0, 4):
    var ingot:Ingot = ingot_scene.instantiate()
    queue.push_front(ingot)
  queue.recalculate_positions()

func _process(delta: float) -> void:
  if Input.is_action_just_pressed("next"):
    queue.rotate_right()
  if Input.is_action_just_pressed("previous"):
    queue.rotate_left()
