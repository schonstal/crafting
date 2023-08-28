class_name IngotQueue
extends Node2D

func rotate_right():
  move_child(get_child(-1), 0)
  recalculate_positions()
  
func rotate_left():
  move_child(get_child(0), -1)
  recalculate_positions()

func push_front(ingot:Ingot):
  add_child(ingot)
  move_child(ingot, 0)

func pop_back() -> Ingot:
  if get_child_count() > 0:
    var child = get_child(-1)
    remove_child(child)
    return child
  return null

func recalculate_positions():
  var index = 0
  for child in get_children():
    var tween = create_tween()
    tween.tween_property(child, "position", Vector2(index * 80, 0), 0.2)\
         .set_trans(Tween.TRANS_CUBIC)\
         .set_ease(Tween.EASE_OUT)
    index += 1
