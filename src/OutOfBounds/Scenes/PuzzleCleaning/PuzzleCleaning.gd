extends Node2D

onready var plateScore = get_node("YSort/Player/Camera2D/CanvasLayer/NinePatchRect/Score")
onready var timer = get_node("Timer")
onready var plateResult = get_node("YSort/Player/Camera2D/CanvasLayer2/Plate")
onready var plateMessage = get_node("YSort/Player/Camera2D/CanvasLayer2/Plate/MessageWinOrLose")
var timeOver = false


func _ready():
	timer.start()

func _process(delta):
	plateScore.text = "TEMPO: " + str(int(timer.time_left))+ "   " + "SCORE: " + str(Score.score)
	if timeOver == true:
		if Score.score == 40:
			get_tree().paused = true
			plateResult.visible = true
			plateMessage.text = "VENCEU"
#			get_tree().paused = true
		elif Score.score != 40:
			get_tree().paused = true
			plateResult.visible = true
			plateMessage.text = "PERDEU"
#			get_tree().paused = true

	
	

func _on_Timer_timeout_PuzzleCleaning():
	timeOver = true
	
