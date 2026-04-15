class_name State
extends Node
@export var animationname : String
@export var Character : Player
@export var Machine : StateMachine

func start() -> void:
	if Character.sprite.sprite_frames.has_animation(animationname):
		Character.changeanimation.emit(animationname)

func exit() -> void:
	pass
	
func process_input(event : InputEvent) -> State:
	return null
	
func process_frame(delta : float) -> State:
	return null
	
func process_physics(delta : float) -> State:
	return null
