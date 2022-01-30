extends "res://Scripts/Player.gd"

var smooch
var sprite

func _setControls():
	controlDict = {"up":"P1up","swap":"P1down","left":"P1left","right":"P1right"}

func _on_Area2D_body_entered(body):
	if body.get_name() == "Player2":
		self.setVictoryFlag()
		body.setVictoryFlag()
		MusicController.play_SE(0, "embrace")
		smooch = get_node("Smooch")
		sprite = get_node("Sprite")
		sprite.visible = false
		body.visible = false
		smooch.visible = true
		smooch.play()
		

# on finishing victory animation
func _on_AnimatedSprite_animation_finished():
	win()
