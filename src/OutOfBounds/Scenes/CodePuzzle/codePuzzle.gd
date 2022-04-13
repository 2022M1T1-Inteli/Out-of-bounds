extends Node2D

# Variáveis de cores
var white = Color(255, 255, 255)
var black = Color(0, 0, 0)
var red = Color(1, 0, 0)
var green = Color(0, 1, 0)

# Variáveis de localização entre os Labels
var cursor = 1
var lengthBox = 0
var currentType = null

# Array com a sequência correta
var correctCode = ["1E", "2C", "3A", "4D", "5B"]

# Função que roda em Loop enquanto o jogo está sendo executado
func _process(delta):
	
	# Condição para habilitar ou desabilitar o uso do botão de verificar a sequência
	if cursor >= 5 and lengthBox >= 2:
		$ColorRect/NinePatchRect/Verify.disabled = false
	else:
		$ColorRect/NinePatchRect/Verify.disabled = true
		

# Função executada quando usuário aperta um botão
func onButtonPressed(content):
	
	# Checar se o identificado do botão é válido
	if content != null:
		
		# Checar se o tipo do botão é diferente do tipo anterior
		if typeof(content) == TYPE_INT and currentType == TYPE_INT:
			return
		if typeof(content) == TYPE_STRING and currentType == TYPE_STRING:
			return
		if lengthBox == 0 and typeof(content) == TYPE_STRING:
			return
		if lengthBox == 1 and typeof(content) == TYPE_INT:
			return
		
		# Checar se a label está completa e passar para a próxima
		if lengthBox >= 2:
			cursor += 1
			lengthBox = 0
			
		# Parar quando todas as labels estiverem completas
		if cursor > 5:
			return
		
		# Resetar o valor do curso, ou seja, ir para a primeira label.
		if cursor == 0:
			cursor = 1
			
		# Setar label com o valor que o usuário apertou
		get_node("ColorRect/NinePatchRect/Cor%d/Conjunto%d" % [cursor, cursor]).text += str(content)
		
		# Desabilitar botão apertado
		get_node("ColorRect/NinePatchRect/Button" + str(content)).disabled = true
		
		# Passar para o próximo caractere do label
		lengthBox += 1
		
		# Reiniciar o ciclo da tipagem dos caracteres dos labels
		currentType = typeof(content)
		
		$AudioStreamPlayer.play()
	# Resetar tipagem dos valores inseridos
	content = null

# Função executada quando o botão de verificar é pressionado
func _on_Verify_pressed():
	
	#Reinicando as variaveis de localizacao entre os labels
	cursor = 0
	lengthBox = 0
	
	#Variavel para checar se a sequencia apresentada esta correta
	var finished = true
	
	#Loop para checar os valores inseridos nos labels
	for idx in range(1, 6):
		
		# Variáveis com os elementos
		var elementLabel = get_node("ColorRect/NinePatchRect/Cor%d/Conjunto%d" % [idx, idx])
		var colorReact = get_node("ColorRect/NinePatchRect/Cor%d" % [idx])
		
		#Condicao caso os valores inseridos estejam na ordem correta ou não
		if elementLabel.text == correctCode[idx-1]:
			colorReact.color = green
			$Win.play()
		else:
			colorReact.color = red
			finished = false
			$Error.play()
			
		# Loop em todas as Labels para desabilitar os botões
		for item in [1, 2, 3, 4, 5, "A", "B", "C", "D", "E"]:
			get_node("ColorRect/NinePatchRect/Button" + str(item)).disabled = true
			
	# Checagem para começar o Timer
	if finished == false:
		$Timer.start()
		return

	# Voltar status do menu de pausa como ativo
	PauseMenu.canBeActive = true

	# Setar variável mostrando que puzzle acabou
	Global.codePuzzleFinished = true

	# Mudar de cena
	TransitionScene.startAnimation("res://Scenes/Mecanic/Mecanica.tscn")

# Função executada quando o Timer acabar
func _on_Timer_timeout():
	
	# Loop em todas as Labels para habilitar os botões
	for item in [1, 2, 3, 4, 5, "A", "B", "C", "D", "E"]:
		get_node("ColorRect/NinePatchRect/Button" + str(item)).disabled = false
		
	# Loop para resetar os conteúdos e mudar as cores dos Labels
	for idx in range(1, 6):
		get_node("ColorRect/NinePatchRect/Cor%d" % [idx]).color = black
		get_node("ColorRect/NinePatchRect/Cor%d/Conjunto%d" % [idx, idx]).text = ""
