extends Sprite2D

@onready var shine_animation: AnimationPlayer = $ShineAnimation

func _on_timer_timeout() -> void:
  shine_animation.play("shine")
