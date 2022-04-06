extends ColorRect

# Função executada quando cena é carregada
func _ready():

	# Conectar sinal à função
	TransitionScene.connect("animationMiddle", self, "onChangeSceneAnimationMiddle")

	

# Função para iniciar a animação de troca de cena quando o Timer acabar
func _on_Timer_timeout():
	TransitionScene.startAnimation()

export (String) var citySceneSpawn
export (Vector2) var citySpawnPosition
	
# Função para mudar de cena no meio da animação
func onChangeSceneAnimationMiddle():

	# Trocar de cena
	if citySceneSpawn and citySpawnPosition:
		Global.player.startPosition = citySpawnPosition
		Global.player.scene = citySceneSpawn
		get_tree().change_scene(citySceneSpawn)
