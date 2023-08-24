extends Node2D

@export var gradient_texture: GradientTexture1D

@onready var fire: Sprite2D = $Fire
@onready var texture_progress_bar: TextureProgressBar = $TextureProgressBar
@onready var ingot: Ingot = owner

func _process(delta: float) -> void:
  texture_progress_bar.value = ingot.temp
  texture_progress_bar.tint_over = gradient_texture.gradient.sample(ingot.temp/100.0)
  texture_progress_bar.tint_progress = texture_progress_bar.tint_over
  
  if ingot.temp >= 85:
    fire.visible = true
  else:
    fire.visible = false
    
