extends KinematicBody2D

#CONSTANTS
const FLOOR = Vector2(0,-1)

#EXPORTS
export (float) var speed = 100
export (float) var gravity = 7
export (float) var jumpForce = 350
export (float) var boostForce = 450
export (float,0,1) var friction = 0.325
export var terminalVelocity = 250
export var partnerPath:NodePath
export (int) var playernum

#GLOBALS
var velocity = Vector2.ZERO
onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
var jumpOnCooldown = false
var controlDict = {}
onready var partner = get_node(partnerPath)
onready var startPosition = get_parent().find_node("Dresser1").position

func _ready():
	_setControls()
	
func _process(delta):
	inputHandler(delta)
	return

#set controls
func _setControls():
	pass

#buffer input to make jump more responsive some ideas how:https://www.reddit.com/r/godot/comments/fifs2k/how_to_jump_make_more_responsive/
func inputHandler(delta):
	var input_vector = Vector2.ZERO	
	var on_floor = is_on_floor()
	
	if Input.is_action_just_pressed(controlDict["swap"]):
		swap()
		return input_vector
	
	if Input.is_action_pressed(controlDict["left"]):
		input_vector.x += -1
	if Input.is_action_pressed(controlDict["right"]):
		input_vector.x += 1
	if Input.is_action_just_pressed(controlDict["up"]):
		input_vector.y = -1
	
	if(input_vector.x!=0):
		#make sock face correct way
		animationTree.set("parameters/Idle/blend_position",input_vector)
		animationTree.set("parameters/Walk/blend_position",input_vector)
		animationTree.set("parameters/Jump/blend_position",input_vector)
		animationTree.set("parameters/Fall/blend_position",input_vector)
		if(on_floor):
			animationState.travel("Walk")
			MusicController.play_SE(self.playernum, "steppy")
		velocity.x = input_vector.x*speed
		
	if(input_vector.y!=0 and jumpOnCooldown==false):
		animationState.travel("Jump")
		velocity.y = input_vector.y*jumpForce
		jumpOnCooldown = true
		MusicController.play_SE(self.playernum, "jump")
		
	if (on_floor and jumpOnCooldown and input_vector.y == 0):
		MusicController.play_SE(self.playernum, "land")
		jumpOnCooldown=false
	
	if(input_vector==Vector2.ZERO and on_floor):
		animationState.travel("Idle")
	elif(!on_floor and velocity.y>=0 and animationState.get_current_node()!="Fall"):
		animationState.travel("Fall")
	
	velocity = move_and_slide(velocity,FLOOR)
	velocity.x = lerp(velocity.x,0,friction)
	velocity.y += gravity
	velocity.y = clamp(velocity.y,-jumpForce,terminalVelocity)

func swap():
	print(partner.position,self.position)
	var temp = self.position
	self.position = partner.position
	partner.position = temp
	print(partner.position,self.position)
	
	MusicController.play_SE(self.playernum, "swap")

#take logic of respawn out and into game manager!
func hitSpike():
	MusicController.play_SE(self.playernum, "owie")
	MusicController.play_SE(self.playernum, "death")
	position = startPosition

func hitSpring():
	print("bounce!")
	animationState.travel("Jump")
	velocity.y = -boostForce
	MusicController.play_SE(self.playernum, "spring")
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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
