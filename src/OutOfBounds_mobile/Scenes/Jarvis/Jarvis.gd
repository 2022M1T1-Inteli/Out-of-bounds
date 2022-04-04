extends "res://Classes/npc.gd"

func _ready():
	# Setar o caminho do primeiro diálogo desse NPC
	if Global.phase1DialogIndex == 1:
		dialogPath = Global.phases[0].dialogs[1].path
	elif Global.phase1DialogIndex == 4:
		dialogPath = Global.phases[0].dialogs[4].path
	elif Global.phase1DialogIndex == 5:
		dialogPath = Global.phases[0].dialogs[5].path
	elif Global.phase1DialogIndex == 6:
		dialogPath = Global.phases[0].dialogs[6].path
	elif Global.phase1DialogIndex == 7:
		dialogPath = Global.phases[0].dialogs[7].path

# Função executada quando o Player chega perto do NPC
func _on_Area2D_body_entered(body):
	onNpcBodyEntered(body)

# Função executada quando o Player sai de perto do NPC
func _on_Area2D_body_exited(body):
	onNpcBodyExited(body)
	
