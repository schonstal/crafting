class_name Ingot
extends Node2D

@export var gradient_texture:GradientTexture1D

@onready var graphic: AnimatedSprite2D = $Graphic
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var progress := 0

# Game jam lol
static var combos = [
  ComboGroup.new(),
  ComboGroup.new(),
  ComboGroup.new(),
  ComboGroup.new(),
  ComboGroup.new(),
  ComboGroup.new(),
  ComboGroup.new(),
  ComboGroup.new()
]

var active := false :
  set(value):
    active = value
    if active_combo:
      active_combo.failed.disconnect(_on_combo_failed)
    if active:
      active_combo = combos[type].get_combo(progress)
      active_combo.failed.connect(_on_combo_failed)
      active_combo.progressed.connect(_on_combo_progressed)
      EventBus.combo_changed.emit(active_combo)
      
var active_combo: Combo

var type := 0 :
  set(value):
    type = value
    graphic.frame = type
    
var temp := 0.0

func _ready() -> void:
  self.type = randi_range(0, 7)
  
func _on_combo_failed() -> void:
  fail()
  
func _on_combo_progressed() -> void:
  if temp <= 0:
    fail()
    
func fail():
  animation_player.play("shatter")
  
func _process(delta: float) -> void:
  graphic.modulate = Color(0.5, 0.5, 0.4, 0) + gradient_texture.gradient.sample(clamp(temp - 5, 0, 90)/100.0)

func heat(amount:float) -> void:
  temp += amount

func appear() -> void:
  animation_player.play("appear")
