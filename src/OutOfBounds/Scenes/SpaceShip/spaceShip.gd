extends Node2D

func _ready():
	if Global.player.startPosition:
		get_node("YSort/Player").global_position = Global.player.startPosition
	else:
		if Global.player.position:
			get_node("YSort/Player").global_position = Global.player.position

export (String) var desertScenePath
export (Vector2) var desertSpawnPosition

# Função que executa quando o Player chega perto da porta do deserto
func _on_DesertDoor_body_entered(body): 
	if desertScenePath and desertSpawnPosition:
		Global.player.startPosition = desertSpawnPosition
		get_tree().change_scene(desertScenePath)
		Global.player.scene = "res://Scenes/Desert/desert.tscn"
