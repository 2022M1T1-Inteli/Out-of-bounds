extends Node2D

var isNear = false

# Função executada quando a cena é carregada
func _ready():
	Objectives.get_node("NinePatchRect").visible = false

# Loop executado enquanto a cena está rodando
func _process(delta):
	
	# Setar o texto da Label
	$CanvasLayer/ColorRect/Label2.text = str(Score.score) + " de 40"
	
	# Checagem se o Puzzle foi concluido
	if Score.score == 40:
		Objectives.get_node("NinePatchRect").visible = true
		Global.cleaningPuzzleFinished = true
		
		# Muda a cena
		get_tree().change_scene("res://Scenes/Mecanic/Mecanica.tscn")
