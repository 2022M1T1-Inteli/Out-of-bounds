extends Node2D

func _ready():
	if Global.player.startPosition:
		get_node("YSort/Player").global_position = Global.player.startPosition
	else:
		if Global.player.position:
			get_node("YSort/Player").global_position = Global.player.position

export (String) var worldScenePath
export (Vector2) var worldSpawnPosition

# Função que executa quando o Player chega perto da porta do world
func _on_WorldDoor_body_entered(_body):
	if worldScenePath and worldSpawnPosition:
		Global.player.startPosition = worldSpawnPosition
		Global.player.scene = worldScenePath
		get_tree().change_scene(worldScenePath)
		
