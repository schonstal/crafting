extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var score_label: RichTextLabel = %ScoreLabel
@onready var high_score_label: RichTextLabel = %HighScoreLabel

func _ready() -> void:
  EventBus.game_over.connect(_on_game_over)
  
func _on_game_over() -> void:
  animation_player.play("appear")
