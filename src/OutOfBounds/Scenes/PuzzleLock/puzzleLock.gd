extends CanvasLayer

var correctCode = "1888"

func _ready():
	
	PauseMenu.canBeActive = false

# Conectando os botões do teclado numérico com o script
func onButtonPressed(buttonIdentifier):
	if $Screen.text.length() <= 3:
		
		$Screen.set_text($Screen.get_text() + buttonIdentifier)
		
		# Aqui os leds que indicam se a senha está correta, mudam de cor baseando nos valores que o usuário digita
		for index in $Screen.text.length():
			if $Screen.text[index] == correctCode[index]:
				# Caso o usuário tenha digitado o valor correto para a posição correta o led se torna verde
				get_node("HBoxContainer/DefaultLed" + str(index+1)).texture = load("res://Assets/PuzzleLock/GreenLed.png")
			else:
				# Caso o usuário tenha digitado o valor errado o led se torna vermelho
				get_node("HBoxContainer/DefaultLed" + str(index+1)).texture = load("res://Assets/PuzzleLock/RedLed.png")
		$HBoxContainer2/LeftBtn/Button1/AudioStreamPlayer2D.play()
# Função que execulta quando o botão de Confirmar é acionado
func _on_Confirme_pressed():
	var password = str($Screen.text)
	var isFinished 
	
	# Verificação se a senha digitada é a corrte
	if correctCode == password:
		$Screen.text = "" # Mensagem temporária de teste
		isFinished = true
		PauseMenu.canBeActive = true

		# Mostrar sistema de objetivos
		Global.objectiveLabel = "Escute a conversa do Jarvis com a assistente"


		# Mudar de cena
		TransitionScene.startAnimation("res://Scenes/MecanicRoom/mecanicRoom.tscn")
		
	else: 
#		$Screen.text = "Senha inválida!"
		isFinished = false # Define a váriavel para que o timer seja ativado
		
	# Iniciar o timer
	if isFinished == false: 
		$Timer.start(2)
	$HBoxContainer2/RightBtn/Confirme/AudioConf.play()
	
# Função de deletar 
func _on_Delete_pressed():
	var text = $Screen.get_text() # atribui o valor digitado em um variável text
	text.erase(text.length() - 1, 1) # apaga o último caractere digitado
	$Screen.set_text(text) # atribui o valor de text na tela
	
	# muda a cor do let para cinza
	get_node("HBoxContainer/DefaultLed" + str(text.length() + 1)).texture = load("res://Assets/PuzzleLock/DefaultLed.png")
	$HBoxContainer2/LeftBtn/Delete/AudioDelet.play()
# Esta função executa após o Timer acabar 
#func _on_Timer_timeout():
#	$Screen.set_text("") # Limpa o valor da tela
#
#	# Muda a cor de todos os leds para cinza
#	get_node("HBoxContainer/DefaultLed1").texture = load("res://Assets/PuzzleLock/DefaultLed.png")
#	get_node("HBoxContainer/DefaultLed2").texture = load("res://Assets/PuzzleLock/DefaultLed.png")
#	get_node("HBoxContainer/DefaultLed3").texture = load("res://Assets/PuzzleLock/DefaultLed.png")
#	get_node("HBoxContainer/DefaultLed4").texture = load("res://Assets/PuzzleLock/DefaultLed.png")
