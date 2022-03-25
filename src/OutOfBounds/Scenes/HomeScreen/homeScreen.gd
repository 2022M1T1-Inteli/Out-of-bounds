extends Control

# Botão de Start
func _on_StartBtn_pressed() -> void: 
	if get_tree().change_scene("res://Scenes/Tutorial/tutorial.tscn") != OK:
		print("erro mudando de cena")

# Botão de Créditos
func _on_Credito_pressed() -> void: 
	if get_tree().change_scene("res://Scenes/About/about.tscn") != OK:
		print("erro mudando de cena")

# Botão de sair do jogo
func _on_QuitBtn_pressed(): 
	get_tree().quit()
