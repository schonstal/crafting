extends Node

signal ingot_changed(ingot)
signal combo_changed(combo:Combo)

signal combo_finished()
signal combo_failed(combo:Combo)
signal combo_succeeded(combo:Combo)

signal score_changed(score:int)

# I've just given up trying to be proper
signal shift_left()
signal shift_right()
signal hide_ingot()
signal ingot_destroyed()
signal bellows_pressed()

signal shake(strength, duration)

signal game_over()
signal game_started()
