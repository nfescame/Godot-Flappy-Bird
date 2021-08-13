extends Node2D

var Start_game = true 
onready var Player_ref = get_node("Bird")
onready var Backgroud_ref = get_node("Background/AnimationPlayer")
onready var Pipe_spawne_ref = get_node("PipeSpawner")
onready var Interface_ref = get_node("Interface")
onready var Placeholder_img_ref = Interface_ref.get_node("PlaceHolderImage")

func _ready():
	Player_ref.connect("Game_over",Backgroud_ref,"stop_parallax")
	Player_ref.connect("Game_over",Pipe_spawne_ref,"stop_pipe_spawner")
	Player_ref.connect("Game_over",Interface_ref, "on_game_over")
	
func _physics_process(_delta):
	if Input.is_action_just_pressed("Jump") and Start_game:
		Placeholder_img_ref .hide()
		Pipe_spawne_ref.get_node("Timer").start()
		Player_ref.set_physics_process(true)
		Start_game = false


func _on_Interface_reload_game():
	return get_tree().reload_current_scene()
