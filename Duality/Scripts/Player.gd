extends KinematicBody2D

#CONSTANTS
const FLOOR = Vector2(0,-1)

#EXPORTS
export (float) var speed = 100
export (float) var gravity = 20
export (float) var jumpForce = 450
export (float,0,1) var friction = 0.325
export var terminalVelocity = 250
export (Vector2) var startPosition = Vector2(160, 96)

#GLOBALS
var velocity = Vector2.ZERO
onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

func _process(delta):
	movementHandler(delta)
	return

#buffer input to make jump more responsive some ideas how:https://www.reddit.com/r/godot/comments/fifs2k/how_to_jump_make_more_responsive/
func movementHandler(delta):
	var input_vector = Vector2.ZERO
	var on_floor = is_on_floor()
	
	if Input.is_action_pressed("left"):
		input_vector.x += -1
	if Input.is_action_pressed("right"):
		input_vector.x += 1
	if Input.is_action_just_pressed("up"):
		input_vector.y = -1
	
	if(input_vector.x!=0):
		#make sock face correct way
		animationTree.set("parameters/Idle/blend_position",input_vector)
		animationTree.set("parameters/Walk/blend_position",input_vector)
		animationTree.set("parameters/Jump/blend_position",input_vector)
		animationTree.set("parameters/Fall/blend_position",input_vector)
		if(on_floor):
			animationState.travel("Walk")
		velocity.x = input_vector.x*speed
		
	if(input_vector.y!=0):
		animationState.travel("Jump")
		velocity.y = input_vector.y*jumpForce
	
	if(input_vector==Vector2.ZERO and on_floor):
		animationState.travel("Idle")
	elif(!on_floor and velocity.y>=0 and animationState.get_current_node()!="Fall"):
		animationState.travel("Fall")
	print(velocity.y)
	
	velocity = move_and_slide(velocity,FLOOR)
	velocity.x = lerp(velocity.x,0,friction)
	velocity.y += gravity
	velocity.y = clamp(velocity.y,-jumpForce,terminalVelocity)

func hitSpike():
	print("youch!")
	position = startPosition

func hitSpring():
	print("bounce!")
	
#---OLD OLD MOVE--
#	if(input_vector!=Vector2.ZERO):
#		#make sock face correct way
#		animationTree.set("parameters/Idle/blend_position",input_vector)
#		animationTree.set("parameters/Walk/blend_position",input_vector)
#		animationTree.set("parameters/Jump/blend_position",input_vector)
#		#play sock jump or walk anim
#		if(input_vector.y!=0):
#			print("hi")
#			animationState.travel("Jump")
#		if(input_vector.x!=0):
#			animationState.travel("Walk")
#
#		#move sock on x
#		velocity.x = input_vector.x*speed
#		#move sock on y
#		velocity.y = input_vector.y*jumpForce
#		#the above could be cleaner with a matrix [speed,0;0,jumpForce] but ¯\_(ツ)_/¯
#
#	elif (is_on_floor()):
#		animationState.travel("Idle")
#	velocity.y += gravity
#	velocity = move_and_slide(velocity,FLOOR)
#	velocity.x = lerp(velocity.x,0,friction)

#------OLD OLD MOVE------
#if Input.is_action_just_pressed("up") and is_on_floor():
#	velocity.y = -jumpForce
#if Input.is_action_pressed("left"):
#	velocity.x = -speed
#	animationPlayer.play("WalkLeft")
#if Input.is_action_pressed("right"):
#	velocity.x = speed
#	animationPlayer.play("WalkRight")

#velocity.y += gravity
#velocity = move_and_slide(velocity,FLOOR)
#velocity.x = lerp(velocity.x,0,friction)
