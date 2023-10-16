extends Node2D

@export var can_press := false

var started := false

@onready var appear_animation: AnimationPlayer = $AppearAnimation

func shake():
  EventBus.shake.emit(Vector2(20, 20), 0.2)

func _unhandled_input(event: InputEvent) -> void:
  if !can_press || started:
    return

  if event.is_action_pressed("strike"):  
    appear_animation.play("disappear")
    await appear_animation.animation_finished
    EventBus.emit_signal("game_started")
