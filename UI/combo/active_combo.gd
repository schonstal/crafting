extends Control

var combo:Combo

@export var item_height := 100.0

@onready var nine_patch_rect: NinePatchRect = $NinePatchRect
@onready var instructions: Control = $Instructions
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var tween:Tween

func _process(delta: float) -> void:
  if Input.is_action_just_pressed("previous"):
    change_combo(Combo.new())

func change_combo(new_combo: Combo):
  combo = new_combo
  
  nine_patch_rect.size.y = 52
  nine_patch_rect.position.y = -52
  
  instructions.size.y = 0
  
  var new_size = Vector2(
    nine_patch_rect.size.x,
    combo.steps.size() * item_height + 100
  )
  var new_position = Vector2(
    nine_patch_rect.position.x,
    40
  )
  
  var instructions_size = Vector2(instructions.size.x, new_size.y)
  
  if tween != null:
    tween.stop()
  tween = create_tween()
  
  tween.set_ease(Tween.EASE_OUT)\
       .set_trans(Tween.TRANS_QUART)\
       .tween_property(nine_patch_rect,"position", new_position, 0.2)
  
  tween.chain()\
       .set_trans(Tween.TRANS_ELASTIC)\
       .tween_property(nine_patch_rect, "size", new_size, 0.3)
  
  tween.parallel()\
       .tween_property(instructions, "size", instructions_size, 0.3)
