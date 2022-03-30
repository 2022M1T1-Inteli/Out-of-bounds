# Arquivo com as vari�veis globais
extends Node2D

# Sinais utilizados no jogo inteiro
signal phaseChange
signal dialogChange

var tutorialDialogPath = "res://Dialogs/Tutorial/tutorial.json"

# Caminho para di�logos da fase 1
var phase1DialogsRootPath = "res://Dialogs/Phase1/"

# Di�logos da primeira fase
var phase1Dialogs = [
	Dialog.new(
		phase1DialogsRootPath + "Chapter2/1firstContact.json",
		false,
		false,
		"Encontre o mecânico na cidade (siga a estrada)"
	),
	Dialog.new(phase1DialogsRootPath + "Chapter3/2firstJarvisEncounter.json", false, false, ""),
	Dialog.new(phase1DialogsRootPath + "Chapter3/3secretaryJarvisArguing.json", false, false, ""),
	Dialog.new(phase1DialogsRootPath + "Chapter4/4firstComputerEncounter.json", false, false, ""),
	Dialog.new(phase1DialogsRootPath + "Chapter5/5secondJarvisEncounter.json", false, false, ""),
	Dialog.new(phase1DialogsRootPath + "Chapter5/6thirdJarvisEncounter.json", false, false, "")
]

# Vari�vel com as fases do jogo e seus di�logos
var phases = [Phase.new("Fase 1", false, false, phase1Dialogs)]

# Instancia do Player
var player = Player.new("Astronauta", "", null, null)

	
	


