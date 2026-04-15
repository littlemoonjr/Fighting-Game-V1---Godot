extends State

func process_physics(delta : float) -> State:
	Character.velocity.y += Character.get_gravity().y * delta
		
	var movement = Input.get_axis("move_left","move_right") * Character.SPEED
	
	if movement != 0:
		Character.sprite.flip_h = movement < 0
	Character.velocity.x = movement
	Character.move_and_slide()
	
	
	if Character.is_on_floor():
		if movement != 0:
			return Machine.get_node("move")
		return Machine.get_node("idle")
		
	return null
