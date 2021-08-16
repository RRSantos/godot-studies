extends Node2D

export var scene_to_go = ""

func _on_Button_pressed():
	Transition.fade_into(scene_to_go)
