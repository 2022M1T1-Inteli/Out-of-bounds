extends CanvasLayer

func _ready():
	$NinePatchRect.visible = false
	
	# Conectar sinal de mudança de diálogo à função
	Global.connect("dialogChange", self, "onDialogChange")

func onDialogChange():
	# Loop em estado global do jogo para setar texto do Label
	for phase in Global.phases:
		
		var invertedDialogs = phase.dialogs.duplicate()
		invertedDialogs.invert()
		
		for dialog in invertedDialogs:
			if dialog.completed:
				if dialog.objective:
					$NinePatchRect/Label.text = dialog.objective
					$NinePatchRect.visible = true
				break
	
