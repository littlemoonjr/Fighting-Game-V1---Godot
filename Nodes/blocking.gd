extends State

func start():
	super()
	await get_tree().create_timer(0.25).timeout
	Character.changeanimation.emit("blocking")

func process_physics(delta : float) -> State:
	if not Character.is_on_floor():
		Character.velocity.y += Character.get_gravity().y * delta
	
	if Character.velocity.y > 0:
		return Machine.get_node("fall")
		
	var direction = Input.get_axis("move_left","move_right")
	var movement = direction * Character.SPEED * 0.05
	
	if movement != 0:
		Character.sprite.flip_h = movement < 0
	
	if direction:
		Character.velocity.x = movement
	else:
		Character.velocity.x = move_toward(Character.velocity.x, 0, Character.SPEED * 0.05)
	
	Character.move_and_slide()
	
	if !Input.is_action_pressed("blocking"):
		return Machine.get_node("idle")
		
	return null
