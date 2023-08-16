extends Node2D

var pieces: Array[Piece] = []

func next_piece() -> Piece:
  return pieces.pop_back()
  
func previous_piece() -> Piece:
  return pieces.pop_front()
  
func add_piece(piece:Piece) -> void:
  pieces.push_front(piece)
