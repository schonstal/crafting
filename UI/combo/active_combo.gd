extends Control

var combo:Combo

@export_category("Animation")
@export var start_offset := Vector2(0, 52)

@export_category("Container Size")
@export var item_height := 25.0
@export var combo_buffer_height := 105.0

@onready var nine_patch_rect: NinePatchRect = $NinePatchRect
@onready var instructions: Control = $Instructions
@onready var combo_v_box: VBoxContainer = $Instructions/ComboVBox
@onready var ingot: AnimatedSprite2D = $NinePatchRect/Ingot

var step_scene = preload("res://UI/combo/combo_h_box.tscn")
var progress := 0

var tween:Tween

func _ready() -> void:
  EventBus.combo_changed.connect(_on_combo_changed)
  
func _on_combo_changed(new_combo:Combo) -> void:
  change_combo(new_combo)
  
func _on_combo_progressed() -> void:
  combo_v_box.get_child(progress).finish()
  progress += 1

func _on_combo_failed() -> void:
  combo_v_box.get_child(progress).miss()

func change_combo(new_combo: Combo):
  progress = 0
  
  if combo != null:
    combo.progressed.disconnect(_on_combo_progressed)
    combo.failed.disconnect(_on_combo_failed)
    
  combo = new_combo
  combo.progressed.connect(_on_combo_progressed)
  combo.failed.connect(_on_combo_failed)
  
  update_steps(combo)
  update_rect(combo)
  update_ingot(combo)
  
func update_ingot(combo: Combo) -> void:
  ingot.frame = combo.ingot_type
  
func update_rect(combo: Combo) -> void:
  nine_patch_rect.size.y = start_offset.y
  nine_patch_rect.position.y = -start_offset.y
  
  instructions.size.y = 0
  
  var new_size = Vector2(
    nine_patch_rect.size.x,
    combo.steps.size() * item_height + combo_buffer_height
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

func update_steps(combo: Combo) -> void:
  for child in combo_v_box.get_children():
    child.queue_free()

  for step in combo.steps:
    var node = step_scene.instantiate()
    node.step_name = step
    combo_v_box.add_child(node)
  
