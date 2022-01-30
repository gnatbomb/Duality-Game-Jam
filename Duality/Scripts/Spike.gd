extends Area2D

func _on_Spikes_body_entered(body):
	if body.get_name() == "Player1" or body.get_name() == "Player2":
		body.hitSpike()
		
