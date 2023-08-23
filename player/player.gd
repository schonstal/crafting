extends Node2D

signal attacked(attack_name:String)

@onready var combo_manager:ComboManager = $ComboManager
@onready var label:Label = $Label

func _ready() -> void:
  combo_manager.succeeded.connect(_on_combo_succeeded)
  combo_manager.failed.connect(_on_combo_failed)
  combo_manager.progressed.connect(_on_combo_progressed)
  
func _on_combo_succeeded():
  label.text = "combo succeeded"
  
func _on_combo_failed():
  label.text = "combo failed"

func _on_combo_progressed():
  label.text = "progressed"
