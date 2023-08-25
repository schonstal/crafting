extends Control

var combo:Combo

@export var item_height := 100.0
@onready var nine_patch_rect: NinePatchRect = $NinePatchRect

var tween:Tween

func _process(delta: float) -> void:
  if Input.is_action_just_pressed("previous"):
    change_combo(Combo.new())

func change_combo(new_combo: Combo):
  combo = new_combo
  
  nine_patch_rect.size.y = 52
  nine_patch_rect.position.y = -52
  
  var new_size = Vector2(
    nine_patch_rect.size.x,
    combo.steps.size() * item_height + 100
  )
  var new_position = Vector2(
    nine_patch_rect.position.x,
    40
  )
  
  if tween != null:
    tween.stop()
  tween = create_tween()
  
  tween.set_ease(Tween.EASE_OUT)
  tween.set_trans(Tween.TRANS_QUART)
  tween.tween_property(nine_patch_rect,"position", new_position, 0.2)
  tween.set_trans(Tween.TRANS_ELASTIC)
  tween.tween_property(nine_patch_rect, "size", new_size, 0.3)
