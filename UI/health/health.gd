extends Control

@onready var player:Player = get_tree().get_nodes_in_group("player")[0]

var progress:float = 1.0

func _ready() -> void:
  player.health_changed.connect(_on_player_health_changed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
  pass

func _on_player_health_changed(new_health:float) -> void:
  progress = new_health/3.0
