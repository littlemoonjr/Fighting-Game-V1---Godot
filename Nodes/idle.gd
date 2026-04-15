extends State

func start():
	super()
	Character.velocity.x = 0
	
func process_input(Event : InputEvent) -> State:
	if Input.is_action_pressed("jump") and Character.is_on_floor():
		return Machine.get_node("jump")
	if Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		return Machine.get_node("move")
	if Input.is_action_pressed("blocking"):
		return Machine.get_node("blocking")
	
	return null
	
func process_physics(delta : float) -> State:
	Character.velocity.y += Character.get_gravity().y * delta
	Character.move_and_slide()
	
	if !Character.is_on_floor():
		return Machine.get_node("fall")
		
	return null
