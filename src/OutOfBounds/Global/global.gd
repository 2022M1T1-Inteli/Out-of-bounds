# Arquivo com as variáveis globais
extends Node2D

# Caminho para diálogos da fase 1
var phase1DialogsRootPath = "res://Dialogs/Phase1/" 

# Variável com as fases do jogo e seus diálogos (cada elemento do Array é outro Array de diálogos)
var phases = [
	[
		Dialog.new(phase1DialogsRootPath + "Chapter2/1firstContact.json", false, false),
		Dialog.new(phase1DialogsRootPath + "Chapter3/2mechanicOutSide", false, false),
		Dialog.new(phase1DialogsRootPath + "Chapter3/3firstBockEncounter", false, false),
		Dialog.new(phase1DialogsRootPath + "Chapter3/4secondBockEncounter", false, false),
		Dialog.new(phase1DialogsRootPath + "Chapter3/5secretaryBockArguing", false, false),
		Dialog.new(phase1DialogsRootPath + "Chapter4/6firstComputerEncounter", false, false)
	]
]

# Instância da Primeira fase
var phase1 = Phase.new("Fase 1", false, false, phases[0])

# Instancia do Player
var player = Player.new("Astronauta", "", null)

#onready var playerPath = "res://Scenes/Player/player.tscn"

# Função para a troca de cena
#func change_scene(new_scene, player_pos):
#	get_tree().change_scene(new_scene)
#	print(player_pos)
##	playerPath.set_position(player_pos)
#
#	$YSortPlayer.set_position(player_pos)
