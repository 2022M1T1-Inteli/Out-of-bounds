# Arquivo com as vari�veis globais
extends Node2D

# Sinais utilizados no jogo inteiro
signal phaseChange
signal dialogChange

# Variáveis do tutorial
var tutorialDialogPath = "res://Dialogs/Tutorial/tutorial.json"
var tutorialFinished = false

# Caminho para di�logos da fase 1
var phase1DialogsRootPath = "res://Dialogs/Phase1/"

# Di�álogos da primeira fase
var phase1Dialogs = [
	Dialog.new(
		phase1DialogsRootPath + "Chapter2/1firstContact.json",
		false,
		false,
		"Converse com o mecânico (encontre a cidade)"
	),
	Dialog.new(phase1DialogsRootPath + "Chapter3/2firstJarvisEncounter.json", false, false, "Dê um jeito de entrar na sala de Jarvis e converse com ele"),
	Dialog.new(phase1DialogsRootPath + "Chapter3/3secretaryJarvisArguing.json", false, false, "Volte à nave e interaja com o computador"),
	Dialog.new(phase1DialogsRootPath + "Chapter4/4firstComputerEncounter.json", false, false, "Apresente suas novas ideias para o Jarvis"),
	Dialog.new(phase1DialogsRootPath + "Chapter5/5secondJarvisEncounter.json", false, false, "Termine a conversa com o Jarvis"),
	Dialog.new(phase1DialogsRootPath + "Chapter5/6thirdJarvisEncounter.json", false, false, "Converse com o Jarvis novamente"),
	Dialog.new(phase1DialogsRootPath + "Chapter5/7fourthJarvisEncounter.json", false, false, "")
]

# Variável de controle de progressão da fase
var phase1DialogIndex = 0

# Variaveis de Puzzles
var cleaningPuzzleFinished = false
var codePuzzleFinished = false
var lockPuzzleFinished = false

# Vari�vel com as fases do jogo e seus di�logos
var phases = [Phase.new("Fase 1", false, false, phase1Dialogs)]

# Instancia do Player
var player = Player.new("Astronauta", "", null, null)

	
	


