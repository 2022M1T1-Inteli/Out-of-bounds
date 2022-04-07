extends Node2D

var isNearDoor = false


# Fun��o executada quando a cena � carregada
func _ready():
	# Esconder ou mostrar o Jarvis
	if (
		Global.phase1DialogIndex == 1
		or Global.phase1DialogIndex == 4
		or Global.phase1DialogIndex == 5
	):
		$YSort/Jarvis.visible = true
	else:
		$YSort/Jarvis.queue_free()

	# Condi��es para setar a posi��o do Player
	if Global.player.startPosition:
		get_node("YSort/Player").global_position = Global.player.startPosition
	else:
		if Global.player.position:
			get_node("YSort/Player").global_position = Global.player.position


# Loop que � executado enquanto a cena est� sendo jogada
func _process(delta):
	# Checar se o jogador est� perto da porta e apertou bot�o "E"
	if isNearDoor and Input.is_action_just_pressed("interact"):
		get_tree().change_scene("res://Scenes/PuzzleLock/puzzleLock.tscn")


export(Vector2) var citySpawnPosition


# Fun��o que executa quando o Player chega perto da porta do world
func _on_CityDoor_body_entered(_body):
	# Trocar de cena
	if Global.cityPath and citySpawnPosition:
		Global.player.startPosition = citySpawnPosition
		Global.player.scene = Global.cityPath
		get_tree().change_scene(Global.cityPath)


# Fun��o executada quando o jogador chega perto da porta
func _on_Area2D_body_entered(body):
	if Global.phase1DialogIndex == 2 and Global.cleaningPuzzleFinished:
		isNearDoor = true
		$YSort/Door/Key.visible = true


# Fun��o executada quando o jogador sai de perto da porta
func _on_Area2D_body_exited(body):
	isNearDoor = false
	$YSort/Door/Key.visible = false
