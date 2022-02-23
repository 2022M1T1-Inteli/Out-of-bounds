extends KinematicBody2D

var ACCELERATION = 2000
var FRICTION = 2000
var MAX_SPEED = 100
var velocity = Vector2.ZERO


func _on_ice_entered(body):
	ACCELERATION = 100
	FRICTION = 100
	MAX_SPEED = 100

func _on_ice_exit(body):
	ACCELERATION = 2000
	FRICTION = 2000
	MAX_SPEED = 100


var animationPlayer = null

func _ready():
	animationPlayer = $AnimationPlayer

func _physics_process(delta):
	var input_Vector = Vector2.ZERO
	input_Vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_Vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	input_Vector = input_Vector.normalized()
	
	if input_Vector != Vector2.ZERO:
		if input_Vector.x > 0:
			animationPlayer.play("RunRight")
			
		elif input_Vector.x < 0:
			animationPlayer.play("RunLeft")
		elif input_Vector.y > 0:
			animationPlayer.play("RunDown")
		else:
			animationPlayer.play("RunUp")
		velocity = velocity.move_toward(input_Vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		if Input.is_action_just_released("move_right"):
			animationPlayer.play("IdleRight")
		elif Input.is_action_just_released("move_left"):
			animationPlayer.play("IdleLeft")
		elif Input.is_action_just_released("move_up"):
			animationPlayer.play("IdleUp")
		elif Input.is_action_just_released("move_down"):
			animationPlayer.play("IdleDown")
		elif Input.is_action_just_pressed("attack"):
			animationPlayer.play("AttackRight")
	velocity = move_and_slide(velocity)
	
	
	if Input.is_action_just_released("attack"):
		animationPlayer.play("AttackRight")

func _on_VoltarBtn_pressed() -> void:
	get_tree().change_scene("res://Scenes/TelaInicial/TelaInicial.tscn")
	

func _on_SwordAttackRight_area_entered(area):
	if area.is_in_group("hurtbox"):
		area.take_damage()
