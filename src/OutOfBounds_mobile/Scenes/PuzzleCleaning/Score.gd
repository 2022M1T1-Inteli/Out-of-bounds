extends Node

# A variável que vai ser usada para contar a quantidade de pontos
var score = 0

# Função do script Global que será utilizada em todas as cenas Oil
func _score(amount: int):
	score += amount

