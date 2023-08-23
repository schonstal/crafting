class_name ComboManager
extends Node

var active_combo:Combo
var progress := 0

signal failed
signal succeeded
signal progressed

func _ready() -> void:
  active_combo = Combo.new()
  start()

func start() -> void:
  for step in active_combo.steps:
    var attack_name = await owner.attacked
    if attack_name != step:
      failed.emit()
      return
    progressed.emit()
      
  succeeded.emit()
