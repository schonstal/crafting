class_name ComboGroup
extends Resource

var combos:Array[Combo] = [
  Combo.new(),
  Combo.new(),
  Combo.new(),
  Combo.new(),
  Combo.new()
]

func get_combo(index:int):
  return combos[index]
