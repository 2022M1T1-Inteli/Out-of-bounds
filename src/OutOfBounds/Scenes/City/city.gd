extends Node2D

# Função executada quando a cena é carregada
func _ready():
	$YSort/Player/Camera2D.current = true
	
	
	# Condições para setar a posição do Player
	if Global.player.startPosition:
		get_node("YSort/Player").global_position = Global.player.startPosition
	else:
		if Global.player.position:
			get_node("YSort/Player").global_position = Global.player.position
			
	if Global.oldCityAnimationStart:
		Global.canPlayerMove = false
		Global.overlayVisibility = false
		$AnimationPlayer.play("oldMecanicAnimation")

export (String) var desertSceneSpawn
export (Vector2) var desertSpawnPosition

# Função que executa quando o Player chega perto da porta do world
func _on_DesertDoor_body_entered(_body):
	
	# Trocar de cena
	if desertSceneSpawn and desertSpawnPosition:
		Global.player.startPosition = desertSpawnPosition
		Global.player.scene = desertSceneSpawn
		get_tree().change_scene(desertSceneSpawn)


export (String) var mecanicSceneSpawn
export (Vector2) var mecanicSpawnPosition

func _on_MecanicDoor_body_entered(body):
	
	# Trocar de cena
	if mecanicSceneSpawn and mecanicSpawnPosition:
		Global.player.startPosition = mecanicSpawnPosition
		Global.player.scene = mecanicSceneSpawn
		get_tree().change_scene(mecanicSceneSpawn)

func onOldMecanicAnimationFinished():
	Global.canPlayerMove = true
	Global.oldCityAnimationStart = false
	Global.overlayVisibility = true
	TransitionScene.startAnimation("res://Scenes/TimeCutScene/timeCutScene.tscn")
