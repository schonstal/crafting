extends Node2D

@export var velocity_min := Vector2(-7, -15)
@export var velocity_max := Vector2(7, -5)
@export var acceleration := Vector2(0, 98)
@export var angular_velocity := PI

var velocity := Vector2.ZERO

@onready var graphic: AnimatedSprite2D = $Graphic

func _ready() -> void:
  velocity = Vector2(
    randf_range(velocity_min.x, velocity_max.x),
    randf_range(velocity_min.y, velocity_max.y)
  )
  
  graphic.frame = randi_range(0, graphic.sprite_frames.get_frame_count("armor"))

func _physics_process(delta: float) -> void:
  velocity += delta * acceleration
  position += velocity
  
  rotation += angular_velocity * delta
