class_name Ingot
extends Node2D

@export var gradient_texture:GradientTexture1D

@onready var graphic: AnimatedSprite2D = $Graphic
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var success_sound: AudioStreamPlayer = $SuccessSound
@onready var hit_sound: AudioStreamPlayer = $HitSound
@onready var fail_sound: AudioStreamPlayer = $FailSound

var progress := 0
var active_combo: Combo
var temp := 0.0

# Game jam lol
static var combos = [
  Combo.new(), Combo.new(), Combo.new(), Combo.new(),
  Combo.new(), Combo.new(), Combo.new(), Combo.new()
]

var active := false :
  set(value):
    active = value
    if active_combo:
      active_combo.failed.disconnect(_on_combo_failed)
    if active:
      active_combo = combos[type]
      active_combo.ingot_type = type
      active_combo.failed.connect(_on_combo_failed)
      active_combo.progressed.connect(_on_combo_progressed)
      active_combo.succeeded.connect(_on_combo_succeeded)
      EventBus.combo_changed.emit(active_combo)

var type := 0 :
  set(value):
    type = value
    graphic.frame = type

func _ready() -> void:
  self.type = randi_range(0, 7)
  
func _on_combo_failed() -> void:
  fail()
  
func _on_combo_progressed() -> void:
  if temp <= 0:
    fail()
  else:
    hit_sound.pitch_scale = randf_range(0.9, 1.1)
    hit_sound.play()
    
func _on_combo_succeeded() -> void:
  success_sound.play()
  
func fail():
  animation_player.play("shatter")
  fail_sound.play()
  
func _process(delta: float) -> void:
  graphic.modulate = Color(0.5, 0.5, 0.4, 0) + gradient_texture.gradient.sample(clamp(temp - 5, 0, 90)/100.0)

func heat(amount:float) -> void:
  temp += amount

func appear() -> void:
  animation_player.play("appear")
