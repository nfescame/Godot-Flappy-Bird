extends Area2D

signal Kill_bird

func _on_DetectCollisonArea_body_entered(_body):
	emit_signal("Kill_bird")
