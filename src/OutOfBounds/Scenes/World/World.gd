extends Node2D

func _ready():
	if Global.player.position:
		get_node("YSort/Player").global_position = Global.player.position

export (String) var desertScenePath
export (Vector2) var desertSpawnPosition

# Função que executa quando o Player chega perto da porta do deserto
func _on_DesertDoor_body_entered(body): 
	if desertScenePath and desertSpawnPosition:
		Global.player.position = desertSpawnPosition
		get_tree().change_scene(desertScenePath)
		

