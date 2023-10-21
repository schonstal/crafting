class_name ScoreService
extends Resource

@export var save_path = "user://save.tres"

var save: Save = null
var score: int = 0 :
  set(value):
    score = maxi(0, value)
    if score > save.high_score:
      save.high_score = score
  
    EventBus.score_changed.emit(score)

var high_score: int :
  get:
    return save.high_score

func _init() -> void:
  save = load_data()
  EventBus.combo_succeeded.connect(_on_combo_succeeded)
  EventBus.combo_failed.connect(_on_combo_failed)
  EventBus.game_over.connect(_on_game_over)
  EventBus.game_started.connect(_on_game_started)

func load_data() -> Save:
  if ResourceLoader.exists(save_path):
    return load(save_path) as Save
  return Save.new()

func save_data() -> void:
  if save != null:
    var error = ResourceSaver.save(save, save_path)
    if error != 0:
      printerr("Failed to save ", error)

func _on_combo_succeeded(combo:Combo) -> void:
  self.score += combo.points
  
func _on_combo_failed(combo:Combo) -> void:
  self.score -= combo.points

func _on_game_over() -> void:
  save_data()

func _on_game_started() -> void:
  self.score = 0
