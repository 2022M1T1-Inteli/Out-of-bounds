extends Node2D

# Variável que pega a label score para exibir na placa
onready var plateScore = get_node("YSort/Player/Camera2D/CanvasLayer/NinePatchRect/Score")
# Variável que pega o nó Timer
onready var timer = get_node("Timer")
# Variável que pega a Placa de Resultado do Puzzle
onready var plateResult = get_node("YSort/Player/Camera2D/CanvasLayer2/Plate")
# Variável que pega a label da mensagem da Placa do Resultado
onready var plateMessage = get_node("YSort/Player/Camera2D/CanvasLayer2/Plate/MessageWinOrLose")
var timeOver = false

# função que carrega o timer de 20 segundos
func _ready():
	timer.start()


func _process(delta):
# Exibi o score da variável do script Global Score e mostra o cronômetro do puzzle
	plateScore.text = "TEMPO: " + str(int(timer.time_left))+ "   " + "SCORE: " + str(Score.score)
# Mostra a placa final com o resultado do jogo a partir da variável timeOver que é acionada
	if timeOver == true:
		if Score.score == 40:
			get_tree().paused = true
			plateResult.visible = true
			plateMessage.text = "VENCEU"
		elif Score.score != 40:
			get_tree().paused = true
			plateResult.visible = true
			plateMessage.text = "PERDEU"

# Utiliza a variável acima para ser um acionador de uma condição do Process
func _on_Timer_timeout_PuzzleCleaning():
	timeOver = true
	
