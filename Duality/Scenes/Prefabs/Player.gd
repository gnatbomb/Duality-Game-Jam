extends Node2D

export (float) var player_speed = 100

func _ready():
	pass # Replace with function body.

func _process(delta):
	checkIput(delta)
	pass # Replace with function body.


func checkIput(delta):
	if Input.is_action_pressed('w'):
		var motionVector = Vector2.ZERO
		motionVector.y = -player_speed
		self.position += motionVector*delta
	if Input.is_action_pressed('a'):
		var motionVector = Vector2.ZERO
		motionVector.x = -player_speed
		self.position += motionVector*delta
	if Input.is_action_pressed('s'):
		var motionVector = Vector2.ZERO
		motionVector.y = player_speed
		self.position += motionVector*delta
	if Input.is_action_pressed('d'):
		var motionVector = Vector2.ZERO
		motionVector.x = player_speed
		self.position += motionVector*delta

