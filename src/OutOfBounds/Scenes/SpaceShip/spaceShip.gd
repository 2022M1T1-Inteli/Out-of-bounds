extends Node2D

export (String) var desertScenePath
export (Vector2) var desertSpawnPosition

# Função que executa quando o Player chega perto da porta do deserto
func _on_DesertDoor_body_entered(body): 
	if desertScenePath and desertSpawnPosition:
		Global.player.startPosition = desertSpawnPosition
		get_tree().change_scene(desertScenePath)
		Global.player.scene = desertScenePath
