extends Node2D

var ingot_scene := preload("res://ingot/ingot.tscn")

@onready var queue: IngotQueue = $Queue
@export var active_position := Vector2(715, 0)

var active_ingot:Ingot

func _ready() -> void:
  for i in range(0, 4):
    var ingot:Ingot = ingot_scene.instantiate()
    queue.push_front(ingot)
  active_ingot = ingot_scene.instantiate()
  active_ingot.position = active_position
  add_child(active_ingot)
  queue.recalculate_positions()

func _process(delta: float) -> void:
  if Input.is_action_just_pressed("next"):
    if active_ingot != null:
      remove_child(active_ingot)
      active_ingot.appear()
      queue.push_front(active_ingot)
    active_ingot = queue.pop_back()
    active_ingot.position = active_position
    active_ingot.appear()
    add_child(active_ingot)
    queue.recalculate_positions()

  if Input.is_action_just_pressed("previous"):
    queue.rotate_left()
