extends Node2D

var dialog1 = "res://Dialogs/Phase1/"
var tutorialPath = "res://Scenes/Tutorial/tutorial.tscn"

func createPath(chapterIndex, gender, finalPath):
	return "res://Dialogs/Phase1/Chapter" + chapterIndex + "/" + gender  + finalPath + ".json"

func _on_Optionmas_pressed():
	var gender = "masculino"
	Global.tutorialDialogPath = "res://Dialogs/Tutorial/" + gender + "Tutorial.json"

	Global.phase1Dialogs = [
		Dialog.new(
			createPath("2", gender, "1FirstContact"),
			false,
			false,
			"Converse com o mecânico (encontre a cidade)"
		),
		Dialog.new(createPath("3", gender, "2FirstJarvisEncounter"),false, false, "Dê um jeito de entrar na sala de Jarvis (dentro da mecânica) e converse com ele"),
		Dialog.new(createPath("3", gender, "3SecretaryJarvisArguing"), false, false, "Volte à nave e interaja com o computador"),
		Dialog.new(createPath("4", gender, "4FirstComputerEncounter"), false, false, "Apresente suas novas ideias para o Jarvis"),
		Dialog.new(createPath("5", gender, "5SecondJarvisEncounter"), false, false, "Termine a conversa com o Jarvis"),
		Dialog.new(createPath("5", gender, "6ThirdJarvisEncounter"), false, false, "Converse com o Jarvis novamente"),
		Dialog.new(createPath("5", gender, "7FourthJarvisEncounter"), false, false, "FIM")
	]

	Global.phases = [Phase.new("Fase 1", false, false, Global.phase1Dialogs)]
	
	TransitionScene.startAnimation(tutorialPath)

func _on_Optionfem_pressed():
	var gender = "feminino"
	Global.tutorialDialogPath = "res://Dialogs/Tutorial/" + gender + "Tutorial.json"

	Global.phase1Dialogs = [
		Dialog.new(
			createPath("2", gender, "1FirstContact"),
			false,
			false,
			"Converse com o mecânico (encontre a cidade)"
		),
		Dialog.new(createPath("3", gender, "2FirstJarvisEncounter"),false, false, "Dê um jeito de entrar na sala de Jarvis (dentro da mecânica) e converse com ele"),
		Dialog.new(createPath("3", gender, "3SecretaryJarvisArguing"), false, false, "Volte à nave e interaja com o computador"),
		Dialog.new(createPath("4", gender, "4FirstComputerEncounter"), false, false, "Apresente suas novas ideias para o Jarvis"),
		Dialog.new(createPath("5", gender, "5SecondJarvisEncounter"), false, false, "Termine a conversa com o Jarvis"),
		Dialog.new(createPath("5", gender, "6ThirdJarvisEncounter"), false, false, "Converse com o Jarvis novamente"),
		Dialog.new(createPath("5", gender, "7FourthJarvisEncounter"), false, false, "FIM")
	]

	Global.phases = [Phase.new("Fase 1", false, false, Global.phase1Dialogs)]
	TransitionScene.startAnimation(tutorialPath)
	
func _on_Optionbin_pressed():
	var gender = "binario"
	Global.tutorialDialogPath = "res://Dialogs/Tutorial/" + gender + "Tutorial.json"

	Global.phase1Dialogs = [
		Dialog.new(
			createPath("2", gender, "1FirstContact"),
			false,
			false,
			"Converse com o mecânico (encontre a cidade)"
		),
		Dialog.new(createPath("3", gender, "2FirstJarvisEncounter"),false, false, "Dê um jeito de entrar na sala de Jarvis (dentro da mecânica) e converse com ele"),
		Dialog.new(createPath("3", gender, "3SecretaryJarvisArguing"), false, false, "Volte à nave e interaja com o computador"),
		Dialog.new(createPath("4", gender, "4FirstComputerEncounter"), false, false, "Apresente suas novas ideias para o Jarvis"),
		Dialog.new(createPath("5", gender, "5SecondJarvisEncounter"), false, false, "Termine a conversa com o Jarvis"),
		Dialog.new(createPath("5", gender, "6ThirdJarvisEncounter"), false, false, "Converse com o Jarvis novamente"),
		Dialog.new(createPath("5", gender, "7FourthJarvisEncounter"), false, false, "FIM")
	]

	Global.phases = [Phase.new("Fase 1", false, false, Global.phase1Dialogs)]

	TransitionScene.startAnimation(tutorialPath)
