extends Position2D
signal stop_pipe

const PIPE = preload("res://Scenes/Pipe.tscn")

onready var timer = get_node("Timer")

func spaw_pipe():
	var pipe_instanced = PIPE.instance()
	randomize()
	var random_pipe_position = rand_range(-90,45)
	pipe_instanced.position = Vector2(0,random_pipe_position)
	var _connect = connect("stop_pipe",pipe_instanced,"turn_physics_off")
	add_child(pipe_instanced)
	
func _on_Timer_timeout():
	timer.start()
	spaw_pipe()
	
func stop_pipe_spawner(_score):
	timer.stop()
	emit_signal("stop_pipe")
