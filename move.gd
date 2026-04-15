extends State

func process_physics(delta : float) -> State:
	if not Character.is_on_floor():
		Character.velocity.y += Character.get_gravity().y * delta
	
	if Character.velocity.y > 0:
		return Machine.get_node("fall")
	
	if Input.is_action_just_pressed("jump") and Character.is_on_floor():
		return Machine.get_node("jump")
	if Input.is_action_pressed("blocking") and Character.is_on_floor:
		return Machine.get_node("blocking")
		
	var direction = Input.get_axis("move_left","move_right")
	var movement = direction * Character.SPEED
	
	Character.sprite.flip_h = movement < 0
	
	if direction:
		Character.velocity.x = movement
	else:
		Character.velocity.x = move_toward(Character.velocity.x, 0, Character.SPEED)
		
	if movement == 0:
		return Machine.get_node("idle")
	
	Character.move_and_slide()
		
	return null
	
