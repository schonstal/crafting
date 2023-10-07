extends Node2D

func shake():
  EventBus.shake.emit(Vector2(20, 20), 0.2)
