# Arquivo para a classe Npc
extends Area2D

# Variáveis de validação
var canInteract = false
var isNear = false

# Variável de caminho até arquivo JSON onde as falas se encontram
var dialogPath: String  

# Variável de velocidade do texto
export(float) var textSpeed = 0.05 

# Load da cena de Diálogo
const dialogPreload = preload("res://Scenes/DialogBox/dialogBox.tscn")

# Função executada quando o Player chega perto do Npc
func onNpcBodyEntered(body):
	if body.name == "Player":
		isNear = true
		
		# Loop no estado do progresso para checar se aquele diálogo já foi completado ou não
		for phase in Global.phases:
			for dialog in phase.dialogs:
				if dialog.path == dialogPath:
					if dialog.active == false && dialog.completed == false:
						
						# Permitir a interação com o Npc
						canInteract = true 
						
						# Mostrar icone do botão "E" em cima do Npc
						$Key.visible = true 

# Função executada quando o Player sai de perto do Npc
func onNpcBodyExited(body):
	if body.name == "Player":
		$Key.visible = false
		isNear = false

# Função para detectar teclas pressionadas
func _input(_event):
	
	# Checar se a tecla "E" foi pressionada
	if Input.is_action_pressed("interact") and isNear == true and canInteract == true: 
		# Esconder icone "E"
		$Key.visible = false 
		
		# Checar em qual diálogo o usuário está
		for phase in Global.phases:
			for dialog in phase.dialogs:
				if dialog.path == dialogPath:
					
					# Setar a fase como ativa
					phase.active = true
					
					# Setar o diálogo como ativo
					dialog.active = true 
					
					# Instanciar Node CanvasLayer
					var canvasLayer = CanvasLayer.new() 
					canvasLayer.name = "CanvasLayer"
					
					# Instanciar cena de diálogo
					var dialogScene = dialogPreload.instance() 
					dialogScene.set("dialogPath", dialogPath)
					dialogScene.set("textSpeed", textSpeed)
					
					# Adicionar o node CanvasLayer
					get_parent().get_node("/root").add_child(canvasLayer) 

					# Adicionar cena do diálogo dentro do CanvasLayer
					get_parent().get_node("/root/CanvasLayer").add_child(dialogScene) 
					
					# Pausar a cena
					get_tree().paused = true 

					# Desabilitar interação com o Npc
					canInteract = false
