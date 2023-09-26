extends Node

signal ingot_changed(ingot)
signal combo_changed(combo)

signal combo_finished()
signal combo_failed()
signal combo_succeeded()
signal score_changed(score:int)

# I've just given up trying to be proper
signal shift_left()
signal shift_right()
signal hide_ingot()

signal shake(strength, duration)

signal bellows_pressed()
