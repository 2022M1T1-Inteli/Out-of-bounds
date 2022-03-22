extends CanvasLayer

func _ready():
	$NinePatchRect.visible = false
	
	# Conectar sinal de mudança de diálogo à função
	Global.connect("dialogChange", self, "onDialogChange")

func onDialogChange():
	$NinePatchRect.visible = true
	
	# Loop em estado global do jogo para setar texto do Label
	for phase in Global.phases:
		
		var invertedDialogs = phase.dialogs.duplicate()
		invertedDialogs.invert()
		
		for dialog in invertedDialogs:
			if dialog.completed:
				$NinePatchRect/Label.text = dialog.objective
				$NinePatchRect.visible = true
				break
	
