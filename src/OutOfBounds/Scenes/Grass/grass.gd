extends Node2D

func create_grass_effect():
	var grassEffect = load("res://Scenes/Grass/grassEffect.tscn") 
	var GrassEffect = grassEffect.instance()
	var world = get_tree().current_scene
	world.add_child(GrassEffect)
	GrassEffect.global_position = global_position
	#explicação do código: 23min do https://www.youtube.com/watch?v=1mI04gPhd3E&list=PL9FzW-m48fn2SlrW0KoLT4n5egNdX-W9a&index=10
	#instanciando a cena GrassEffect pra dentro de world apenas quando esse código roda

func drop_wrench():
	var dropping = load("res://Scenes/WrenchDrop/wrenchDrop.tscn")
	var Dropping = dropping.instance()
	var world = get_tree().current_scene
	world.add_child(Dropping)
	Dropping.global_position = global_position
	
func _on_hurtbox_area_entered(area):
	create_grass_effect()
	var num_drop = randi()%10
	if num_drop == 4:
		drop_wrench()
	queue_free()
