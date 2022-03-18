extends Node2D

# Função que executa quando o Player chega perto da porta do world
func _on_WorldDoor_body_entered(_body):
	get_tree().change_scene("res://Scenes/World/world.tscn")
