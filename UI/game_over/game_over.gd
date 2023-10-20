extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var score_label: RichTextLabel = %ScoreLabel
@onready var high_score_label: RichTextLabel = %HighScoreLabel

var can_restart := false

func _ready() -> void:
  EventBus.game_over.connect(_on_game_over)
  
func _unhandled_input(event: InputEvent) -> void:
  if can_restart && event.is_action_pressed("heavy_strike"):
    animation_player.play("fade_out")
    can_restart = false
    await animation_player.animation_finished
    get_tree().reload_current_scene()
    
  
func _on_game_over() -> void:
  animation_player.play("appear")
  await animation_player.animation_finished
  can_restart = true
