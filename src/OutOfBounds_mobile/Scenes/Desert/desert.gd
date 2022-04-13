extends Node2D
# Função executada quando a cena é carregada
func _ready():
	for i in Global.listapedra:
		if not "grama" in i:
			get_node('YSort/YSort/%s' % [i]).queue_free()
		
		
	# Esconder ou mostrar o Stuart
	if Global.phase1DialogIndex == 0:
		$YSort/Stuart.visible = true
	else:
		$YSort/Stuart.queue_free()
	
	# Condições para setar a posição do Player
	if Global.player.startPosition:
		get_node("YSort/Player").global_position = Global.player.startPosition
	else:
		if Global.player.position:
			get_node("YSort/Player").global_position = Global.player.position

export (Vector2) var citySpawnPosition

# Função que executa quando o Player chega perto da porta do world
func _on_CityDoor_body_entered(_body):
	
	# Trocar de cena
	if Global.cityPath and citySpawnPosition:
		Global.player.startPosition = citySpawnPosition
		Global.player.scene = Global.cityPath
		get_tree().change_scene(Global.cityPath)

