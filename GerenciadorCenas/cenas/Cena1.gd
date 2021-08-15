extends Node2D

signal proxima_cena 

func _on_Button_pressed() -> void:
	emit_signal("proxima_cena")
