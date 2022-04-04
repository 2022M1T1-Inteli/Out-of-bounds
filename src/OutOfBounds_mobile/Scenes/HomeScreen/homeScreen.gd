extends Control

# Função executada quando a cena é carregada
func _ready():
	TransitionScene.connect("animationMiddle", self, "onChangeSceneAnimationMiddle")

# Botão de Start
func _on_StartBtn_pressed() -> void:
	TransitionScene.startAnimation()

# Função para trocar de cena
func onChangeSceneAnimationMiddle():
	if Global.tutorialFinished:
		get_tree().change_scene("res://Scenes/SpaceShip/spaceShip.tscn")
	else:
		get_tree().change_scene("res://Scenes/Tutorial/tutorial.tscn")
			

# Botão de Créditos
func _on_Credito_pressed() -> void: 
	if get_tree().change_scene("res://Scenes/About/about.tscn") != OK:
		print("erro mudando de cena")

# Botão de sair do jogo
func _on_QuitBtn_pressed(): 
	get_tree().quit()
