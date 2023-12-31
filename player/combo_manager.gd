class_name ComboManager
extends Node

var active_combo:Combo

signal switched_combo(combo:Combo)

func _ready() -> void:
  active_combo = Combo.new()
  active_combo.active = true
  EventBus.combo_changed.connect(_on_combo_changed)
  start()

func _on_combo_changed(new_combo:Combo) -> void:
  switch_combo(new_combo)

func switch_combo(combo:Combo):
  active_combo.active = false
  active_combo = combo
  active_combo.active = true
  switched_combo.emit(active_combo)
  start()

func start() -> void:
  var current_combo := active_combo

  for step in current_combo.steps:
    var attack = await owner.attacked
    if !current_combo.active:
      return
    if attack.attack_name != step:
      current_combo.failed.emit()
      EventBus.combo_failed.emit(current_combo)
      return
    current_combo.progressed.emit()
      
  current_combo.succeeded.emit()
  EventBus.combo_succeeded.emit(current_combo)
