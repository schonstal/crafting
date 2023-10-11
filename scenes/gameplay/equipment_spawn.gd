extends Node2D

@export var equipment_scene:PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
  EventBus.combo_succeeded.connect(_on_combo_succeeded)

func _on_combo_succeeded(_combo:Combo) -> void:
  var equipment := equipment_scene.instantiate()
  add_child(equipment)
