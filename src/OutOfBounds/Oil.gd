extends NinePatchRect

# Variável que aciona as condições das funções desse script
var isNear = false
# Array que acumula os pontos.
var arrayScore = []

func _on_Area2D_Oil_body_entered(body):
	isNear = true
	if isNear == true:
# Condição que apaga um elemento Oil correspondente e adiciona pontos pelo tamanho da array
		if Input.is_action_pressed("interact"):
			queue_free()
			arrayScore.append(1)
			Score._score(arrayScore.size())


func _on_Area2D_Oil_body_exited(body):
	isNear = false
