extends Control

@onready var progress_bar: ProgressBar = $ProgressBar
@export var gradient: GradientTexture1D

func _process(delta: float) -> void:
  progress_bar.value += delta
  if progress_bar.value >= 100:
    get_tree().reload_current_scene()
