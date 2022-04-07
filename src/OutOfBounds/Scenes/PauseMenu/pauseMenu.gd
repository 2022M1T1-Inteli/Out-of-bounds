extends CanvasLayer

var canBeActive = true


func _ready():
	showPauseMenu(false)


func _input(event):
	if canBeActive:
		# Checagem se o bot�o "esq" foi pressionado
		if event.is_action_pressed("ui_cancel"):
			showPauseMenu(!get_tree().paused)
			get_tree().paused = !get_tree().paused  #sistema de liga e desliga para o jogo

			# Mostrar ou esconder sistema de objetivo e de mapa
			setObjectiveAndMapVisibility(!get_tree().paused)


func showPauseMenu(is_visible):  #is_visible � um par�metro pr�prio do Godot
	for node in get_children():
		node.visible = is_visible

		# Mostrar ou esconder sistema de objetivo e de mapa
		setObjectiveAndMapVisibility(!get_tree().paused)


# Fun��o executada quando bot�o de resume � pressionado
func _on_ResumeBtn_pressed():
	showPauseMenu(false)
	get_tree().paused = false

	# Mostrar ou esconder sistema de objetivo e de mapa
	setObjectiveAndMapVisibility(!get_tree().paused)


# Fun��o executada quando bot�o de voltar � pressionado
func _on_QuitBtn_pressed():
	if TransitionScene.startAnimation("res://Scenes/HomeScreen/homeScreen.tscn") != OK:
		print("Problema mudando de cena")
	showPauseMenu(false)
	get_tree().paused = false


func setObjectiveAndMapVisibility(visibility):
	var sceneName = get_tree().get_current_scene().get_name()

	# Mostrar ou esconder sistema de objetivos
	if visibility == true:
		if Global.objectiveLabel != "":
			Global.overlayVisibility = visibility

		if sceneName != "Tutorial" and sceneName != "PuzzleCleaning":
			Global.overlayVisibility = visibility
	else:
		Global.overlayVisibility = visibility
		Global.overlayVisibility = visibility
		
