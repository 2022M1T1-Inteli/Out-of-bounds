extends ColorRect

# Função executada quando cena é carregada
func _ready():
	
	# Mudar path para a nova cidade
	Global.cityPath = "res://Scenes/CityAfter/city.tscn"
	
	# Conectar sinal à função
	TransitionScene.connect("animationMiddle", self, "onChangeSceneAnimationMiddle")

# Função para iniciar a animação de troca de cena quando o Timer acabar
func _on_Timer_timeout():
	TransitionScene.startAnimation()

export (Vector2) var citySpawnPosition
	
# Função para mudar de cena no meio da animação
func onChangeSceneAnimationMiddle():

	# Trocar de cena
	if Global.cityPath and citySpawnPosition:
		Global.player.startPosition = citySpawnPosition
		Global.player.scene = Global.cityPath
		get_tree().change_scene(Global.cityPath)
