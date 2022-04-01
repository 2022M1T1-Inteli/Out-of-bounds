extends Control

# Variável de caminho até arquivo JSON onde as falas se encontram
export var dialogPath = ""

# Variável de velocidade do texto
export(float) var textSpeed = 0.05

var dialog

# Número da fala que está sendo apresentada
var phraseNum = 0

# Variável que mostra o status da fala sendo apresentada
var finished = false

func _ready():
	# Impossibilitar o jogador de pausar o jogo
	PauseMenu.canBeActive = false
	
	# Setar a propriedade wait_time do Timer com o valor da variável textSpeed
	$TextureRect/Timer.wait_time = textSpeed
	
	# Pegar os diálogos em formato de Array
	dialog = getDialog()
	assert(dialog, "Dialog not found")
	
	# Começar a primeira fala
	nextPhrase()

func _process(_delta):

	# Checar se o botão espaço foi apertado
	if Input.is_action_just_pressed("ui_accept"):
		if finished:
			
			# Avançar para próxima fala
			nextPhrase()
		else:
			
			# Mostrar todo o texto da fala
			$TextureRect/Text.visible_characters = len($TextureRect/Text.text)
	
func getDialog() -> Array:
	# Criar instância de File
	var f = File.new()

	# Checar se arquivo de fala existe
	assert(f.file_exists(dialogPath), "File doesn`t exist")
	
	# Ler o arquivo e transformar as falas em Array
	f.open(dialogPath, File.READ)
	var json = f.get_as_text()
	var output = parse_json(json)
	
	# Checar se o formato de arquivo foi convertido à Array 
	if typeof(output) == TYPE_ARRAY:
		return output
	else:
		return []

# Função para avançar para próxima fala
func nextPhrase() -> void:
	
	# Fechar cena se todos os caracteres do diálogo já estiverem na tela
	if phraseNum >= len(dialog):
		onDialogFinish()
		return
	
	finished = false
	
	# Setar nome e fala que está no Array
	$TextureRect/Name.bbcode_text = dialog[phraseNum]["Name"]
	$TextureRect/Text.bbcode_text = dialog[phraseNum]["Text"]
	
	$TextureRect/Text.visible_characters = 0
	
	# Loop para ir mostrando os caracteres da fala
	while $TextureRect/Text.visible_characters < len($TextureRect/Text.text):
		$TextureRect/Text.visible_characters += 1
		$TextureRect/Timer.start()
		yield($TextureRect/Timer, "timeout")
	
	# Setar variável para mostrar que fala terminou
	finished = true

	# Passar para próxima fala
	phraseNum += 1
	return

# Função executada quando diálogo acaba
func onDialogFinish():
	
	# Checar se o jogador não está no tutorial
	if dialogPath != Global.tutorialDialogPath:

		var dialog = Global.phases[0].dialogs[Global.phase1DialogIndex]
		
		dialog.active = false
		dialog.completed = true

		# Emitir sinal
		Global.emit_signal("dialogChange")
		
		# Aumentar index do diálogo
		Global.phase1DialogIndex += 1
	
		# Condições para fazer jogador jogar os Puzzles depois de determinados diálogos
		if Global.phase1DialogIndex == 2:
			get_tree().change_scene("res://Scenes/PuzzleCleaning/PuzzleCleaning.tscn")
			
		if Global.phase1DialogIndex == 5:
			get_tree().change_scene("res://Scenes/CodePuzzle/codePuzzle.tscn")
			
		if Global.phase1DialogIndex == 6:
			get_tree().change_scene("res://Scenes/TimeCutScene/timeCutScene.tscn")
			
		if Global.phase1DialogIndex == 7:
			get_tree().change_scene("res://Scenes/HomeScreen/homeScreen.tscn")
	
	# Despausar o jogo e fechar a cena do diálogo
	get_tree().paused = false
	queue_free()
	
	# Retornar menu de pausa ao funcionamento normal
	PauseMenu.canBeActive = true
