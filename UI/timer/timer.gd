extends Control

@export var clock: Clock

@onready var time_label: Label = %TimeLabel

func _process(delta: float) -> void:
  time_label.text = "%02d" % clock.time_left
