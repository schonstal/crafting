class_name ComboManager
extends Node

var active_combo:Combo
var progress := 0

signal failed
signal succeeded
signal progressed

func _ready() -> void:
  active_combo = Combo.new()
  active_combo.active = true
  start()

func _process(delta: float) -> void:
  if Input.is_action_just_pressed("down"):
    active_combo.active = false
    active_combo = Combo.new()
    active_combo.active = true
    start()

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
