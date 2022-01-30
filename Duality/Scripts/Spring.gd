extends Node2D

func _on_Area2D_body_entered(body):
	print("hi")
	if body.get_name() == "Player1" or body.get_name() == "Player2":
		body.hitSpring()

#func _on_Springs_body_entered(body):
#	if body.get_name() == "Player":
#		body.hitSpring()
