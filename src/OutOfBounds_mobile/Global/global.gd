# Arquivo com as vari�veis globais
extends Node2D

# Sinais utilizados no jogo inteiro
signal phaseChange
signal dialogChange


# Preload da cutscene
var knowledgeTripInterior1 = preload("res://Scenes/KnowledgeTrip/knowledgeTripInterior.tscn")

# Variável de visibilidade para o mapa e o sistema de objetivos
var overlayVisibility = false
var objectiveLabel = ""

var listapedra = []

# Variáveis do tutorial
var tutorialDialogPath = "res://Scenes/Tutorial/tutorial.tscn"
var tutorialFinished = false


# Di�álogos da primeira fase
var phase1Dialogs = null

# Variável de controle de progressão da fase
var phase1DialogIndex = 0

# Variaveis de Puzzles
var cleaningPuzzleFinished = false
var codePuzzleFinished = false
var lockPuzzleFinished = false

# Vari�vel com as fases do jogo e seus di�logos
var phases = null

# Instancia do Player
var player = Player.new("Astronauta", "", null, null)

# KnowledgeTrip Global State
var knowledgeTripIndex = 0

# City path
var cityPath = "res://Scenes/City/city.tscn"

# Variável para checar se animação da nova cidade já aconteceu
var oldCityAnimationStart = false
var newCityAnimationFinished = false

# Variável de movimentação do Player
var canPlayerMove = true

# Resetar todas as variáveis para recomeçar o jogo
func restartGame():
	# Variável de visibilidade para o mapa e o sistema de objetivos
	overlayVisibility = false
	objectiveLabel = ""

	listapedra = []

	# Variáveis do tutorial
	tutorialDialogPath = null
	tutorialFinished = false

	# Di�álogos da primeira fase
	phase1Dialogs = null

	# Variável de controle de progressão da fase
	phase1DialogIndex = 0

	# Variaveis de Puzzles
	cleaningPuzzleFinished = false
	codePuzzleFinished = false
	lockPuzzleFinished = false

	# Vari�vel com as fases do jogo e seus di�logos
	phases = null

	# Instancia do Player
	player = Player.new("Astronauta", "", null, null)

	# KnowledgeTrip Global State
	knowledgeTripIndex = 0

	# City path
	cityPath = "res://Scenes/City/city.tscn"

	# Variável para checar se animação da nova cidade já aconteceu
	oldCityAnimationStart = false
	newCityAnimationFinished = false

	# Variável de movimentação do Player
	canPlayerMove = true
	
	# Variáveis de outras cenas globais
	Score.score = 0
	TransitionScene.nextScene = ""
	TransitionScene.wasOverlayActive = false
