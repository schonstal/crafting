class_name Player
extends Node2D

signal attacked(attack:AttackState)

@onready var combo_manager:ComboManager = $ComboManager

func _ready() -> void:
  Game.player = self
  combo_manager.succeeded.connect(_on_combo_succeeded)
  combo_manager.failed.connect(_on_combo_failed)
  combo_manager.progressed.connect(_on_combo_progressed)
  
func _on_combo_succeeded():
  pass
  
func _on_combo_failed():
  pass

func _on_combo_progressed():
  pass
