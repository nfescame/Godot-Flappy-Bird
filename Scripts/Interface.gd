extends CanvasLayer


signal reload_game

onready var score_label = get_node("Label")
onready var game_over_img = get_node("GameOverImage")
onready var game_over_score = game_over_img .get_node("ScoreLabel")

func _ready():
	score_label.text = str(0)
	
func increase_score(score):
	score_label.text = str(score)
	
func on_game_over(total_score):
	score_label.hide()
	game_over_img.show()
	get_node("Button").show()
	game_over_score.text = "SCORE:" + str(total_score)


func _on_Button_pressed():
	emit_signal("reload_game")
