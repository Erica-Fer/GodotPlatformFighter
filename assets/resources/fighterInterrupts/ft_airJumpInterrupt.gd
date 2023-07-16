class_name AirJumpInterrupt extends Interrupt

func _execute(inFt: Fighter) -> bool:
	var tempInput = inFt.input_controller.get_movement_vector()
	var convInput = Vector3(tempInput.x, -tempInput.y, 0)
	if inFt.input_controller.jump_pressed() and inFt.jumps < inFt.FightTable.NumberOfJumps:
		inFt.grounded = false
		inFt.jumps += 1
		inFt.ftVel.y = inFt.FightTable.InitialVerticalJumpVelocity * inFt.FightTable.VerticalAirJumpMultiplier
		inFt.ftVel.x = convInput.x * inFt.FightTable.HorizontalAirJumpMultiplier
		if inFt.ftVel.x >= 0:
			inFt._change_fighter_state(inFt.find_state_by_name("JumpAerialF"))
		else:
			inFt._change_fighter_state(inFt.find_state_by_name("JumpAerialB"))
		return true
	return false