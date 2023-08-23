extends Node

var active_combo:Combo
var progress := 0

func _ready() -> void:
  active_combo = Combo.new()
  start()

func start() -> void:
  for step in active_combo.steps:
    var attack_name = await _current_attack_name()

func _current_attack_name() -> String:
  var data = await EventBus.player_attacked
  return data["attack_name"]
