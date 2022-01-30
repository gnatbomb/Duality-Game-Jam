extends Node2D

onready var animationPlayer = $AnimationPlayer

func _on_Area2D_body_entered(body):
	if body.get_name() == "Player1" or body.get_name() == "Player2":
		body.hitSpring()
		animationPlayer.play("Boost")
		

#func _on_Springs_body_entered(body):
#	if body.get_name() == "Player":
#		body.hitSpring()
