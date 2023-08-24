class_name ComboManager
extends Node

var active_combo:Combo
var progress := 0

signal failed
signal succeeded
signal progressed
signal switched_combo(combo:Combo)

func _ready() -> void:
  active_combo = Combo.new()
  active_combo.active = true
  start()
    
func switch_combo(combo:Combo):
  active_combo.active = false
  active_combo = combo
  active_combo.active = true
  switched_combo.emit(active_combo)

func start() -> void:
  var current_combo := active_combo

  for step in current_combo.steps:
    var attack_name = await owner.attacked
    if !current_combo.active:
      return
    if attack_name != step:
      failed.emit()
      return
    progressed.emit()
      
  succeeded.emit()
