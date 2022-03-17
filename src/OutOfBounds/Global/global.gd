extends Node2D

var dialogRootPath = "res://Dialogs/Phase1/"
var phases = [
	[Dialog.new(dialogRootPath + "Chapter2/1firstContact.json", false, false), Dialog.new("Chapter3/2mechanicOutSide", false, false), Dialog.new("Chapter3/3firstBockEncounter", false, false), Dialog.new("Chapter3/4secondBockEncounter", false, false), Dialog.new("Chapter3/5secretaryBockArguing", false, false), Dialog.new("Chapter4/6firstComputerEncounter", false, false)],
]
var phase1 = Phase.new("Fase 1", false, false, phases[0])

var player = Player.new("Astronauta", "", 0.00, 0.00)
