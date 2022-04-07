extends Control

# Botão de Start
func _on_StartBtn_pressed() -> void:
	if Global.tutorialFinished:
		TransitionScene.startAnimation("res://Scenes/SpaceShip/spaceShip.tscn")
	else:
		TransitionScene.startAnimation("res://Scenes/Tutorial/tutorial.tscn")

	$AudioStreamPlayer2D.play()

# Botão de Créditos
func _on_Credito_pressed() -> void: 
	if TransitionScene.startAnimation("res://Scenes/About/about.tscn") != OK:
		print("erro mudando de cena")

# Botão de sair do jogo
func _on_QuitBtn_pressed(): 
	get_tree().quit()
