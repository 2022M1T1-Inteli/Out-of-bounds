extends CanvasLayer

var canBeActive = true

func _ready(): 
	showPauseMenu(false) 
	
func _input(event):
	
	if canBeActive:
		# Checagem se o botão "esq" foi pressionado
		if event.is_action_pressed("ui_cancel"): 
			showPauseMenu(!get_tree().paused) 
			get_tree().paused = !get_tree().paused #sistema de liga e desliga para o jogo 
			setObjectiveVisibility(!get_tree().paused)
		

func showPauseMenu(is_visible): #is_visible é um parâmetro próprio do Godot
	for node in get_children(): 
		node.visible = is_visible
		
		setObjectiveVisibility(!get_tree().paused)
			

# Função executada quando botão de resume é pressionado
func _on_ResumeBtn_pressed():
	showPauseMenu(false)
	get_tree().paused = false 
	
	setObjectiveVisibility(!get_tree().paused)

# Função executada quando botão de voltar é pressionado
func _on_QuitBtn_pressed():
	if get_tree().change_scene("res://Scenes/HomeScreen/homeScreen.tscn") != OK:
		print("Problema mudando de cena")
	showPauseMenu(false)
	get_tree().paused = false 
	
func setObjectiveVisibility(visibility):
	
	# Mostrar ou esconder sistema de objetivos
	if visibility == true:
		if Objectives.get_node("NinePatchRect/Label").text != "":
			Objectives.get_node("NinePatchRect").visible = visibility
	else:
		Objectives.get_node("NinePatchRect").visible = visibility
	
		
	
