extends ColorRect

# Função executada quando cena é carregada
func _ready():
	
	# Mudar path para a nova cidade
	Global.cityPath = "res://Scenes/CityAfter/city.tscn"
	
export (Vector2) var citySpawnPosition

# Função para iniciar a animação de troca de cena quando o Timer acabar
func _on_Timer_timeout():

	# Trocar de cena
	if Global.cityPath and citySpawnPosition:
		Global.player.startPosition = citySpawnPosition
		Global.player.scene = Global.cityPath
		TransitionScene.startAnimation(Global.cityPath)
