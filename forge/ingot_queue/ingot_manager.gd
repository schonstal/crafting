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
  active_ingot.active = true
  add_child(active_ingot)
  active_ingot.appear()
  
  queue.recalculate_positions()
  
  EventBus.shift_right.connect(_on_shift_right)
  EventBus.hide_ingot.connect(_on_hide_ingot)
  EventBus.combo_succeeded.connect(_on_combo_succeeded)
  EventBus.ingot_destroyed.connect(_on_ingot_destroyed)
  
func _process(delta: float) -> void:
  for child in queue.get_children():
    if child is Ingot:
      var ingot:Ingot = child
      if ingot.active:
        ingot.temp -= delta * 20
      else:
        if owner.heat > 0:
          ingot.temp += delta * 20 * owner.heat
        else:
          ingot.temp -= delta * 5
          
      ingot.temp = clamp(ingot.temp, 0, 100)
  
func _on_hide_ingot() -> void:
  active_ingot.visible = false

func _on_shift_left() -> void:
  pass

func _on_shift_right() -> void:
    shift_right()
  
func shift_right() -> void:
  if active_ingot != null:
    active_ingot.heat(-100)
    remove_child(active_ingot)
    active_ingot.appear()
    active_ingot.active = false
    queue.push_front(active_ingot)
    
  active_ingot = queue.pop_back()
  active_ingot.active = true
  active_ingot.visible = false
  active_ingot.position = active_position
  active_ingot.appear()
  add_child(active_ingot)
  
  queue.recalculate_positions()

func _on_combo_succeeded() -> void:
  _add_ingot()

func _on_ingot_destroyed() -> void:
  _add_ingot()
  
func _add_ingot() -> void:
  remove_child(active_ingot)
  
  var ingot:Ingot = ingot_scene.instantiate()
  ingot.visible = false
  queue.push_front(ingot)
  
  active_ingot = queue.pop_back()
  active_ingot.visible = false
  active_ingot.active = true
  active_ingot.position = active_position
  add_child(active_ingot)
  active_ingot.appear()
  
  await queue.recalculate_positions()
  
  ingot.appear()
