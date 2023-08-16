class_name Piece
extends Node2D

var progress:float = 0.0
var temp:float = 70.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
  pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta:float) -> void:
  if Input.is_action_just_pressed("strike"):
    progress += 25

func heat(amount:float):
  temp += amount
