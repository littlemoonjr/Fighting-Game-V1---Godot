class_name Player
extends CharacterBody2D
signal changeanimation
@onready var sprite: AnimatedSprite2D = $sprite
@onready var state_machine: StateMachine = $"State Machine"

@export var SPEED = 300.0
@export var JUMP_VELOCITY = 300.0

func _ready() -> void:
	state_machine.init(self)

func _on_changeanimation(name : String):
	if sprite.sprite_frames.has_animation(name):
		sprite.play(name)
		
func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
	
func _process(delta: float) -> void:
	state_machine.process_frame(delta)
	
func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

"""func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()"""
