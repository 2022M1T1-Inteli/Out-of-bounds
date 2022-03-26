extends CanvasLayer

var correctCode = "1888"

# Conectando os botões do teclado numérico com o script
func onButtonPressed(buttonIdentifier):
	$Screen.set_text($Screen.get_text() + buttonIdentifier)
	
	for index in $Screen.text.length():
		if $Screen.text[index] == correctCode[index]:
			get_node("HBoxContainer/DefaultLed" + buttonIdentifier).texture = load("res://Assets/PuzzleLock/GreenLed.png")
		else:
			get_node("HBoxContainer/DefaultLed" + buttonIdentifier).texture = load("res://Assets/PuzzleLock/RedLed.png")


func _on_Confirme_pressed():
	var password = str($Screen.text)
	 
	if correctCode == password:
		$Screen.text = " Deu bom "
		
	else: 
		get_tree().change_scene("res://Scenes/PuzzleLock/ErrorScene.tscn")
		
	

# Função de deletar 
func _on_Delete_pressed():
	var text = []
	for i in $Screen.get_text():
		text.append(i) # Cada número da tela, será mapeado e adicionado a uma posição no Array Text
	text.remove(text.size() - 1) # Faz com que a última posição do Array Text seja apagada
	$Screen.set_text("")
	for i in text: 
		$Screen.set_text($Screen.get_text() + i)




func _on_Button2_pressed(extra_arg_0):
	pass # Replace with function body.

