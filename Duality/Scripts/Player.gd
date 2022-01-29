extends KinematicBody2D

#CONSTANTS
const FLOOR = Vector2(0,-1)

#EXPORTS
export (float) var speed = 100
export (float) var gravity = 20
export (float) var jumpForce = 500
export (float,0,1) var friction = 0.2

#GLOBALS
var velocity = Vector2.ZERO

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	movementInputHandler()
	return

#try rigid body?
#buffer input to make jump more responsive some ideas how:https://www.reddit.com/r/godot/comments/fifs2k/how_to_jump_make_more_responsive/
func movementInputHandler():
	if Input.is_action_just_pressed('w') and is_on_floor():
			velocity.y = -jumpForce
	if Input.is_action_pressed('a'):
		velocity.x = -speed
	if Input.is_action_pressed('d'):
		velocity.x = speed
	
	velocity.y += gravity
	velocity = move_and_slide(velocity,FLOOR)
	velocity.x = lerp(velocity.x,0,friction)
