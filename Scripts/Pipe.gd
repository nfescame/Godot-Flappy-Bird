extends Node2D

func _physics_process(_delta):
	translate(Vector2(-2.5,0))
	
func _on_EncreaseScoreArea_body_entered(body):
	body.increase_score()

func turn_physics_off():
	get_node("BottomPipe/CollisionShape2D").set_deferred("disabled", true)
	get_node("TopPipe/CollisionShape2D").set_deferred("disabled", true)
	set_physics_process(false)
	
