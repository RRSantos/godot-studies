extends Node2D

const cena2 = preload("res://cena2.tscn")

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		$TransitionScreen.transition()
		

func _on_Transition_Screen_transitioned():
	$CurrentScene.get_child(0).queue_free()
	$CurrentScene.add_child(cena2.instance())
	print("trocou pra cena 2")
