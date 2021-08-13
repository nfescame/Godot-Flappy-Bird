extends KinematicBody2D

signal increase_score
signal Game_over

export var gravity = 400
export var jump_speed = -200

var velocity = Vector2()
var score = 0
var can_jump = true

onready var soundJump = get_node("AudioJump")
onready var soundHit = get_node("AudioHit")
onready var soundPoit = get_node("AudioScore")
onready var animation_change = get_node("AnimatedSprite")

func _ready():
	set_physics_process(false)
	
func _physics_process(delta):
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity)
	_jump()
	_color_player()
	
func _jump():
	if Input.is_action_just_pressed("Jump") and can_jump:
		_playSound("EFXjump")
		velocity.y = jump_speed
		
func increase_score():
	_playSound("EFXscore")
	score += 1
	emit_signal("increase_score",score)
	
func _on_Kill_bird():
	can_jump = false
	_playSound("EFXhit")
	get_node("AnimatedSprite").playing = false
	emit_signal("Game_over",score)
	
func _playSound(index:String):
	if (index == "EFXscore"):
		soundPoit.play()
	if (index == "EFXjump"):
		soundJump.play()
	if (index == "EFXhit"):
		soundHit.play()
		
func _color_player():
	if score >= 2:
		animation_change.animation = "idle1"
		
