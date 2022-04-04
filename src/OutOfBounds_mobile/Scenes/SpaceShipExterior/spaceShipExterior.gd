extends Node2D

#export (PackedScene) var desertScene
export (String) var spaceShipScenePath
export (Vector2) var spaceShipSpawnPosition

# Função que executa quando o Player chega perto da porta do deserto
func _on_SpaceShipDoor_body_entered(body): 
	if spaceShipScenePath and spaceShipSpawnPosition:
		Global.player.startPosition = spaceShipSpawnPosition
		Global.player.scene = spaceShipScenePath
		get_tree().change_scene(spaceShipScenePath)
