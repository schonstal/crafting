extends Control

@export var clock: Clock

@onready var time_label: Label = %TimeLabel
@onready var pulse_animation_player: AnimationPlayer = $PulseAnimationPlayer


func _ready() -> void:
  clock.time_increased.connect(_on_time_increased)
  clock.time_decreased.connect(_on_time_decreased)
  clock.time_up.connect(_on_time_up)

func _process(delta: float) -> void:
  time_label.text = "%02d" % clock.time_left
  if Input.is_action_just_pressed("up"):
    clock.add_time(-3)
  if Input.is_action_just_pressed("down"):
    clock.add_time(3)

func _on_time_increased() -> void:
  pulse_animation_player.play("increase")
  
func _on_time_decreased() -> void:
  pulse_animation_player.play("decrease")

func _on_time_up() -> void:
  pass
