extends Node2D

@onready var particles: GPUParticles2D = $GPUParticles2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
  # I'm sorry, but it's a game jam
  await get_tree().process_frame
  Game.player.attacked.connect(_on_attack)
    
func _on_attack(attack: AttackState) -> void:
  if attack.big_sparks:
    animation_player.stop()
    animation_player.play("explode")
  particles.emitting = true
  particles.restart()
  Engine.time_scale = 0.01
  for i in range(0,attack.delay_frames):
    await get_tree().process_frame
  Engine.time_scale = 1
