extends Node2D

@onready var particles: GPUParticles2D = $GPUParticles2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
  pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
  if Input.is_action_just_pressed("strike"):
    explode()
  if Input.is_action_just_pressed("heavy_strike"):
    animation_player.stop()
    animation_player.play("explode")

func explode() -> void:
  particles.emitting = true
  particles.restart()
