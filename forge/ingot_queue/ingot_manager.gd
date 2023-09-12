extends Node2D

var ingot_scene := preload("res://ingot/ingot.tscn")

@onready var queue: IngotQueue = $Queue
@export var active_position := Vector2(715, 15)

var active_ingot:Ingot

func _ready() -> void:
  for i in range(0, 4):
    var ingot:Ingot = ingot_scene.instantiate()
    queue.push_front(ingot)
  active_ingot = ingot_scene.instantiate()
  active_ingot.position = active_position
  add_child(active_ingot)
  queue.recalculate_positions()
  
  # This is not the right way to do this but I don't care.
  EventBus.shift_left.connect(_on_shift_left)
  EventBus.shift_right.connect(_on_shift_right)
  
func _on_shift_left():
  pass
  
func _on_shift_right():
  if active_ingot != null:
    remove_child(active_ingot)
    active_ingot.appear()
    active_ingot.active = false
    queue.push_front(active_ingot)
    
  active_ingot = queue.pop_back()
  active_ingot.active = true
  active_ingot.position = active_position
  active_ingot.appear()
  add_child(active_ingot)
  
  queue.recalculate_positions()
