extends Control

export var dialogPath = "" # Variável de caminho até arquivo JSON onde as falas se encontram
export(float) var textSpeed = 0.05 # Velocidade do texto

var dialog

var phraseNum = 0 # Número da fala que está sendo apresentada
var finished = false # Variável que mostra o status da fala sendo apresentada


func _ready():
	$TextureRect/Timer.wait_time = textSpeed
	dialog = getDialog() # Pegar os diálogos em formato de Array
	assert(dialog, "Dialog not found")
	nextPhrase() # Começar a primeira fala
	
	
				
				
#	print(Global.phases[0])

func _process(delta): # Função em Loop
	if Input.is_action_just_pressed("ui_accept"): # Checar se o botão espaço foi apertado
		if finished:
			nextPhrase() # Avançar para próxima fala
		else:
			$TextureRect/Text.visible_characters = len($TextureRect/Text.text) # Mostrar todo o texto da fala
	
func getDialog() -> Array:
	var f = File.new() # Criar instância de File
	assert(f.file_exists(dialogPath), "File doesn`t exist") # Checar se arquivo de fala existe
	
	f.open(dialogPath, File.READ)
	var json = f.get_as_text()
	
	var output = parse_json(json) # Transformar falas de arquivo JSON em Array
	
	if typeof(output) == TYPE_ARRAY: # Checar se o formato de arquivo foi convertido à Array 
		return output
	else:
		return [] 

func nextPhrase() -> void: # Função para avançar para próxima fala
	if phraseNum >= len(dialog): # Fechar cena se todos os caracteres do diálogo já estiverem na tela
		onDialogFinish()
		return
		
	finished = false
	
	$TextureRect/Name.bbcode_text = dialog[phraseNum]["Name"] # Setar nome com o nome que está no Array
	$TextureRect/Text.bbcode_text = dialog[phraseNum]["Text"] # Setar texto com a fala que está no Array
	
	$TextureRect/Text.visible_characters = 0
	
	while $TextureRect/Text.visible_characters < len($TextureRect/Text.text): # Loop para ir mostrando os caracteres da fala
		$TextureRect/Text.visible_characters += 1
		
		$TextureRect/Timer.start() # Iniciar o Timer
		yield($TextureRect/Timer, "timeout") # Sair do Loop se o timer acabar
	
	finished = true # Setar variável para mostrar que fala terminou
	phraseNum += 1 # Passar para próxima fala
	return

func onDialogFinish():
	for phase in Global.phases:
		for dialog in phase:
			if dialog.path == dialogPath:
				dialog.active = false
				dialog.completed = true
				
	get_tree().paused = false
	queue_free()

func _on_DialogBox_tree_exited():
	pass
#	var npcNode = get_tree().get_root().find_node("Npc",true,false) 
#	npcNode.connect("onDialogFinish",self,"onDialogStart") # Conectar Signal com função para retornar a movimentação do jogador
