extends Node2D

export (String) var mecanicScenePath
export (Vector2) var mecanicSpawnPosition

# Função que executa quando o Player chega perto da porta da mecânica
func _on_MecanicDoor_body_entered(_body):
	
	# Checar em qual diálogo o Player está
	if Global.phase1DialogIndex == 3:
		if mecanicScenePath and mecanicSpawnPosition:
			
			# Trocar de cena
			Global.player.startPosition = mecanicSpawnPosition
			Global.player.scene = mecanicScenePath
			get_tree().change_scene(mecanicScenePath)
