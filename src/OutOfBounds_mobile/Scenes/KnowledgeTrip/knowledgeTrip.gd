extends Node2D

var loadingImage = load("res://Assets/KnowledgeTrip/loading.png")

var canSkip = false

# Variável contendo os textos
var texts = ["Olá! Sou o Bock, seu assistente nessa sua jornada! Agora é a hora da viagem do conhecimento! Aqui vamos lapidar as situações que estão acontecendo com você e aprofundá-las.", "Olá viajante, cá estou novamente. Vamos para mais uma viagem?"]

func _ready():

	# Setar textos dependendo de qual viagem do conhecimento usuário está
	$ColorRect/TalkBallon/Label.text = texts[Global.knowledgeTripIndex]

func _process(delta):

	# Checar se usuário apertou botão "espaço" e se ele pode passar para próxima cena
	if Input.is_action_just_pressed("ui_accept") and canSkip:
		$Key.texture = loadingImage
		TransitionScene.startAnimation("res://Scenes/KnowledgeTrip/knowledgeTripInterior.tscn")

func onTalkBallonAnimationFinished():

	# Mostrar icone de "espaço" e permitir usuário a passar para próxima cena
	$Key.visible = true
	canSkip = true

