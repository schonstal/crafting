extends Node2D

@onready var particles: GPUParticles2D = $GPUParticles2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
  # I'm sorry, but it's a game jam
  await get_tree().process_frame
  Game.player.attacked.connect(_on_attack)
    
func _on_attack(attack_name: String) -> void:
  if attack_name != "Neutral/Light":
    animation_player.stop()
    animation_player.play("explode")
  particles.emitting = true
  particles.restart()
  Engine.time_scale = 0.1
  await get_tree().create_timer(0.3 * Engine.time_scale).timeout
  Engine.time_scale = 1
