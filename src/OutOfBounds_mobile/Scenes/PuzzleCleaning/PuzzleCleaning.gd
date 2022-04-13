extends Node2D

var isNear = false

# Função executada quando a cena é carregada
func _ready():

	# Esconder sistema de objetivos
	Global.overlayVisibility = false

# Loop executado enquanto a cena está rodando
func _process(delta):
	
	
	# Setar o texto da Label
	$CanvasLayer/ColorRect/Label2.text = str(Score.score) + " de 40"
	
	# Checagem se o Puzzle foi concluido
	# Pular puzzle (apenas para acelerar o desenvolvimento)
	if Score.score == 40 or Input.is_action_just_pressed("speed_plus"):
		Global.overlayVisibility = true
		Global.cleaningPuzzleFinished = true
		
		# Muda a cena
		TransitionScene.startAnimation("res://Scenes/Mecanic/Mecanica.tscn")
