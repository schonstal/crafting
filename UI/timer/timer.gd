extends Control

@export var clock: Clock

@onready var time_label: Label = %TimeLabel
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
  clock.time_increased.connect(_on_time_increased)
  clock.time_decreased.connect(_on_time_decreased)
  clock.time_up.connect(_on_time_up)
  
  EventBus.game_started.connect(_on_game_started)

func _process(delta: float) -> void:
  time_label.text = "%02d" % clock.time_left

func _on_time_increased() -> void:
  animation_player.play("increase")
  
func _on_time_decreased() -> void:
  animation_player.play("decrease")

func _on_time_up() -> void:
  pass

func _on_game_started() -> void:
  animation_player.play("appear")
