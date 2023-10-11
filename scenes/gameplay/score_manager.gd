extends Node

@export var save_path = "user://save.tres"

var save: Save = null
var score: int = 0 :
  set(value):
    score = maxi(0, value)
    if score > save.high_score:
      save.high_score = score
  
    EventBus.score_changed.emit(score)

func _ready() -> void:
  save = load_data()
  EventBus.combo_succeeded.connect(_on_combo_succeeded)
  EventBus.combo_failed.connect(_on_combo_failed)

func load_data() -> Save:
  if ResourceLoader.exists(save_path):
    return load(save_path) as Save
  return Save.new()

func save_data() -> void:
  if save != null:
    ResourceSaver.save(save, save_path)

func _on_combo_succeeded(combo:Combo) -> void:
  score += combo.points
  
func _on_combo_failed(combo:Combo) -> void:
  score -= combo.points
