extends ColorRect

# Função executada quando cena é carregada
func _ready():
	TransitionScene.connect("animationMiddle", self, "onChangeSceneAnimationMiddle")
	Objectives.get_node("NinePatchRect").visible = false

# Função para iniciar a animação de troca de cena quando o Timer acabaar
func _on_Timer_timeout():
	TransitionScene.startAnimation()

export (String) var citySceneSpawn
export (Vector2) var citySpawnPosition
	
# Função para mudar de cena no meio da animação
func onChangeSceneAnimationMiddle():
	Objectives.get_node("NinePatchRect").visible = true
	# Trocar de cena
	if citySceneSpawn and citySpawnPosition:
		Global.player.startPosition = citySpawnPosition
		Global.player.scene = citySceneSpawn
		get_tree().change_scene(citySceneSpawn)
