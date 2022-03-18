extends Node2D

# Função que executa quando o Player chega perto da porta do deserto
func _on_DesertDoor_body_entered(body): 
	get_tree().change_scene("res://Scenes/Desert/desert.tscn")
