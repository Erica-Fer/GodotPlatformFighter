class_name ProcessAirDodge extends FighterFunction

var AirMovement = preload("res://assets/resources/baseFighterFunctions/ft_processAirborne.tres")

func _execute(inFt: Fighter):
	if inFt.grounded:
		inFt._change_fighter_state(inFt.find_state_by_name("Landing"), 0, inFt.FightTable.NormalLandingLag * 2)
		return
	if inFt.get_frame_in_state() < 30:
		inFt.ftVel = inFt.ftVel * 0.85
	else:
		AirMovement._execute(inFt)
