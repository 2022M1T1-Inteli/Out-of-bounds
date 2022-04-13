extends Node2D

export (String) var desertScenePath
export (Vector2) var desertSpawnPosition

# Função executada quando cena é carregada
func _ready():
	
	# Checar se o primeiro diálogo já começou
	if Global.phase1DialogIndex == 0:
		
		# Mostrar sistema de objetivos
		Global.overlayVisibility = true
		Global.objectiveLabel = "Saia da nave e converse com o Alienigena"

# Função que executa quando o Player chega perto da porta do deserto
func _on_DesertDoor_body_entered(body): 
	if desertScenePath and desertSpawnPosition:
		Global.player.startPosition = desertSpawnPosition
		get_tree().change_scene(desertScenePath)
		Global.player.scene = desertScenePath
