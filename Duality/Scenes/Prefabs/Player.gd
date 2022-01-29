extends Node2D

#EXPORTS
export (float) var maxSpeed = 600
export (float) var acceleration = 1000
export (float) var deceleration = 2000

#GLOBALS
var direction = 0
var inputDirection = 0

func _ready():
	pass # Replace with function body.

func _process(delta):
	checkIput(delta)
	pass # Replace with function body.


func checkIput(delta):
	if Input.is_action_pressed('w'):
		pass
	if Input.is_action_pressed('a'):
		inputDirection = -1
	if Input.is_action_pressed('d'):
		inputDirection = 1
	else:
		inputDirection = 0
