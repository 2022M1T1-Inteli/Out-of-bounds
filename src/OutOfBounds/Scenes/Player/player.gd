extends KinematicBody2D

var ACCELERATION = 2000
var FRICTION = 2000       #variaveis em maiúsculo para explicitar que são variáveis de física
var MAX_SPEED = 85



enum {
	MOVE,
	ATTACK       #enumera as possíveis ações do personagem. Útil mais pra frente no desenvolvimento.
}

var state = MOVE  # define o estado inicial do personagem como MOVE e velocidade inicial como 0.
var velocity = Vector2.ZERO

func _on_ice_entered(_body):
	ACCELERATION = 100
	FRICTION = 100
	MAX_SPEED = 100
				  #funções para mecânica do gelo
func _on_ice_exit(_body):
	ACCELERATION = 2000
	FRICTION = 2000
	MAX_SPEED = 100

func move_state(delta):    #---função que executa tudo relacionado a movimento e ativa ataques.
	var input_Vector = Vector2.ZERO
	input_Vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_Vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")   #capta os inputs para movimento
	input_Vector = input_Vector.normalized()  #normaliza a resultante, ou seja, subtrai 1 caso a resultante seja maior que 1.
	
	if input_Vector != Vector2.ZERO: #toda vez que a input for diferente de 0:
		animationTree.set('parameters/Idle/blend_position', input_Vector)
		animationTree.set('parameters/Run/blend_position', input_Vector)  #O mecanismo de animação checa qual a atual direção do personagem
		animationTree.set('parameters/Attack/blend_position', input_Vector)
		animationState.travel("Run") #define o nodo de animação "Run" como o atual
		velocity = velocity.move_toward(input_Vector * MAX_SPEED, ACCELERATION * delta) #faz um cálculo com o tempo de frame do jogador para que o o jogo não fique em camera lenta em framerates menores.
	else: #quando a input é igual a 0:
		animationState.travel("Idle") #define o nodo de animação "Idle" como o atual
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta) #zera o vetor velocidade
		
	velocity = move_and_slide(velocity) #arruma colisões bugadas com as paredes
	if Input.is_action_just_pressed("attack"): #caso o botão de ataque esteja pressionado, define o estado como ATTACK
		state = ATTACK
		
func attack_state(_delta):  #função chamada para ativar a anmiação de ataque
	animationState.travel("Attack")
	
func attack_animation_finished(): #função ativada quando a animação de ataque termina. ativada pelo nodo "AnimationPlayer"
	state = MOVE
	
onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree    #variaveis que chamam os nodos responsáveis pela animação
onready var animationState = animationTree.get("parameters/playback")

func _ready(): #ativa o nodo de animações apenas quando o jogo começa
	animationTree.active = true
	print(get_tree().get_root().find_node("Npc",true,false))
	
	var npcNode = get_tree().get_root().find_node("Npc",true,false) 
	npcNode.connect("onDialogStart",self,"onDialogStart") # Conectar Signal com função para tirar a movimentação do jogador
	
	npcNode.connect("onDialogExited",self,"onDialogExited") # Conectar Signal com função para tirar a movimentação do jogador
	
func _physics_process(delta): #função principal do jogo. roda 60 vezes por segundo.
	match state:              #executa a função correta para o momento, MOVE ou ATTACK
		MOVE:
			move_state(delta)
			
		ATTACK:
			attack_state(delta)
			

func onDialogStart():
	MAX_SPEED = 0
	animationTree.active = false
	
func onDialogExited():
	MAX_SPEED = 100
	animationTree.active = true




